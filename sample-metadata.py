#! /usr/bin/env python

"""sample-metadata.py
Author: Bryce Mecum (mecum@nceas.ucsb.edu)

Samples scientific metadata from the holdings on DataOne.

Overview:
---------

This script was written to allow sampling (w/o replacement) of scientific
metadata on a per- Member Node basis for the purpose of analyzing the metadata
holdings of DataOne Member Nodes. The script is executed by calling

      python sample-metadata.py

and produces a sample of scientific metadata in the `results` folder in the
working directory (the directory your shell was in when you ran the above
comamnd). By default, the script will query across all member nodes on the
production Coordinating Node (cn.dataone.org) and attempt to sample 250
documents from each Member Node. When a Member Node doesn't have 250 documents,
all documents from the Member Node are downloaded instead of a sampled.

Settings that can be customized by command-line switches are:

  - Whether queries are run against the production or test CN
  - Target a single Member Node rather than all
  - Target a sample size other than 250
  - Skip downloading scientific metadata (XML) files
  - Only sample documents with attribute-level metadata

The script creates a number of tracking (papertrail) CSV files which are used
for both the script's function as well as to help analyse the runs of the
script. The script also creates a number of files, two (scimeta + sysmeta) for
each document sampled. Both the tracking and scimeta/sysmeta files are created
in the 'results' directory:

```
result/
|-- TFRI # A Member Node
|   ├-- Ecological_Metadata_Language_version_2.0.1
|   |   └-- xml
|   |       ├-- 00000-metadata.xml
|   |       ├-- 00001-metadata.xml
|   |       ├-- 00002-metadata.xml
|   |       └-- 00004-metadata.xml
|   ├-- Ecological_Metadata_Language_version_2.1.1
|   |   └-- xml
|   |       └-- 00003-metadata.xml
|   └-- sysmeta
|       └-- xml
|           ├-- 00000-sysmeta.xml
|           ├-- 00001-sysmeta.xml
|           ├-- 00002-sysmeta.xml
|           ├-- 00003-sysmeta.xml
|           └-- 00004-sysmeta.xml
├-- documents.csv # All documents on the Coordinating Node
├-- sampled_documents.csv # Successfully sampled documents
├-- shuffled_documents.csv # Documents shuffled by Member Node
└-- statistics.csv # Statistics about the sampling process
```


Before Running:
-------------

This script was designed and tested using Python 2.7.10. Using another version
of Python 2.7.x should work but may produce incorrect results.

Extra packages required:
    - pandas (install with `pip install pandas`)


Running:
--------

Get a random sample (w/o replacement) of 250 documents across all member nodes.
If a member node doesn't have 250 documents, all documents from the node are
used instead of randomly sampled.

$ python sample-metadata.py


Do the same as above but change the sample size of 250 to 50.

$ python sample-metadata.py -s 50


Sample from only one member node (KNB). Note that the full node identifier is
passed with quotes around it.

  $ python sample-metadata.py -n "urn:node:KNB"


Sample only documents with attribute-level metadata and don't download the
scientific metadata for each document:

$ python sample-metadata.py --attribute


Notes:
------

- The coordinating node (CN) is queried for and used to retrieve all documents
regardless of the authoritative MN or replicaMNs.



Command line arguments:
-----------------------

Run `python sample-metadata.py --help` to see this display:

--node (-n): (optional) Member node identifier, e.g. urn:node:KNB
   e.g. Sample only from KNB
        python sample-metadata.py --node "urn:node:KNB"

--sample-size (-s): (optional) Return at least {atleast} objects
   e.g. Target a sample of 100 identifiers from each MN
         python sample-metadata.py --sample-size 100

--test (-t): (optional) Run against the test CN instead of production.
     e.g. python sample-metadata.py --test


--no-download (-d): (optional) Don't download scientific metadata
    e.g. python sample-metadata.py --no-download

--attribute (-a): (optional) Skip documents without attribute-level information.
"""

