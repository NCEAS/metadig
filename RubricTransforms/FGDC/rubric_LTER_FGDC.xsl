<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd" xmlns:thredds="http://www.unidata.ucar.edu/namespaces/thredds/InvCatalog/v1.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fgdc="http://www.fgdc.gov/metadata/csdgm" version="2.0"><xsl:param name="recordSetPath"></xsl:param><xsl:param name="fileNamePattern"></xsl:param><xsl:output method="text"></xsl:output><xsl:template match="/"><xsl:variable name="xmlFilesSelect" select="concat($recordSetPath, '?select=',$fileNamePattern)"></xsl:variable><xsl:text>{"records": [</xsl:text><xsl:for-each select="collection(iri-to-uri($xmlFilesSelect))"><xsl:call-template name="writeSpirals"></xsl:call-template></xsl:for-each><xsl:text>]}</xsl:text></xsl:template><xsl:template name="writeSpirals"><xsl:if test="position()!=1"><xsl:text>,</xsl:text></xsl:if><xsl:text>{"spirals": [</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Identification",</xsl:text><xsl:text>"code":"LTER_Identification",</xsl:text><xsl:text>"description":"Minimum content for adequate data set discovery in a general cataloging system or repository (functionally equivalent to LTER DTOC)",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable name="LTER_Identification.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin | /metadata/idinfo/datacred | /metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubinfo/publish)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/ptcontac)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:sequence><xsl:sequence select="count(/metadata/metainfo/metc/cntinfo)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin) + count(/metadata/idinfo/datacred) + count(/metadata/metainfo/metc/cntinfo)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubinfo/publish)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/ptcontac)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/descript/abstract)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e269" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e269" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/title",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e3798" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e3798)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e3798" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e3798)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/origin",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"In CSW this concept is called Creator",</xsl:text><xsl:text>"description":"The principal author of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Contact",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e922" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e922)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e922" as="xs:integer+"><xsl:sequence select="count(/metadata/metainfo/metc/cntinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e922)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/metainfo/metc/cntinfo",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/metainfo/metc/cntinfo)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person currently responsible for the metadata."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Name",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e4447" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin | /metadata/idinfo/datacred | /metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e4447)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e4447" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin | /metadata/idinfo/datacred | /metadata/metainfo/metc/cntinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e4447)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/origin",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/datacred",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/datacred)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/datacred)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/metainfo/metc/cntinfo",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/metainfo/metc/cntinfo)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Contributor to the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publisher",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e2116" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubinfo/publish)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e2116)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e2116" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubinfo/publish)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e2116)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/pubinfo/publish",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/pubinfo/publish)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/pubinfo/publish)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Publisher of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publication Date",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e2006" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e2006)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e2006" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e2006)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/pubdate",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Date of publication of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Contact",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e994" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/ptcontac)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e994)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e994" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/ptcontac)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e994)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/ptcontac",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/ptcontac)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/ptcontac)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person responsible for answering questions about the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e496" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e496" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/descript/abstract)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/descript/abstract",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/descript/abstract)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Keyword",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e634" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/keywords/theme/themekey",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Distribution",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e11582" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e11582)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e11582" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e11582)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the resource is available, online, offline, inline."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Discovery",</xsl:text><xsl:text>"code":"LTER_Discovery",</xsl:text><xsl:text>"description":"Discovery level metadata should provide as much information as possible to support locating datasets by time, taxa, and/or geographic location in addition to basic identification information. Discovery level EML should include the coverage elements of temporalCoverage (when), taxonomicCoverage (what), and geographicCoverage (where) for the dataset as well as the change history in the maintenance element.",</xsl:text><xsl:text>"maximum":"4",</xsl:text><xsl:variable name="LTER_Discovery.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/spdom/bounding//*)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/spdom/bounding//*)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/status/update)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Taxonomic Extent",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"The extent of the taxonomies coverage."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Extent",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e7379" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/spdom/bounding//*)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e7379)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e7379" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/spdom/bounding//*)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e7379)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/spdom/bounding//*",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/spdom/bounding//*)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/spdom/bounding//*)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The spatial extent of the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Temporal Extent",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e6109" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e6109)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e6109" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e6109)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/timeperd/timeinfo/rngdates",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The temporal extent of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Maintenance",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e11632" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e11632)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e11632" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/status/update)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e11632)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/status/update",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/status/update)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Describes changes to the data tables or metadata, including update frequency."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Evaluation",</xsl:text><xsl:text>"code":"LTER_Evaluation",</xsl:text><xsl:text>"description":"Evaluation level metadata should include detailed descriptions of the project, methods, protocols, and intellectual rights in order for a potential user to evaluate the relevance of the data package for their research study or synthesis project.",</xsl:text><xsl:text>"maximum":"5",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/lineage/dataqual/procstep)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/eainfo/detailed/enttyp/enttypd)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/eainfo/detailed/attr/attrdef)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/useconst)"></xsl:sequence><xsl:sequence select="count(/metadata/lineage/dataqual/procstep)"></xsl:sequence><xsl:sequence select="count(/metadata/eainfo/detailed/enttyp/enttypd)"></xsl:sequence><xsl:sequence select="count(/metadata/eainfo/detailed/attr/attrdef)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Use Constraints",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e4826" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e4826)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e4826" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/useconst)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e4826)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/useconst",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/useconst)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the data may or may not be used after access is granted to assure the protection of privacy or intellectual property. This includes any special restrictions, legal prerequisites, terms and conditions, and/or limitations on using the data set. Data providers may request acknowledgement of the data from users and claim no responsibility for quality and completeness of data."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Process Step",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5500" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/lineage/dataqual/procstep)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5500)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5500" as="xs:integer+"><xsl:sequence select="count(/metadata/lineage/dataqual/procstep)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5500)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/lineage/dataqual/procstep",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/lineage/dataqual/procstep)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/lineage/dataqual/procstep)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A step in the processing that produced a resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Project Description",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"Description of the project."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Entity Type Definition",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5584" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/eainfo/detailed/enttyp/enttypd)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5584)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5584" as="xs:integer+"><xsl:sequence select="count(/metadata/eainfo/detailed/enttyp/enttypd)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5584)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/eainfo/detailed/enttyp/enttypd",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/eainfo/detailed/enttyp/enttypd)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/eainfo/detailed/enttyp/enttypd)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The description of the entity type"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Attribute Definition",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5633" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/eainfo/detailed/attr/attrdef)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5633)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5633" as="xs:integer+"><xsl:sequence select="count(/metadata/eainfo/detailed/attr/attrdef)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5633)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/eainfo/detailed/attr/attrdef",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/eainfo/detailed/attr/attrdef)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/eainfo/detailed/attr/attrdef)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The description of the attribute"</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"rubricType":"LTER",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"20",</xsl:text><xsl:variable name="rubricExists" as="xs:integer+"><xsl:sequence select="$LTER_Identification.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Discovery.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Evaluation.itemExists"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence select="$LTER_Identification.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Discovery.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Evaluation.itemCounts"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template></xsl:stylesheet>