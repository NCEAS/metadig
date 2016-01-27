<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd" xmlns:thredds="http://www.unidata.ucar.edu/namespaces/thredds/InvCatalog/v1.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fgdc="http://www.fgdc.gov/metadata/csdgm" version="2.0"><xsl:param name="recordSetPath"></xsl:param><xsl:param name="fileNamePattern"></xsl:param><xsl:output method="text"></xsl:output><xsl:template match="/"><xsl:variable name="xmlFilesSelect" select="concat($recordSetPath, '?select=',$fileNamePattern)"></xsl:variable><xsl:text>{"records": [</xsl:text><xsl:for-each select="collection(iri-to-uri($xmlFilesSelect))"><xsl:call-template name="writeSpirals"></xsl:call-template></xsl:for-each><xsl:text>]}</xsl:text></xsl:template><xsl:template name="writeSpirals"><xsl:if test="position()!=1"><xsl:text>,</xsl:text></xsl:if><xsl:text>{"spirals": [</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"FGDC for Data Discovery - Mandatory",</xsl:text><xsl:text>"code":"FGDC_Discovery-Mandatory",</xsl:text><xsl:text>"description":"The FGDC Content Standard for Digital Geospatial Metadata includes fields in the Identification Information and Metadata Reference Sections that are mandatory for data discovery. In the graphical representation of the standard, these are yellow fields included in yellow sections.",</xsl:text><xsl:text>"maximum":"20",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/idinfo/descript/purpose)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/status)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/spdom/bounding)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/accconst)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo/distliab)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo/distrib/cntinfo)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/metainfo/metstdn)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/metainfo/metstdv )) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/ordinst)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/fees)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/turnaro)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/descript/abstract)"></xsl:sequence><xsl:sequence select="count(/idinfo/descript/purpose)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/status)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/status/update)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/spdom/bounding)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/accconst)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/useconst)"></xsl:sequence><xsl:sequence select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo/distliab)"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo/distrib/cntinfo)"></xsl:sequence><xsl:sequence select="count(/metadata/metainfo/metc/cntinfo)"></xsl:sequence><xsl:sequence select="count(/metadata/metainfo/metstdn)"></xsl:sequence><xsl:sequence select="count(/metadata/metainfo/metstdv )"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo/distrib/storder/ordinst)"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo/distrib/storder/fees)"></xsl:sequence><xsl:sequence select="count(/metadata/distinfo/distrib/storder/turnaro)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e269" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e269" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/title",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/title)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/title)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Originating Organization",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e3890" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e3890)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e3890" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e3890)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/origin",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/origin)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/origin)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization responsible for creating the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publication Date",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e2003" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e2003)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e2003" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e2003)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/citation/citeinfo/pubdate",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/citation/citeinfo/pubdate)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/citation/citeinfo/pubdate)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Date of publication of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e496" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e496" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/descript/abstract)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/descript/abstract",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/descript/abstract)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/descript/abstract)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Purpose",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e2849" as="xs:integer+"><xsl:sequence select="if(exists(/idinfo/descript/purpose)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e2849)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e2849" as="xs:integer+"><xsl:sequence select="count(/idinfo/descript/purpose)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e2849)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/idinfo/descript/purpose",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/idinfo/descript/purpose)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/idinfo/descript/purpose)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A paragraph describing the original purpose for collecting the dataset."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Status",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e9126" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/status)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e9126)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e9126" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/status)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e9126)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/status",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/status)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/status)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The status of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Update Frequency",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6534" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6534)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6534" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/status/update)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6534)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/status/update",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/status/update)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/status/update)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The frequency with which changes and additions are made to the data set after the initial data set is completed"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Temporal Extent",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6114" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6114)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6114" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6114)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/timeperd/timeinfo/rngdates",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/timeperd/timeinfo/rngdates)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/timeperd/timeinfo/rngdates)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The temporal extent of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Bounding Box",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e4287" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/spdom/bounding)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e4287)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e4287" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/spdom/bounding)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e4287)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/spdom/bounding",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/spdom/bounding)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/spdom/bounding)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Coverage in the CSW Specification",</xsl:text><xsl:text>"description":"A bounding box for identifying a geographic area of interest"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Access Constraints",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e4757" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/accconst)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e4757)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e4757" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/accconst)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e4757)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/accconst",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/accconst)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/accconst)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about any constraints for accessing the data set. This includes any special restrictions, legal prerequisites, limitations and/or warnings on obtaining the data set. Some words that may be used in this field include: Public, In-house, Limited, Additional detailed instructions on how to access the data can be entered in this field."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Use Constraints",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e4826" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e4826)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e4826" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/useconst)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e4826)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/useconst",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/useconst)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/useconst)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the data may or may not be used after access is granted to assure the protection of privacy or intellectual property. This includes any special restrictions, legal prerequisites, terms and conditions, and/or limitations on using the data set. Data providers may request acknowledgement of the data from users and claim no responsibility for quality and completeness of data."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Keyword",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e634" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/idinfo/keywords/theme/themekey",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/idinfo/keywords/theme/themekey)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/idinfo/keywords/theme/themekey)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Distribution Liability",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6576" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo/distliab)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6576)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6576" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo/distliab)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6576)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo/distliab",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo/distliab)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo/distliab)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Statement of the liability assumed by the distributor."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Distribution Contact",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e5129" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo/distrib/cntinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e5129)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e5129" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo/distrib/cntinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e5129)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo/distrib/cntinfo",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo/distrib/cntinfo)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo/distrib/cntinfo)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Contact information for the organization or individual that distributes the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Contact",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e922" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e922)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e922" as="xs:integer+"><xsl:sequence select="count(/metadata/metainfo/metc/cntinfo)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e922)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/metainfo/metc/cntinfo",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/metainfo/metc/cntinfo)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/metainfo/metc/cntinfo)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person currently responsible for the metadata."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Standard Citation",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6341" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/metainfo/metstdn)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6341)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6341" as="xs:integer+"><xsl:sequence select="count(/metadata/metainfo/metstdn)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6341)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/metainfo/metstdn",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/metainfo/metstdn)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/metainfo/metstdn)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The name of the standard to which the metadata conforms"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Standard Version",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6369" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/metainfo/metstdv )) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6369)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6369" as="xs:integer+"><xsl:sequence select="count(/metadata/metainfo/metstdv )"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6369)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/metainfo/metstdv ",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/metainfo/metstdv )) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/metainfo/metstdv )"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The name of the standard to which the metadata conforms"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Ordering Instructions",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e4994" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/ordinst)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e4994)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e4994" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo/distrib/storder/ordinst)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e4994)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo/distrib/storder/ordinst",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo/distrib/storder/ordinst)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo/distrib/storder/ordinst)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"General instructions, terms and services provided by the distributor"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Cost or Fees",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e5017" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/fees)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e5017)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e5017" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo/distrib/storder/fees)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e5017)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo/distrib/storder/fees",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo/distrib/storder/fees)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo/distrib/storder/fees)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Cost associated with access to the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Turnaround",</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemExists.d1e6601" as="xs:integer+"><xsl:sequence select="if(exists(/metadata/distinfo/distrib/storder/turnaro)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemExists.d1e6601)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="FGDC_Discovery-Mandatory.itemCounts.d1e6601" as="xs:integer+"><xsl:sequence select="count(/metadata/distinfo/distrib/storder/turnaro)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($FGDC_Discovery-Mandatory.itemCounts.d1e6601)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/metadata/distinfo/distrib/storder/turnaro",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/metadata/distinfo/distrib/storder/turnaro)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/metadata/distinfo/distrib/storder/turnaro)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Typical turnaround time for the filling of an order."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"rubricType":"FGDC",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"20",</xsl:text><xsl:variable name="rubricExists" as="xs:integer+"><xsl:sequence select="$FGDC_Discovery-Mandatory.itemExists"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence select="$FGDC_Discovery-Mandatory.itemCounts"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template></xsl:stylesheet>