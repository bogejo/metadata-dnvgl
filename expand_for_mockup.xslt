<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns="http://www.dnv.com/rulesandstandards/" xmlns:dnv="http://www.dnv.com/rulesandstandards/"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:categ-data="http://www.dnv.com/rulesandstandards/categ-data" exclude-result-prefixes="categ-data fn xs">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="dnv:document">
	<xsl:variable name="isVersionOf" select="dcterms:isVersionOf"/>
	<xsl:variable name="edition" select="dnv:edition"/>
	<xsl:variable name="isPartOf" select="dcterms:isPartOf"/>
	<document>
		<xsl:choose>
			<xsl:when test="$isPartOf = (1, 2, 4)">
				<businessArea>1</businessArea>
			</xsl:when>
			<xsl:when test="$isPartOf = (7)">
				<businessArea>3</businessArea>
			</xsl:when>
			<xsl:when test="$isPartOf = (8)">
				<businessArea>2</businessArea>
			</xsl:when>
					<xsl:otherwise>
				<businessArea>1</businessArea>
				<businessArea>2</businessArea>
				<businessArea>3</businessArea>
			</xsl:otherwise>
		</xsl:choose>
		<documentCode>DNVGL-zz-xxxx</documentCode>
		<xsl:apply-templates/>
	</document>
</xsl:template>

   <xsl:template match="@*|node()">  <!-- Identity -->
     <xsl:copy>
       <xsl:apply-templates select="@*|node()"/>
     </xsl:copy>
   </xsl:template>
	
</xsl:stylesheet>
