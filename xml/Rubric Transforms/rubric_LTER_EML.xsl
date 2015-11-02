<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd" xmlns:thredds="http://www.unidata.ucar.edu/namespaces/thredds/InvCatalog/v1.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fgdc="http://www.fgdc.gov/metadata/csdgm" version="2.0"><xsl:param name="recordSetPath"></xsl:param><xsl:param name="fileNamePattern"></xsl:param><xsl:output method="text"></xsl:output><xsl:template match="/"><xsl:variable name="xmlFilesSelect" select="concat($recordSetPath, '?select=',$fileNamePattern)"></xsl:variable><xsl:text>{"records": [</xsl:text><xsl:for-each select="collection(iri-to-uri($xmlFilesSelect))"><xsl:call-template name="writeSpirals"></xsl:call-template></xsl:for-each><xsl:text>]}</xsl:text></xsl:template><xsl:template name="writeSpirals"><xsl:if test="position()!=1"><xsl:text>,</xsl:text></xsl:if><xsl:text>{"spirals": [</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Identification",</xsl:text><xsl:text>"code":"LTER_Identification",</xsl:text><xsl:text>"description":"Minimum content for adequate data set discovery in a general cataloging system or repository (functionally equivalent to LTER DTOC)",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable name="LTER_Identification.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/eml/@packageId)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/title | /eml/dataset/title)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/creator | /eml/dataset/creator)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/metadataProvider)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/associatedParty)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/publisher)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/pubDate | /eml/dataset/pubDate)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/contact)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/dataset/abstract | /eml/dataset/abstract)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/keywordSet/keyword/text | /eml/dataset/keywordSet/keyword)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/distribution)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts" as="xs:integer+"><xsl:sequence select="count(/eml/@packageId)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/title) + count(/eml/dataset/title)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/creator) + count(/eml/dataset/creator)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/metadataProvider)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/associatedParty)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/publisher)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/pubDate) + count(/eml/dataset/pubDate)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/contact)"></xsl:sequence><xsl:sequence select="count(/dataset/abstract) + count(/eml/dataset/abstract)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/keywordSet/keyword/text) + count(/eml/dataset/keywordSet/keyword)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/distribution)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e2550" as="xs:integer+"><xsl:sequence select="if(exists(/eml/@packageId)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e2550)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e2550" as="xs:integer+"><xsl:sequence select="count(/eml/@packageId)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e2550)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/@packageId",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/@packageId)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/@packageId)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e250" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/title | /eml/dataset/title)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e250)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e250" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/title | /eml/dataset/title)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e250)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/title",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/title)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/title)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/title",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/title)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/title)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e3647" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/creator | /eml/dataset/creator)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e3647)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e3647" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/creator | /eml/dataset/creator)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e3647)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/creator",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/creator)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/creator)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/creator",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/creator)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/creator)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"In CSW this concept is called Creator",</xsl:text><xsl:text>"description":"The principal author of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Contact",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e861" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/metadataProvider)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e861)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e861" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/metadataProvider)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e861)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/metadataProvider",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/metadataProvider)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/metadataProvider)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person currently responsible for the metadata."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Name",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e4258" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/associatedParty)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e4258)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e4258" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/associatedParty)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e4258)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/associatedParty",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/associatedParty)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/associatedParty)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Contributor to the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publisher",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e2056" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/publisher)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e2056)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e2056" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/publisher)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e2056)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/publisher",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/publisher)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/publisher)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Publisher of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publication Date",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e1946" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/pubDate | /eml/dataset/pubDate)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e1946)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e1946" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/pubDate | /eml/dataset/pubDate)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e1946)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/pubDate",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/pubDate)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/pubDate)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/pubDate",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/pubDate)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/pubDate)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Date of publication of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Contact",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e933" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/contact)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e933)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e933" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/contact)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e933)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/contact",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/contact)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/contact)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person responsible for answering questions about the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e461" as="xs:integer+"><xsl:sequence select="if(exists(/dataset/abstract | /eml/dataset/abstract)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e461)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e461" as="xs:integer+"><xsl:sequence select="count(/dataset/abstract | /eml/dataset/abstract)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e461)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/dataset/abstract",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/dataset/abstract)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/dataset/abstract)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/abstract",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/abstract)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/abstract)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Theme Keyword",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e586" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/keywordSet/keyword/text | /eml/dataset/keywordSet/keyword)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e586)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e586" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/keywordSet/keyword/text | /eml/dataset/keywordSet/keyword)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e586)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/keywordSet/keyword/text",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/keywordSet/keyword/text)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/keywordSet/keyword/text)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/keywordSet/keyword",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/keywordSet/keyword)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/keywordSet/keyword)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Distribution",</xsl:text><xsl:variable name="LTER_Identification.itemExists.d1e11076" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/distribution)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemExists.d1e11076)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Identification.itemCounts.d1e11076" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/distribution)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Identification.itemCounts.d1e11076)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/distribution",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/distribution)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/distribution)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the resource is available, online, offline, inline."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Discovery",</xsl:text><xsl:text>"code":"LTER_Discovery",</xsl:text><xsl:text>"description":"Discovery level metadata should provide as much information as possible to support locating datasets by time, taxa, and/or geographic location in addition to basic identification information. Discovery level EML should include the coverage elements of temporalCoverage (when), taxonomicCoverage (what), and geographicCoverage (where) for the dataset as well as the change history in the maintenance element.",</xsl:text><xsl:text>"maximum":"4",</xsl:text><xsl:variable name="LTER_Discovery.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/coverage/taxonomicCoverage)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/coverage/geographicCoverage)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/coverage/temporalCoverage)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/maintenance/description)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/coverage/taxonomicCoverage)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/coverage/geographicCoverage)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/coverage/temporalCoverage)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/maintenance/description)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Taxonomic Extent",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e11106" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/coverage/taxonomicCoverage)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e11106)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e11106" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/coverage/taxonomicCoverage)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e11106)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/coverage/taxonomicCoverage",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/coverage/taxonomicCoverage)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/coverage/taxonomicCoverage)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The extent of the taxonomies coverage."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Extent",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e7100" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/coverage/geographicCoverage)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e7100)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e7100" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/coverage/geographicCoverage)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e7100)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/coverage/geographicCoverage",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/coverage/geographicCoverage)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/coverage/geographicCoverage)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The spatial extent of the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Temporal Extent",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e5868" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/coverage/temporalCoverage)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e5868)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e5868" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/coverage/temporalCoverage)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e5868)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/coverage/temporalCoverage",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/coverage/temporalCoverage)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/coverage/temporalCoverage)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The temporal extent of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Maintenance",</xsl:text><xsl:variable name="LTER_Discovery.itemExists.d1e11120" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/maintenance/description)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemExists.d1e11120)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Discovery.itemCounts.d1e11120" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/maintenance/description)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Discovery.itemCounts.d1e11120)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/maintenance/description",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/maintenance/description)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/maintenance/description)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Describes changes to the data tables or metadata, including update frequency."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Evaluation",</xsl:text><xsl:text>"code":"LTER_Evaluation",</xsl:text><xsl:text>"description":"Evaluation level metadata should include detailed descriptions of the project, methods, protocols, and intellectual rights in order for a potential user to evaluate the relevance of the data package for their research study or synthesis project.",</xsl:text><xsl:text>"maximum":"5",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/intellectualRights)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/project)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/dataTable/entityDescription)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/dataTable/attributeList/attribute )) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/intellectualRights)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/methods)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/methods)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/project)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/dataTable/entityDescription)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/dataTable/attributeList/attribute )"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Use Constraints",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e4605" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/intellectualRights)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e4605)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e4605" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/intellectualRights)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e4605)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/intellectualRights",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/intellectualRights)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/intellectualRights)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the data may or may not be used after access is granted to assure the protection of privacy or intellectual property. This includes any special restrictions, legal prerequisites, terms and conditions, and/or limitations on using the data set. Data providers may request acknowledgement of the data from users and claim no responsibility for quality and completeness of data."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Process Step",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5284" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5284)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5284" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/methods)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5284)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/methods",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/methods)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A step in the processing that produced a resource"</xsl:text><xsl:text>}</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Process Step",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e7460" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e7460)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e7460" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/methods)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e7460)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/methods",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/methods)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/methods)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about an event or transformation in the life of a resource including the process used to maintain the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Project Description",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e11152" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/project)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e11152)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e11152" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/project)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e11152)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/project",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/project)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/project)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Description of the project."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Entity Type Definition",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5361" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/dataTable/entityDescription)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5361)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5361" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/dataTable/entityDescription)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5361)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/dataTable/entityDescription",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/dataTable/entityDescription)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/dataTable/entityDescription)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The description of the entity type"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Attribute Definition",</xsl:text><xsl:variable name="LTER_Evaluation.itemExists.d1e5410" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/dataTable/attributeList/attribute )) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemExists.d1e5410)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Evaluation.itemCounts.d1e5410" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/dataTable/attributeList/attribute )"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Evaluation.itemCounts.d1e5410)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/dataTable/attributeList/attribute ",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/dataTable/attributeList/attribute )) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/dataTable/attributeList/attribute )"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The description of the attribute"</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Access",</xsl:text><xsl:text>"code":"LTER_Access",</xsl:text><xsl:text>"description":"Access-level metadata should provide a user with all the information needed to access and download the data tables, even if the tables’ attributes are not thoroughly described. The tags required at this level specify access control and the physical description of the table.",</xsl:text><xsl:text>"maximum":"2",</xsl:text><xsl:variable name="LTER_Access.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/access)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/eml/dataset/dataTable/physical)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Access.itemCounts" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/access)"></xsl:sequence><xsl:sequence select="count(/eml/dataset/dataTable/physical)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Access Constraints",</xsl:text><xsl:variable name="LTER_Access.itemExists.d1e4539" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/access)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemExists.d1e4539)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Access.itemCounts.d1e4539" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/access)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemCounts.d1e4539)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/access",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/access)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/access)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about any constraints for accessing the data set. This includes any special restrictions, legal prerequisites, limitations and/or warnings on obtaining the data set. Some words that may be used in this field include: Public, In-house, Limited, Additional detailed instructions on how to access the data can be entered in this field."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Format",</xsl:text><xsl:variable name="LTER_Access.itemExists.d1e4315" as="xs:integer+"><xsl:sequence select="if(exists(/eml/dataset/dataTable/physical)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemExists.d1e4315)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Access.itemCounts.d1e4315" as="xs:integer+"><xsl:sequence select="count(/eml/dataset/dataTable/physical)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Access.itemCounts.d1e4315)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/eml/dataset/dataTable/physical",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/eml/dataset/dataTable/physical)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/eml/dataset/dataTable/physical)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The physical or digital manifestation of the resource"</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"LTER Completeness-Integration",</xsl:text><xsl:text>"code":"LTER_Integration",</xsl:text><xsl:text>"description":"Integration-level metadata should support computer-mediated access and processing of data, and therefore requires that all aspects of the data package be fully described. ",</xsl:text><xsl:text>"maximum":"3",</xsl:text><xsl:variable name="LTER_Integration.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(//methods/qualityControl)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Integration.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Integration.itemCounts" as="xs:integer+"><xsl:sequence select="count(//methods/qualityControl)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Integration.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text>,
,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Quality Description",</xsl:text><xsl:variable name="LTER_Integration.itemExists.d1e7391" as="xs:integer+"><xsl:sequence select="if(exists(//methods/qualityControl)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Integration.itemExists.d1e7391)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="LTER_Integration.itemCounts.d1e7391" as="xs:integer+"><xsl:sequence select="count(//methods/qualityControl)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($LTER_Integration.itemCounts.d1e7391)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"//methods/qualityControl",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(//methods/qualityControl)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(//methods/qualityControl)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"ISO-1 provides free text fields for describing quality information in the DQ_MeasureReference, DQ_EvaluationMethod, and DQ_DescriptiveResult objects.",</xsl:text><xsl:text>"description":"Description of the quality of the resource or any quality assurance procedures followed in producing the resource."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"rubricType":"LTER",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"25",</xsl:text><xsl:variable name="rubricExists" as="xs:integer+"><xsl:sequence select="$LTER_Identification.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Discovery.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Evaluation.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Access.itemExists"></xsl:sequence><xsl:sequence select="$LTER_Integration.itemExists"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence select="$LTER_Identification.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Discovery.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Evaluation.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Access.itemCounts"></xsl:sequence><xsl:sequence select="$LTER_Integration.itemCounts"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template></xsl:stylesheet>