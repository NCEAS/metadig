#!/usr/bin/python

import json
import xlsxwriter
from xlsxwriter.utility import xl_rowcol_to_cell

## write the header row in the worksheet.
def writeHeaders(sheet,rubric,style):
	##print "adding header for rubric type="+rubric
	col = 0
	col = addTitle(sheet,"Data Center",col,style)
	col = addTitle(sheet,"RecordName",col,style)
	col = addTitle(sheet,"Dialect",col,style)
	col = addTitle(sheet,"Date",col,style)
	col = addTitle(sheet,"RubricType",col,style)
	col = addTitle(sheet,"RubricVersion",col,style)
	col = addTitle(sheet,"RubricMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Signature",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col  = addItems(sheet,col,style,"e",rubric)
	col  = addItems(sheet,col,style,"c",rubric)

def addItems(sheet,col,style,val,rubric):
	col = addTitle(sheet,"1.1."+val,col,style)
	col = addTitle(sheet,"1.2."+val,col,style)
	col = addTitle(sheet,"1.3."+val,col,style)
	col = addTitle(sheet,"1.4."+val,col,style)
	col = addTitle(sheet,"1.5."+val,col,style)
	col = addTitle(sheet,"1.6."+val,col,style)
	col = addTitle(sheet,"1.7."+val,col,style)
	col = addTitle(sheet,"1.8."+val,col,style)
	if ((rubric == "CSW") or (rubric == "UMM-C")): 
		col = addTitle(sheet,"1.9."+val,col,style)
		col = addTitle(sheet,"1.10."+val,col,style)
	if (rubric == "UMM-C"): 
		col = addTitle(sheet,"1.11."+val,col,style)
		col = addTitle(sheet,"1.12."+val,col,style)
		col = addTitle(sheet,"1.13."+val,col,style)
		col = addTitle(sheet,"1.14."+val,col,style)
		col = addTitle(sheet,"1.15."+val,col,style)
		col = addTitle(sheet,"1.16."+val,col,style)
		col = addTitle(sheet,"1.17."+val,col,style)
		col = addTitle(sheet,"1.18."+val,col,style)
		col = addTitle(sheet,"1.19."+val,col,style)
		col = addTitle(sheet,"1.20."+val,col,style)
		col = addTitle(sheet,"1.21."+val,col,style)
		col = addTitle(sheet,"1.22."+val,col,style)
		col = addTitle(sheet,"1.23."+val,col,style)
		col = addTitle(sheet,"1.24."+val,col,style)
		col = addTitle(sheet,"1.25."+val,col,style)
		col = addTitle(sheet,"1.26."+val,col,style)
		col = addTitle(sheet,"1.27."+val,col,style)
		col = addTitle(sheet,"1.28."+val,col,style)
		col = addTitle(sheet,"1.29."+val,col,style)
		col = addTitle(sheet,"1.30."+val,col,style)
		col = addTitle(sheet,"1.31."+val,col,style)
		col = addTitle(sheet,"1.32."+val,col,style)
		col = addTitle(sheet,"1.33."+val,col,style)
		col = addTitle(sheet,"1.34."+val,col,style)
		col = addTitle(sheet,"1.35."+val,col,style)
		col = addTitle(sheet,"1.36."+val,col,style)
	col = addTitle(sheet,"2.1."+val,col,style)
	col = addTitle(sheet,"2.2."+val,col,style)
	col = addTitle(sheet,"2.3."+val,col,style)
	col = addTitle(sheet,"2.4."+val,col,style)
	col = addTitle(sheet,"2.5."+val,col,style)
	col = addTitle(sheet,"2.6."+val,col,style)
	if ((rubric == "CSW") or (rubric == "DCITE")):
		col = addTitle(sheet,"2.7."+val,col,style)
		col = addTitle(sheet,"2.8."+val,col,style)
		col = addTitle(sheet,"2.9."+val,col,style)
		col = addTitle(sheet,"2.10."+val,col,style)
	if (rubric == "CSW"):
		col = addTitle(sheet,"2.11."+val,col,style)
		col = addTitle(sheet,"2.12."+val,col,style)
		col = addTitle(sheet,"2.13."+val,col,style)
		col = addTitle(sheet,"2.14."+val,col,style)
		col = addTitle(sheet,"2.15."+val,col,style)
	col = addTitle(sheet,"3.1."+val,col,style)
	col = addTitle(sheet,"3.2."+val,col,style)
	col = addTitle(sheet,"3.3."+val,col,style)
	col = addTitle(sheet,"3.4."+val,col,style)
	col = addTitle(sheet,"3.5."+val,col,style)
	col = addTitle(sheet,"3.6."+val,col,style)
	if ((rubric == "CSW") or (rubric == "UMM-C")):
		col = addTitle(sheet,"3.7."+val,col,style)
		col = addTitle(sheet,"3.8."+val,col,style)
		col = addTitle(sheet,"3.9."+val,col,style)
	if (rubric == "UMM-C"): 
		col = addTitle(sheet,"3.10."+val,col,style)
		col = addTitle(sheet,"3.11."+val,col,style)
		col = addTitle(sheet,"3.12."+val,col,style)
		col = addTitle(sheet,"3.13."+val,col,style)
		col = addTitle(sheet,"3.14."+val,col,style)
		col = addTitle(sheet,"3.15."+val,col,style)
		col = addTitle(sheet,"3.16."+val,col,style)
		col = addTitle(sheet,"3.17."+val,col,style)
		col = addTitle(sheet,"3.18."+val,col,style)
		col = addTitle(sheet,"3.19."+val,col,style)
		col = addTitle(sheet,"3.20."+val,col,style)
		col = addTitle(sheet,"3.21."+val,col,style)
		col = addTitle(sheet,"3.22."+val,col,style)
		col = addTitle(sheet,"3.23."+val,col,style)
		col = addTitle(sheet,"3.24."+val,col,style)
		col = addTitle(sheet,"3.25."+val,col,style)
	return col

def addTitle(sheet,title,col,style):
	row = 6
	sheet.write(row,col,title, style)
	return col+1

def initialize_summary_formulas(sheet,start_row,end_row,rubric):
		start_row = start_row + 1

		formulaStr = "=MAX(K"+str(start_row)+":K"+str(end_row)+")"
		cell_address = xl_rowcol_to_cell(0,11)
		sheet.write_formula(cell_address,formulaStr)

		formulaStr = "MAX(P"+str(start_row)+":P"+str(end_row)+")"
		cell_address = xl_rowcol_to_cell(0,16)
		sheet.write_formula(cell_address,formulaStr)

		formulaStr = "MAX(U"+str(start_row)+":U"+str(end_row)+")"
		cell_address = xl_rowcol_to_cell(0,21)
		sheet.write_formula(cell_address,formulaStr)

def add_summary_formulas(sheet,start_row,end_row,rubric,dialect_name,dialect_row):
		start_row = start_row + 1
		range_name =  simplify("dialectList"+rubric)
		dialect_cellname = "C"+str(dialect_row+1)

		cell_address = xl_rowcol_to_cell(dialect_row,2)
		sheet.write(cell_address,dialect_name)
		
		formulaStr = "{=MAX(IF("+range_name+"="+dialect_cellname+",L"+str(start_row)+":L"+str(end_row)+"))}"
		cell_address = xl_rowcol_to_cell(dialect_row,11)
		sheet.write_formula(cell_address,formulaStr)
	
		formulaStr = "{=MAX(IF("+range_name+"=$"+dialect_cellname+",Q$"+str(start_row)+":Q$"+str(end_row)+"))}"
		cell_address = xl_rowcol_to_cell(dialect_row,16)
		sheet.write_formula(cell_address,formulaStr)
		
		formulaStr = "{=MAX(IF("+range_name+"=$"+dialect_cellname+",V$"+str(start_row)+":V$"+str(end_row)+"))}"
		cell_address = xl_rowcol_to_cell(dialect_row,21)
		sheet.write_formula(cell_address,formulaStr)
	
		formulaStr = "=COUNTIF("+range_name+","+dialect_cellname+")"
		cell_address = xl_rowcol_to_cell(dialect_row,24)
		sheet.write_formula(cell_address,formulaStr)
	

def	add_exists_formulas(sheet,top_row,bottom_row,rubric,number_of_dialects,wb):
	dlist = "C$"+str(top_row)+":C$"+str(bottom_row)
	start_col = 26
	end_col = 60
	if (rubric == "UMM-C"):
		end_col = 93
	if (rubric == "CSW"):
		end_col = 60
	if (rubric == "DCITE"):
		end_col = 50
	drange = "$C"+str(top_row+1)+":$C"+str(bottom_row)
	percent = wb.add_format({'num_format':'0%'})
	range_name =  define_name("dialectList",rubric)

	for row in range(1,number_of_dialects+1):
		for col in range(start_col,end_col):
			cell_start =  xl_rowcol_to_cell(top_row,col-1)
			cell_end =  xl_rowcol_to_cell(bottom_row-1, col-1)
			loc_list = cell_start+":"+cell_end
			formulaStr = "{=SUMIF("+range_name+",C$"+str(row+1)+","+loc_list+")/$Y"+str(row+1)+"}"
			cell_address = xl_rowcol_to_cell(row,col-1)
			sheet.write_formula(cell_address,formulaStr,percent)


def	add_named_ranges(top_row,bottom_row,rubric,wb,sheetRows,sheet):
	cell_address = xl_rowcol_to_cell(0,2)
	sheet.write(cell_address,"Recommendation")

	rnge = "="+simplify(rubric)+"!$Y$2:$Y$4"
	range_name =  define_name("dialectCounts",rubric)
	add_defined_name(wb,range_name,rnge)

	rnge = "="+simplify(rubric)+"!$C$8:$C$"+str(sheetRows[rubric]+1)
	range_name = define_name("dialectList",rubric)
	add_defined_name(wb,range_name,rnge)

	rnge = "="+simplify(rubric)+"!$C$2:$C$4"
	range_name = define_name("dialectNames",rubric)
	add_defined_name(wb,range_name,rnge)

	rnge = "="+simplify(rubric)+"!$Z$7:$CO$7"
	if (rubric == "CSW"):
		rnge = "="+simplify(rubric)+"!$Z$7:$BG$7"
	if (rubric == "DCITE"):
		rnge = "="+simplify(rubric)+"!$Z$7:$AW$7"
	if (rubric == "UMM-C"):
		rnge = "="+simplify(rubric)+"!$Z$7:$CN$7"
	range_name = define_name("existsColumns",rubric)
	add_defined_name(wb,range_name,rnge)

	rnge = "="+simplify(rubric)+"!$Z$2:$CO$4"
	if (rubric == "CSW"):
		rnge = "="+simplify(rubric)+"!$Z$2:$BG$4"
	if (rubric == "DCITE"):
		rnge = "="+simplify(rubric)+"!$Z$2:$AW$4"
	if (rubric == "UMM-C"):
		rnge = "="+simplify(rubric)+"!$Z$2:$CN$4"
	range_name = define_name("existsSummary",rubric)
	add_defined_name(wb,range_name,rnge)

def add_defined_name(wb,name,drange):
	wb.define_name(name,drange)


def load_summary_fields(wb, sheet, data, rubric_name, summary_name, start_row):
	style = wb.add_format()
	style.set_font_name('Calibri' )
	style.set_bold()
	sheet.write(2,0,"ConceptID",style)
	sheet.write(2,1,"Total Number of Records",style)
	for record in data["records"]:
		row = start_row
		spiral_count = 0
		for spiral in record['spirals']:
			items = ""
			code = spiral['code']
			item_count = 0
			for item in spiral["items"]:
				name = item['name']
				item_name = code+"."+name
				item_num = str(spiral_count+1)+"."+str(item_count+1)
				sheet.write(row,0,item_num)
				sheet.write(row,1,item_name)
				item_count = item_count + 1
				row += 1
			spiral_count += 1
		return row
	

def add_field_summary(wb,rubric, ssheet, srows, rsheet, rubric_end,dialects):
		style = wb.add_format()
		style.set_font_name('Calibri' )
		style.set_bold()
		percent = wb.add_format({'num_format':'0%'})
		col = 2
		for dialect in dialects:
			## write dialect name
			cell_address = xl_rowcol_to_cell(1,col)
			ssheet.write(cell_address,dialect,style)

			## write dialect total counts
			cell_address = xl_rowcol_to_cell(2,col)
			match_address = xl_rowcol_to_cell(1,col)
			formulaStr = "=INDEX(dialectCounts"+simplify(rubric)+",MATCH("+match_address+",dialectNames"+simplify(rubric)+",0),1)"
			ssheet.write_formula(cell_address,formulaStr)

			for row in range(3,srows):
				acell = xl_rowcol_to_cell(row,0)
				index_address = xl_rowcol_to_cell(1,col)
				formulaStr = "=INDEX("+define_name('existsSummary',rubric)+",MATCH("+index_address+","+define_name('dialectNames',rubric)+",0),MATCH($"+acell+"&\".e\","+define_name('existsColumns',rubric)+",0))"
				cell_address = xl_rowcol_to_cell(row,col)
				ssheet.write_formula(cell_address,formulaStr,percent)
			col += 1

def define_name(name,rubric):
	return name+simplify(rubric)
			
def simplify(name):
	return name.replace("-","")
	
