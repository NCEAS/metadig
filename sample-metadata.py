#! /usr/bin/env python

# sample-metadata.py
# Author: Bryce Mecum (mecum@nceas.ucsb.edu)
#
# Summary:
#
# Sample research objects system and scientific metadata within one or across
# all member nodes (MN) and save system metadata and object metadata to files.
#
# The purpose of this script is to allow metadata to be sampled randomly from
# within member nodes in order to test the quality of metadata across member
# nodes.
#
# By default, the script will query all member nodes and target a sample size
# of 250 objects from each member node. If a member node does not contain
# 250 objects, all objects from that member node will be sampled.
#
# Settings that can be customized by command-line switches are (1) which
# coordination node (CN) to run queries against, (2) target a specific member
# node to sample documents from, and (3) change the target sample size for
# each member node.
#
#
# How to run:
#
#	Get a random sample (w/o replacement) of 250 system + science metadata
#	objects across all member nodes. If a member node doesn't have 250
# 	objects, all objects from the node are used instead of randomly sampled.
#
#	$ python sample-metadata.py
#
#
#	Do the same as above but change the sample size of 250 to 50.
#
#	$ python sample-metadata.py -s 50
#
#
#	Sample from only one member node (KNB).
#   Note that the full node identifier is passed with quotes around it.
#
#   $ python sample-metadata.py -n "urn:node:KNB"
#
#
# Implementation details:
#
# 	The coordinating node (CN) is queried for and used to retrieve all
#   documents regardless of the authoritative MN or replicaMNs.
#
#
# Requirements:
#
#   This script was designed and tested using Python 2.7.10
#
#	Extra packages required:
#		- pandas (install with `pip install pandas`)
#
#
# Command line arguments:
#
# --node (-n): (optional) Member node identifier, e.g. urn:node:KNB
#	e.g. Sample only from KNB
#		 python sample-metadata.py --node "urn:node:KNB"
#
# -- from: (optional) Only return objects created after this point in
#   time. Must use Solr's datetime format.
#   e.g. Get objects created after June 10th, 2010
#    	python sample-metadata.py --from "2010-06-10T00:00:00Z"
#
# -- to: (optional) Only return objects created before this point in
#   time. Must use Solr's datetime format.
#   e.g. Get objects created before January 20th, 2016
#    	python sample-metadata.py --from "2016-01-20T00:00:00Z"
#
# --sample-size (-s): (optional) Return at least {atleast} objects
#	e.g. Target a sample of 100 identifiers from each MN
# 		 python sample-metadata.py --sample-size 100
#
# --test (-t): (optional) Run against the test CN instead of production.
#  	e.g. python sample-metadata.py --test


def getNumResults(base_url, node, from_date=None, to_date=None):
	"""Get the number of total results from the CN

	:param node: (Optional) Specify a single node to sample from.
	:param from: (Optional) Filter to just objects created after this date
	:param to: 	 (Optional) Filter to just objects created before this date
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

	if from_date is not None and to_date is None:
		query_url += "+AND+dateUploaded:[{}%20TO%20NOW]".format(from_date)

	if from_date is None and to_date is not None:
		query_url += "+AND+dateUploaded:[1970-01-01T00:00:00.000Z%20TO%20{}]".format(to_date)

	if from_date is not None and to_date is not None:
		query_url += "+AND+dateUploaded:[{}%20TO%20{}]".format(from_date, to_date)

	query_url += "&rows=0&start=0"

	request = urllib2.urlopen(query_url)
	response = request.read()
	response_xml = ET.fromstring(response)

	result = response_xml.findall(".//result")

	return int(result[0].get("numFound"))


def getPage(base_url, node, page=1, from_date=None, to_date=None, page_size=1000):
	"""Get a specific page of results from the Solr index.

	:param node: 		Node to sample.
	:param from_date:   (Optional) Filter to just objects created after this date
	:param to_date: 	(Optional) Filter to just objects created before this date
	:param page: 		Page of results to get.
	:param page_size: 	Number of results in the page.
	"""

	identifiers = []
	authoritativeMNs = []

	param_rows = page_size
	param_start = (page - 1) * page_size

	# Construct query URL
	query_url = base_url + "/query/solr/?&q=formatType:METADATA+AND+-obsoletedBy:*"

	# Extra query params
	if node is not None:
		node_short_identifier = node.split(":")
		node_short_identifier = node_short_identifier[len(node_short_identifier) - 1]

		query_url = query_url + "+AND+datasource:*" + node_short_identifier

	if from_date is not None and to_date is None:
		query_url += "+AND+dateUploaded:[{}%20TO%20NOW]".format(from_date)

	if from_date is None and to_date is not None:
		query_url += "+AND+dateUploaded:[1970-01-01T00:00:00.000Z%20TO%20{}]".format(to_date)

	if from_date is not None and to_date is not None:
		query_url += "+AND+dateUploaded:[{}%20TO%20{}]".format(from_date, to_date)

	# Fields and extra field params
	query_url += "&fl=identifier,authoritativeMN"

	if from_date is not None or to_date is not None:
		query_url += ",dateUploaded"

	# Add rows and start parameter
	query_url = query_url + "&rows=" + \
		str(param_rows) + "&start=" + str(param_start) + "&wt=csv"

	docs = pandas.read_csv(query_url)

	return docs

def getPageRange(base_url, node, page_range, page_size, from_date=None, to_date=None, delay=None):
	"""Get a range of pages from the Solr index.

	:param node: 		Node to sample.
	:param page_range:  Range of pages to get.
	:param page_size:   Number of results per page.
	:param from_date:   (Optional) Filter to just objects created after this date
	:param to_date: 	(Optional) Filter to just objects created before this date
	:param delay: 	    Delay, in seconds, between requests.
	"""

	docs = None

	for p in page_range:
		print "Getting page %d" % (p)

		page_result = getPage(base_url, node, p, from_date=from_date, to_date=to_date)
		if docs is None:
			docs = page_result
		else:
			docs = docs.append(page_result)

		if delay is not None:
			time.sleep(delay)

	return docs

def getAllPages(base_url, node = None, page_size = 1000, from_date=None, to_date=None, delay=None):
	"""Get all possible pages from the Solr index.

	:param node: 		(Optional) Specify a single node to query for.
	:param page_size: 	Number of results per page.
	:param from_date:   (Optional) Filter to just objects created after this date
	:param to_date: 	(Optional) Filter to just objects created before this date
	:param delay: 		Delay, in seconds, between requests.

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

	num_results = getNumResults(base_url, node, from_date=from_date, to_date=to_date);
	print("Total results: %d" % (num_results))

	if num_results is 0:
		print "No results were found. Exiting."
		exit

	pages_required = math.ceil((num_results + 0.0) / page_size)
	print("Total pages: %d" % (pages_required))


	range_of_pages = range(1, int(pages_required) + 1)

	all_pages = getPageRange(base_url, node, range_of_pages, page_size, from_date=from_date, to_date=to_date, delay=delay)
	all_pages.to_csv(documents_csv_filepath, index = False, encoding = "utf-8")

	return


