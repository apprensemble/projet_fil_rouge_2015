<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- <xsl:output method="html"  encoding = "ISO-8859-1"/> -->

<xsl:variable name = "urlnumber">
 <xsl:value-of select="count(//url)"/>
</xsl:variable>

<xsl:variable name = "keyname">google</xsl:variable>

<xsl:template match="bookmark">
<html>
 <head>
	<TITLE>Bookmark</TITLE>
        <LINK rel="stylesheet" href="bookmark.css" type="text/css" />
</head>
	<body>
	<h1>Bookmark</h1>
	<xsl:apply-templates select = "node()" />
	<h5>Nombre de url: <xsl:value-of select = "$urlnumber" /></h5>
	........... <xsl:apply-templates select = "id($keyname)/.."/>
	</body>
</html>
</xsl:template>

<xsl:template match="java">
    <TABLE border = '1'>

      <TR>
	<TD align = 'center'><H3>Clé</H3></TD>
	<TD align = 'center'><H3>Url</H3></TD></TR>
      
	<xsl:apply-templates select = "*" />


    </TABLE>
</xsl:template>
<xsl:template match="java/url">
    <TR>
      <TD> <H4> <xsl:value-of select = "@keyname" /> </H4></TD>
      <TD class = 'urltext'> <xsl:value-of select = "." /> </TD>
    </TR>
</xsl:template>

<xsl:template match="url">
    <p class = 'urltext1'> <xsl:value-of select = "." /> </p>
</xsl:template>

<xsl:template match="voyage">
    <H4>Frères précédents de voyage : url</H4>
    <xsl:for-each select="preceding-sibling::*">
      <p><xsl:value-of select = "local-name()" />
      <xsl:for-each select="descendant::url">
	<xsl:sort order = "descending" select = "." />
	<xsl:text> - </xsl:text><xsl:value-of select = "." />
      </xsl:for-each>
      </p>
    </xsl:for-each>      
    <H4>Frères suivants de voyage : clé</H4>
    <xsl:for-each select="following-sibling::*">
      <p><xsl:value-of select = "local-name()" />
      <xsl:for-each select="descendant::url">
	<xsl:sort order = "descending" select = "." />
	<xsl:text> : </xsl:text><xsl:value-of select = "@keyname" />
      </xsl:for-each>
      </p>
    </xsl:for-each>   
</xsl:template>

<xsl:template match="//*[url/@keyname=$keyname]" >
    <xsl:text>Catégorie de </xsl:text><xsl:value-of select = "$keyname" /><xsl:text>: </xsl:text>
      <xsl:value-of select = "local-name()" />
</xsl:template>

<xsl:template match="text()">
</xsl:template>

<xsl:template match="comment()">
    comment: <xsl:value-of select = "." />
</xsl:template>

</xsl:stylesheet>

