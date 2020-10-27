<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 27, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> eeb4</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:variable name="introSongsColl" as="document-node()+" select="collection('../XML-Intro-Songs/?select=*.xml')"/>
    
    <xsl:template match="/">
        
      <xsl:for-each select="$introSongsColl">
          <xsl:result-document method="xml" href="../Corr-XML-Intro-Songs/{tokenize(base-uri(), '/')[last()]}"> 
       
              <xsl:processing-instruction name="xml-model">
       href="../RNG-Intro-Songs/RNG-Intro-Songs.rnc" 
       type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
   
  <xsl:apply-templates select="processing-instruction()"/>
  
        <xsl:apply-templates/>
    
        </xsl:result-document> 
      </xsl:for-each>
    </xsl:template>
    
 <xsl:template match="processing-instruction()">
      
    </xsl:template>
 
</xsl:stylesheet>