from urllib import quote_plus
from urllib2 import urlopen
import xml.etree.ElementTree as ET
import re
import sys
import math
import pandas
import numpy
import time
import os
import getopt

def get_num_results(base_url, node=None, attribute=False):
    """Get the number of total results from the CN

    :param node: (Optional) Specify a single node to sample from.
    """

    query_url = base_url + "/query/solr/?fl=identifier,authoritativeMN&q=formatType:METADATA+AND+-obsoletedBy:*"

    # If only sampling one node, append node as criterion.
    # Node, e.g. urn:node:KNB, is searched as *KNB
    # Otherwise, leave datasource criterion off.
    #
    # Here, we're querying the Solr index with 'datasource' (even though
    # authoritativeMN might be better) because the index isn't searchable
    # by authoritativeMN.

    if node is not None:
        node_short_identifier = node.split(":")

        node_short_identifier = node_short_identifier[len(node_short_identifier) - 1]
        query_url += "+AND+datasource:*" + node_short_identifier

    query_url += "&rows=0&start=0"

    request = urllib2.urlopen(query_url)
    response = request.read()
    response_xml = ET.fromstring(response)

    result = response_xml.findall(".//result")

    return int(result[0].get("numFound"))


def get_page(base_url, node=None, page=1, page_size=1000, attribute=False):
    """Get a specific page of results from the Solr index.

    :param node: Node to sample.
    :param page: Page of results to get.
    :param page_size: Number of results in the page.
    """

    identifiers = []
    authoritativeMNs = []

    param_rows = page_size
    param_start = (page - 1) * page_size

    query_url = base_url + "/query/solr/?fl=identifier,authoritativeMN&q=formatType:METADATA+AND+-obsoletedBy:*"

    if node is not None:
        node_short_identifier = node.split(":")
        node_short_identifier = node_short_identifier[len(node_short_identifier) - 1]

        query_url = query_url + "+AND+datasource:*" + node_short_identifier

    query_url = query_url + "&rows=" + \
        str(param_rows) + "&start=" + str(param_start)

    request = urllib2.urlopen(query_url)
    response = request.read()
    response_xml = ET.fromstring(response)
    docs = response_xml.findall(".//doc")

    for d in docs:
        identifier = d.find("./str[@name='identifier']").text
        authoritativeMN = d.find("./str[@name='authoritativeMN']").text

        identifiers.append(identifier)
        authoritativeMNs.append(authoritativeMN)

    return (identifiers, authoritativeMNs)


def get_page_range(base_url, node, page_range, page_size, delay=None, attribute=False):
    """Get a range of pages from the Solr index.

    :param node: Node to sample.
    :param page_range: Range of pages to get.
    :param page_size: Number of results per page.
    :param delay: Delay, in seconds, between requests.
    """

    identifiers = []
    authoritativeMNs = []

    for p in page_range:
        print "Getting page %d" % (p)

        page_result = getPage(base_url, node, page = p)

        identifiers = identifiers + page_result[0]
        authoritativeMNs = authoritativeMNs + page_result[1]

        if delay is not None:
            time.sleep(delay)

    return (identifiers, authoritativeMNs)