def sampleDocuments(sample_size = 250):
	"""Generate a sample of identifiers for each MN

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


def getAndSaveDocuments(base_url, delay=None):
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

		node_identifier = documents['authoritativeMN'][i]

		# Get the meta and object XML
		document_identifier = documents['identifier'][i]
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


def getIdentifierMetaXML(base_url, identifier):
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

def getIdentifierObjectXML(base_url, identifier):
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


def getNodeList(base_url):
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


def getFormatList(base_url):
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

def main(base_url, node, sample_size, from_date, to_date):
	"""Make-like execution flow
	Function will not run if dependent file exists
	"""

	getAllPages(base_url, node, from_date=from_date, to_date=to_date) # Depends on document.csv
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

	# Collapse all EML versions into the same folder
	#
	# TODO:
	# - CSDGM
	# - Dryad
	# - Mercury
	# - BDP
	# - Onedcx

	if path.startswith('Ecological Metadata Language'):
		path = 'EML'
	else: # Or just return something sane
		path = ''.join(c for c in path if c not in "/:")
		path = re.sub('\s*,?-?\s+', '_', path)

	return path

def usage():
	print "Usage: sample-metadata.py [--node NODE_IDENTIFIER] [--sample-size SAMPLE_SIZE] [--from FROM] [--to TO] [--test]\r\n"

	print "-h, --help"
	print "\tPrint this information.\n"

	print "-n, --node"
	print "\tSpecify a single node to sample from. e.g. --node \"urn:node:KNB\""
	print "\tOmitting this switch will sample from ALL member nodes.\n"

	print "-s, --sample-size"
	print "\tSpecify a minimum sample size per member node. e.g. --sample-size 50"
	print "\tDefault: 250\n"

	print "--from"
	print "\tLimit sampled documents to those created after this date. e.g. --from YYYY-MM-DDThh:mm:ssZ\n"

	print "--to"
	print "\tLimit sampled documents to those created before this date. e.g. --to YYYY-MM-DDThh:mm:ssZ\n"

	print "-t, --test"
	print "\tRun all queries against the development CN instead of the production CN."

	return

if __name__ == "__main__":
	import urllib # for quote_plus
	import urllib2 # for the rest (urlopen, etc)
	import xml.etree.ElementTree as ET
	import re
	import csv
	import string
	import sys
	import math
	import pandas
	import numpy
	import time
	import os
	import getopt

	# Default options
	node = None # Sample all member nodes
	sample_size = 250 # Target a minimum sample of 250 objects
	base_url = "https://cn.dataone.org/cn/v1" # Production CN
	from_date = None
	to_date = None
	solr_datetime_format = re.compile("\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.?\d*Z")

	# Parse command line arguments
	argv = sys.argv[1:]

	try:
		opts, args = getopt.getopt(argv, "hn:s:from:to:t", [ "help", "node=", "sample-size=", "from=", "to=", "test"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
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

		elif opt in ("--from"):
			try:
				from_date = arg

				if not solr_datetime_format.match(from_date):
					raise

			except:
				print "Could not parse {} as a Solr datetime, which has the format YYYY-MM-DDThh:mm:ssZ".format(arg)

		elif opt in ("--to"):
			try:
				to_date = arg

				if not solr_datetime_format.match(to_date):
					raise

			except:
				print "Could not parse {} as a Solr datetime, which has the format YYYY-MM-DDThh:mm:ssZ".format(arg)

		elif opt in ("-t", "--test"):
			try:
				base_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1"
			except:
				print "Couldn't set CN to development. Using production instead."


	try:
		main(base_url, node, sample_size, from_date, to_date)
	except KeyboardInterrupt:
		sys.exit()
