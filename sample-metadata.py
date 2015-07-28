#! /usr/bin/env python

# sample-metadata.py
# Author: Bryce Mecum (mecum@nceas.ucsb.edu)
#
# Summary:
#
# Sample research objects (?) within one or more member nodes (MN) and save 
# system metadata andobject metadata to files. The purpose of this scriptis to 
# allow metadata to be sampled randomly from withinmember nodes in order to test
# the quality of metadataacross member nodes.
#
# Implementation details:
#
# 	The coordinating node (CN) is queried for all documents
# 	regardless of the authoritative MN.
#
# 	Meta and object XML are requested only from the CN.
#
# Command line arguments:
#
# --node (-n): Member node identifier, e.g. urn:node:KNB
#	e.g. Sample only from KNB
#		 python sample-metadata.py --node "urn:node:KNB"
#
# --sample-size (-s): Return at least {atleast} objects
#	e.g. Take a maximum sample of 100 identifiers from each MN
# 		 python sample-metadata.py --sample-size 100


def getNumResults(node):
	"""Get the number of total results from the CN
	
	:param node: (Optional) Specify a single node to sample from.
	"""
	
	query_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1/query/solr/?fl=identifier,authoritativeMN&q=formatType:METADATA+AND+-obsoletedBy:*"

	# If only sampling one node, append node as criterion
	# Node, e.g. urn:node:KNB, is searched as *KNB

	if node is not None:
		node_short_identifier = node.split(":")
		node_short_identifier[len(node_short_identifier) - 1]
		
		query_url += "+AND+datasource:*" + node_short_identifier

	query_url += "&rows=0&start=0"
	
	request = urllib2.urlopen(query_url)
	response = request.read()
	response_xml = ET.fromstring(response)

	result = response_xml.findall(".//result")

	return int(result[0].get("numFound"))


def getPage(page=1, page_size=1000):
	"""Get a specific page of results from the Solr index.
	
	:param page: Page of results to get.
	:param page_size: Number of results in the page.
	"""
	
	identifiers = []
	authoritativeMNs = []

	param_rows = page_size
	param_start = (page - 1) * page_size

	query_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1/query/solr/?fl=identifier,authoritativeMN&q=formatType:METADATA+AND+-obsoletedBy:*"

	if node is not None:
		node_short_identifier = node.split(":")
		node_short_identifier[len(node_short_identifier) - 1]

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


def getPageRange(page_range, page_size, delay=1):
	"""Get a range of pages from the Solr index.
	
	:param page_range: Range of pages to get.
	:param page_size: Number of results per page.
	:param delay: Delay, in seconds, between requests.
	"""
	
	identifiers = []
	authoritativeMNs = []

	for p in page_range:
		print "Getting page %d" % (p)

		page_result = getPage(page = p)

		identifiers = identifiers + page_result[0]
		authoritativeMNs = authoritativeMNs + page_result[1]

		if delay is not None:
			time.sleep(delay)

	return (identifiers, authoritativeMNs)
 
	
def getAllPages(node = None, page_size = 1000, delay=1):
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
	num_results = getNumResults(node);
	print("Total results: %d" % (num_results))

	pages_required = math.ceil((num_results + 0.0) / page_size)
	print("Total pages: %d" % (pages_required))


	range_of_pages = range(1, int(pages_required) + 1)

	all_pages = getPageRange(range_of_pages, page_size, delay)
	
	documents_df = pandas.DataFrame({
		'identifier' : all_pages[0],
		'authoritativeMN' : all_pages[1]})
	
	documents_df.to_csv(documents_csv_filepath, index = False, encoding = "utf-8")
	
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
				rows_to_sample = range(0, nrows - 1)
				sampled_rows = numpy.random.choice(rows_to_sample, sample_size)
			else:
				sampled_rows = range(0, nrows - 1)

		df_subset_filtered = df_subset.iloc[sampled_rows,:]

		sampled_documents = pandas.concat([sampled_documents, df_subset_filtered])
	
	sampled_documents.groupby(["authoritativeMN"]).aggregate(['count']).to_csv(sample_statistics_filepath, encoding = "utf-8")
	sampled_documents.to_csv(sampled_documents_filepath, index = False, encoding = "utf-8")
	
	return


def getAndSaveDocuments(delay=1):
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
	nodes = getNodeList()
	
	print("Total sampled documents to save: %d" % documents.shape[0])
	
	
	for i in range(0, documents.shape[0]):		
		node_identifier = documents.iloc[i, 0]
		
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
		
		document_identifier = documents.iloc[i, 1]
		
		# Make the subdirectories to store files
		subdirectory_path = getScriptDirectory() + "/result/" + node_short_identifier
		
		
		# Don't get metadata again if directory exists for identifier
		if not os.path.exists(subdirectory_path):
			os.makedirs(subdirectory_path)

		if node_identifier in nodes:
			mn_url = nodes[node_identifier]["base_url"]
		else:
			print "Sampled node (%s) not found in node list." % node_identifier
			
			continue

		meta_xml = getIdentifierMetaXML(mn_url, document_identifier)

		if delay is not None:
			time.sleep(delay)


		object_xml = getIdentifierObjectXML(mn_url, document_identifier)

		if delay is not None:
			time.sleep(delay)
		

		if meta_xml is not None:
			ET.ElementTree(meta_xml).write(subdirectory_path + "/" + str(i).rjust(5, '0') + "-meta.xml")

		if object_xml is not None:
			ET.ElementTree(object_xml).write(subdirectory_path + "/" + str(i).rjust(5, '0') + "-object.xml")
				
		
def getIdentifierMetaXML(base_url, identifier):
	"""Get system (meta) metadata as XML
	
	:param base_url: Base URL of the CN or MN used to get metadata
	:param identifier: Metadata identifier.
	"""
	
	base_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1" # TODO: Remove this
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

	base_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1" # TODO: Remove this
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
	
	
def getNodeList():
	"""Get list of CNs and MNs
	
	:returns Hash of {identifier/type/base_url}
	"""
	
	query_url = "https://cn-dev-ucsb-1.test.dataone.org/cn/v1/node"
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

		
def main(node, sample_size):
	"""Make-like execution flow
	Function will not run if dependent file exists
	"""
	
	getAllPages(node) # Depends on document.csv
	sampleDocuments(sample_size) # Depends on sampled_documents.csv
	getAndSaveDocuments()

def getScriptDirectory():
	"""Get the directory the script is being run from
	
	:return String: Absolute directory name."""
	
	return os.path.dirname(os.path.realpath(__file__))

def usage():
	print "Usage: sample-metadata.py [--node NODE_IDENTIFIER] [--sample-size SAMPLE_SIZE]\r\n"
	
	print "-h, --help"
	print "\tPrint this information."
	
	print "-n, --node"
	print "\tSample a single node. e.g. --node \"urn:node:KNB\""
	print "\t"
	print "-s, --sample-size"
	print "\tSpecify a minimum sample size per node. e.g. --sample-size 50"

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
	node = None
	sample_size = 250
	
	# Parse command line arguments
	argv = sys.argv[1:]
	
	try:
		opts, args = getopt.getopt(argv, "hn:s:", ["help", "node=", "sample-size="])
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
	try:
		main(node, sample_size)
	except KeyboardInterrupt:
		sys.exit()