def get_documents(base_url, node=None, page_size=1000, delay=None, attribute=False):
    """Get all possible pages from the Solr index.

    :param node: (Optional) Specify a single node to query for.
    :param page_size: Number of results per page.
    :param delay: Delay, in seconds, between requests.

    :output documents.csv: A .csv file of authoritativeMN & identifiers
    """

    documents_csv_filepath = getScriptDirectory() + "/result/documents.csv"


    # Check if the output file exists
    # If it does, we can skip all of this

    if(os.path.isfile(documents_csv_filepath)):
        print("Documents already exist. Moving onto sampling.")

        return


    # Check if result folder has been made

    result_folder = getScriptDirectory() + "/result"

    if not os.path.exists(result_folder):
        os.makedirs(result_folder)


    # Continue fetching fresh results from the server

    num_results = getNumResults(base_url, node);
    print("Total results: %d" % (num_results))

    if num_results is 0:
        print "No results were found. Exiting."
        exit

    pages_required = math.ceil((num_results + 0.0) / page_size)
    print("Total pages: %d" % (pages_required))


    range_of_pages = range(1, int(pages_required) + 1)

    all_pages = getPageRange(base_url, node, range_of_pages, page_size, delay)

    documents_df = pandas.DataFrame({
        'identifier' : all_pages[0],
        'authoritativeMN' : all_pages[1]})

    documents_df.to_csv(documents_csv_filepath, index = False, encoding = "utf-8")

    return


    """Generate a sample of identifiers for each MN
def shuffle_documents():

    :param sample_size: Number of identifiers for each MN

    :output sampled_documents.csv: A .csv file of sampled authoritativeMN & identifiers.
    """

    documents_csv_filepath = getScriptDirectory() + "/result/documents.csv"
    sampled_documents_filepath = getScriptDirectory() + "/result/sampled_documents.csv"
    sample_statistics_filepath = getScriptDirectory() + "/result/statistics.csv"

    # Check if the sample already exists
    if(os.path.isfile(sampled_documents_filepath)):
        print "Sample already exists. Moving on to getting metadata."

        return

    # Check if result folder has been made
    result_folder = getScriptDirectory() + "/result"

    if not os.path.exists(result_folder):
        os.makedirs(result_folder)


    # Read in the existing documents
    documents = pandas.read_csv(documents_csv_filepath)

    unique_mns = pandas.unique(documents['authoritativeMN'])
    sampled_documents = pandas.DataFrame({'identifier' : [], 'authoritativeMN' : []})

    for mn in unique_mns:
        df_subset = documents[documents.authoritativeMN == mn]
        nrows = df_subset.shape[0]

        print("  Member node " + mn + " has " + str(nrows) + " rows")

        if nrows is 0:
            continue
        elif nrows is 1:
            sampled_rows = [0]
        else:
            if nrows > sample_size:
                rows_to_sample = range(0, nrows)
                sampled_rows = numpy.random.choice(rows_to_sample, sample_size)
            else:
                sampled_rows = range(0, nrows)

        df_subset_filtered = df_subset.iloc[sampled_rows,:]

        sampled_documents = pandas.concat([sampled_documents, df_subset_filtered])

    sampled_documents.groupby(["authoritativeMN"]).aggregate(['count']).to_csv(sample_statistics_filepath, encoding = "utf-8")
    sampled_documents.to_csv(sampled_documents_filepath, index = False, encoding = "utf-8")

    return

