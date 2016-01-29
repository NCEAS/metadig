#!/Users/scgordon/anaconda/bin/python

import json
import xlsxwriter
import sys
import os
sys.path.append('./py')
from Counter import *
from ssutils import writeHeaders,add_summary_formulas, add_exists_formulas,add_named_ranges,load_summary_fields,add_field_summary,simplify,initialize_summary_formulas

## initial data values
sig = Counter()
columns = {}
sheets = {}
sheetRows = {}
dialects = {}
rubrics = {}
style1 = None
style2 = None
start_row = 7



def open_workbook(wbname):
	wb = xlsxwriter.Workbook(wbname)
	return wb

def read_json(path):
	print "Opening "+path
	with open (path, "r") as myfile:
			tmpdata=str(myfile.read())
	## get rid of the double commas -- THG xsl transforms sometimes generate ,,
	## which causes the python json parser to blow.  Try to filter them out here
	jsondata = tmpdata.replace(",\n,\n,",",\n");
	jsondata = jsondata.replace(",\n,",",\n");
	jsondata = jsondata.replace(",\n        ,",",\n");
	data = json.loads(jsondata)
	return data
	
## find the named worksheet object. If not found, create it.
def getRubricSheet(rname):
	sname = rname.replace("-","")
	try:
		sheet = sheets[sname]
	except:
		sheet = wb.add_worksheet(sname)
		writeHeaders(sheet,rname,style2)
		sheets[sname] = sheet
		sheetRows[rname] = start_row
		rubrics[rname] = True
	return sheet

	
## extract the file specific data and add it to the worksheet. one row per file.
def file_specific_data(data,  cName, dName, rubric_name):
	sname = rubric_name
	sheet =  getRubricSheet(rubric_name)
	row = sheetRows[rubric_name]
	col = 0
	signature = ""
	create_summary_sheet(data,rubric_name)

	##print rubric_name+":"
	signatureCol = 10
	## write the record unique data
	for record in data["records"]:
		sheet.write(row,col,cName)
		col +=1
		sheet.write(row,col,os.path.basename(record["Record"]))
		col +=1
		sheet.write(row,col,dName)
		col +=1
		sheet.write(row,col,record["Date"])
		col +=1
		sheet.write(row,col,record["rubricType"])
		col +=1
		sheet.write(row,col,record["rubricVersion"])
		col +=1
		sheet.write(row,col,float(record["rubricMax"]))
		col +=1
		sheet.write(row,col,float(record["rubricExists"]))
		col +=1
		sheet.write(row,col,float(record["rubricCounts"]))
		col +=1
		signatureCol = col

		## write the spiral unique data
		spiralCount = 0
		for spiral in record['spirals']:
			col +=1
			sheet.write(row,col,float(spiral["maximum"]))
			col += 1
			existCount = float(spiral["maximum"]) - getExistCount(spiral)
			sheet.write(row,col,existCount)
			col += 1
			sheet.write(row,col,float(spiral["existTotal"]))
			signature += " "+str(spiral["existTotal"])
			col += 1
			sheet.write(row,col,float(spiral["countTotal"]))
			col += 1
			percent = float(float(spiral["existTotal"])/float(spiral["maximum"]))
			sheet.write(row,col,float(percent))
			spiralCount += 1

		## write the "exist" values from each item in the spiral
		for spiral in record['spirals']:
			items = ""
			for item in spiral["items"]:
				col +=1
				writeit(sheet,row,col,float(item["exists"]))
				items += " "+item['exists']
			##print "exists = "+items

		#write the "count" values from each item in the spiral
		for spiral in record['spirals']:
			items = ""
			for item in spiral["items"]:
				col +=1
				sheet.write(row,col,float(item["count"]))
				items += " "+item['exists']
			##print "count = "+items

		sheet.write(row,signatureCol,signature.lstrip())
		signature = ""
		row += 1
		sheetRows[rubric_name] = row
		col = 0

def getExistCount(spiral):
		num = float(0)
		for item in spiral["items"]:
			itemVal = float(item['exists'])
			if (itemVal == -1):
				num += 1
		return num

def create_summary_sheet(data,rubric_name):
	sname = summary_name(rubric_name)
	try:
		sum_sheet =  sheets[sname]
	except:
		sheet = wb.add_worksheet(sname)
		sheets[sname] = sheet
		sheetRows[sname] =  load_summary_fields(wb,sheet,data,rubric_name, sname, 3)


		

def summary_name(rubric_name):
	return  simplify("Field_Summary_"+rubric_name)
	
def writeit(sheet, row, col, val) :
	if (val != 0):
		sheet.write(row,col,val,style1)
	else:
		sheet.write(row,col,val)
		
def add_formulas():
	number_of_dialects = len(dialects)

	for key in rubrics:
		dialect_row = 1
		sheet = getRubricSheet(key)
		end_row = sheetRows[key]
		initialize_summary_formulas(sheet,start_row,end_row,key)
		add_named_ranges(start_row+1,end_row,key,wb, sheetRows, sheet)
		add_exists_formulas(sheet,start_row,end_row,key,number_of_dialects,wb)
		for dkey in dialects:
			add_summary_formulas(sheet,start_row,end_row,key,dkey,dialect_row)
			dialect_row += 1



	
## main processing starts here
workbook_name = "data14.xlsx"
wb = open_workbook(workbook_name)
style1 = wb.add_format()
style1.set_bg_color('green' )
style2 = wb.add_format()
style2.set_font_name('Calibri' )
style2.set_bold()
## original from xlwt package - {'pattern: pattern solid, fore_colour light_green;')

##  loop through each of the files on the command line
for idx in range(1,len(sys.argv)):
	## get the path
	path = sys.argv[idx]
	##print "path="+path
	basename = os.path.basename(path)

	## now split out the colection, dialect, and filename
	words = path.split("/")
	collection = words[3]
	size = len(words)
	dialect = words[size-3]
	dialects[dialect] = True
	filename = words[size-1]

	## split the filename to extract the rubric type
	arry = filename.split("_")
	rubric = arry[1]
	print "dc="+collection+" dlct="+dialect+" file="+filename+" rub="+rubric

	## read and parse the input json file
	data = read_json(path)

	## and process the data
	file_specific_data(data,collection,dialect,rubric)



add_formulas()

for rubric in rubrics:
	sname = summary_name(rubric)
	ssheet = sheets[sname]
	add_field_summary(wb,rubric, ssheet, sheetRows[sname], sheets[simplify(rubric)], sheetRows[rubric],sorted(dialects ))
		
## now save the workbook
wb.close();