def sample_documents(base_url, sample_size=250, delay=None, download=True, attribute=False):

    """Get and save meta and object XML from node

    :param delay: Delay, in seconds, between getting documents.

    :output Subdirectories of the folder `result`, in the form of
             `result/{NODE_IDENTIFIER}/{INDEX}-{meta-object}.xml`
    """

    sampled_documents_filepath = getScriptDirectory() + "/result/sampled_documents.csv"

    # Check if sample exists
    if not os.path.isfile(sampled_documents_filepath):
        print "getAndSaveDocuments() was called but sampled_documents.csv doesn't exist."

        return


    # Get and save each document in the sample
    documents = pandas.read_csv(sampled_documents_filepath)
    nodes = getNodeList(base_url)
    formats = getFormatList(base_url)

    print("Total sampled documents to save: %d" % documents.shape[0])


    for i in range(0, documents.shape[0]):
        print "[%d of %d]" % (i + 1, documents.shape[0])

        node_identifier = documents.iloc[i, 0]


        # Get the meta and object XML
        document_identifier = documents.iloc[i, 1]
        meta_xml = getIdentifierMetaXML(base_url, document_identifier)


        # Determine if the node identifier is in the Node list.
        # If not, it is an invalid node id, and should be replaced with
        # the authoritativeMN from the system metadata

        valid_node = True

        if (node_identifier not in nodes):
            valid_node = False

            if meta_xml is not None:
                node_id_element = meta_xml.find("./authoritativeMN")

                if node_id_element is not None:
                    node_identifier = node_id_element.text


        # Remove "urn:node:" from node_identifier
        #
        # This remove redundant text from the folder names
        # but also deals with how Mac OS handles colons in file paths.
        # Mac OS considers colons (:) to separate folders in a file
        # hierarchy so ./result/urn:node:foo will be shown in Cocoa apps as
        # ./result/urn/node/foo where urn/node/foo is the folder name.
        # This is confusing because the folder appears with colons when viewed
        # from the terminal. This fixes removes the ambiguity between the terminal
        # and Cocoa applications.

        node_short_identifier = node_identifier.split(":")
        node_short_identifier = node_short_identifier[len(node_short_identifier) - 1]

        # Make the subdirectories to store files
        subdirectory_path = getScriptDirectory() + "/result/" + node_short_identifier


        # Don't get metadata again if directory exists for identifier
        if not os.path.exists(subdirectory_path):
            os.makedirs(subdirectory_path)


        if delay is not None:
            time.sleep(delay)



        # Extract the formatId from the sysmeta

        format_path = None

        if meta_xml is not None:
            format_id_element = meta_xml.find("./formatId")

            if format_id_element is not None:
                format_path = formats[format_id_element.text]['formatPath']

        if format_path is None:
            print "\t\tFailed to extract metadata format from system metadata file. Continuing."

            continue

        object_xml = getIdentifierObjectXML(base_url, document_identifier)

        if delay is not None:
            time.sleep(delay)


        sysmeta_path = subdirectory_path + "/sysmeta/xml"

        if not os.path.exists(sysmeta_path):
            os.makedirs(sysmeta_path)

        if meta_xml is not None:
            ET.ElementTree(meta_xml).write(sysmeta_path + "/" + str(i).rjust(5, '0') + "-sysmeta.xml")

        metadata_path = subdirectory_path + "/" + format_path + "/xml"

        if not os.path.exists(metadata_path):
            os.makedirs(metadata_path)

        if object_xml is not None:
            ET.ElementTree(object_xml).write(metadata_path + "/" + str(i).rjust(5, '0') + "-metadata.xml")


def get_meta_xml(base_url, identifier):
    """Get system (meta) metadata as XML

    :param base_url: Base URL of the CN or MN used to get metadata
    :param identifier: Metadata identifier.
    """

    query_url = base_url + "/meta/" + urllib.quote_plus(identifier)
    print("\t\t%s" % query_url)

    try:
        request = urllib2.urlopen(query_url)
        response = request.read()
        response_xml = ET.fromstring(response)
    except:
        print "\t\tFailed request: %s" % query_url
        response_xml = None

    return response_xml

def get_object_xml(base_url, identifier):
    """Get research (object) metadata XML

    :param base_url: Base URL of the CN or MN used to get metadata
    :param identifier: Metadata identifier.
    """

    query_url = base_url + "/object/" + urllib.quote_plus(identifier)
    print("\t\t%s" % query_url)

    try:
        request = urllib2.urlopen(query_url)
        response = request.read()
        response_xml = ET.fromstring(response)
    except:
        print "\t\tFailed request: %s" % query_url

        response_xml = None

    return response_xml


def get_node_list(base_url):
    """Get list of CNs and MNs

    :returns Hash of {identifier/type/base_url}
    """

    query_url = base_url + "/node"
    request = urllib2.urlopen(query_url)
    response = request.read()
    response_xml = ET.fromstring(response)

    node_list = {}

    nodes = response_xml.findall(".//node")

    for n in nodes:
        node_identifier = n.find("identifier").text
        node_type = n.attrib["type"]
        node_base_url = n.find("baseURL").text

        node_list[node_identifier] = { "identifier" : node_identifier, "type" : node_type, "base_url" : node_base_url }

    return node_list


def get_format_list(base_url):
    """Get list of data and metadata formats

    :returns Hash of {identifier,name,type,dirname} indexed on identifier
    """

    query_url = base_url + "/formats"
    request = urllib2.urlopen(query_url)
    response = request.read()
    response_xml = ET.fromstring(response)

    fmt_list = {}

    formats = response_xml.findall(".//objectFormat")

    for f in formats:
        fmt_identifier = f.find("formatId").text
        fmt_name = f.find("formatName").text
        fmt_type = f.find("formatType").text
        fmt_path = makeValidFormatPath(fmt_name)

        fmt_list[fmt_identifier] = { "formatId" : fmt_identifier, "formatName" : fmt_name, "formatType" : fmt_type, "formatPath" : fmt_path }

    return fmt_list


def main(base_url, node, sample_size):
    """Make-like execution flow
    Function will not run if dependent file exists
    """

    getAllPages(base_url, node) # Depends on document.csv
    sampleDocuments(sample_size) # Depends on sampled_documents.csv
    getAndSaveDocuments(base_url)

def getScriptDirectory():
    """Get the directory the script is being run from

    :return String: Absolute directory name."""

    return os.path.dirname(os.path.realpath(__file__))


def makeValidFormatPath(path):
    """Returns a valid path format path string where / and : are omitted, and comma,
    dash and whitespace sequences are changed to underscore.

    :param path: Path to be converted to a valid path.

    :return Valid path as a String
    """

    if len(path) <= 0:
        return None

    valid_path = ''.join(c for c in path if c not in "/:")
    replaced = re.sub('\s*,?-?\s+', '_', valid_path)

    return replaced


def usage():
    print "Usage: sample-metadata.py [--node NODE_IDENTIFIER] [--sample-size SAMPLE_SIZE] [--test] [--no-download] [--attribute]\r\n"

    print "-h, --help"
    print "\tPrint this information.\n"

    print "-n, --node"
    print "\tSpecify a single node to sample from. e.g. --node \"urn:node:KNB\""
    print "\tOmitting this switch will sample from ALL member nodes.\n"

    print "-s, --sample-size"
    print "\tSpecify a minimum sample size per member node. e.g. --sample-size 50"
    print "\tDefault: 250\n"

    print "-t, --test"
    print "\tRun all queries against the development CN instead of the production CN.\n"

    print "-d, --no-download"
    print "\tDon't download sys/scimeta files.\n"

    print "-a, --attribute"
    print "\tSkip documents without attribute-level information."

    return

if __name__ == "__main__":
    # Default options
    node = None # Sample all member nodes
    sample_size = 250 # Target a minimum sample of 250 objects
    base_url = "https://cn.dataone.org/cn/v1" # Production CN
    download = True # Download scientific metadata
    attribute = False # Include documents w/ and w/o attribute information

    # Parse command line arguments
    argv = sys.argv[1:]

    try:
        opts, args = getopt.getopt(argv, "hn:s:tda", ["help", "node=", "sample-size=", "test", "no-download", "attribute"])
    except getopt.GetoptError:
        usage()
        sys.exit()
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-n", "--node"):
            node = arg

            print "Setting node to %s" % node

        elif opt in ("-s", "--sample-size"):
            try:
                sample_size = int(arg)
            except:
                print "Couldn't parse the provided sample size."

            print "Setting sample size to %d" % sample_size

        elif opt in ("-t", "--test"):
            try:
                base_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1"
            except:
                print "Couldn't set CN to development. Using production instead."

        elif opt in ("-d", "--no-download"):
            try:
                download = False
            except:
                print "Couldn't set --no-download option. Defaulting to downloading."

        elif opt in ("-a", "--attribute"):
            try:
                attribute = True
            except:
                print "Couldn't set --attribute option. Defaulting to sampling documents with and without attribute-level information."


    try:
        main(base_url, node, sample_size, download, attribute)
    except KeyboardInterrupt:
        sys.exit()
