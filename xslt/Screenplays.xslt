<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="ScreenplayColl" select="collection('../XML-Screenplays/?select=*.xml')"/>
    <xsl:template match = "/">
    
    
           
    
        <xsl:for-each select = "$ScreenplayColl//Screenplay">
            <xsl:variable name = "currentplay" select = "current()"/>
            <xsl:variable name="filename" select="base-uri()!tokenize(., '/')[last()]!substring-before(., '.xml')"/>
            
            <xsl:result-document href = "../BondMCI-Website/{$filename}.html"  method = "xhtml">
           
            
            
      <html>  
         <head>
          
          <title>
              <xsl:apply-templates select = "descendant::FilmTitle"/>
          </title>
             <link rel="stylesheet" type="text/css" href="James-Bond-Intro-Songs.css"/>
      </head>    
          <body><section id="CharData">
              <xsl:variable name="CharNames" select="current()//spk!normalize-space()!upper-case(.)=>distinct-values()"/>
              <table>
                  <tr>
                      <th>Character Name</th>
                      <th>Gender</th>
                      <th>Speech Count</th>
                  </tr>
                  <xsl:for-each select ="$CharNames">
                      <tr>
                          <td><xsl:value-of select="current()"/></td>
                          <td><xsl:value-of select="($currentplay//spk[normalize-space()!upper-case(.)=current()])[1]/@sex"></xsl:value-of></td>
                          <td><xsl:value-of select="$currentplay//spk[normalize-space()!upper-case(.)=current()]=>count()"/></td>
                      </tr>
                     
                      
                  </xsl:for-each>
              </table>
              
              
              
          </section><section id="readingView">
                
            <h2 id="C{count(preceding-sibling::Script) + 1}"><a href="#H"><xsl:apply-templates select="Song[num]"/></a></h2>
            <a href = "#H"><h2><xsl:apply-templates select = "descendant::FilmTitle"/></h2></a>
            <xsl:apply-templates select="descendant::Scene"/>
            
        </section></body></html>
          
            
            
            
            </xsl:result-document></xsl:for-each>
        


</xsl:template>
   <!-- <xsl:template match = "Screenplay">
        <p><xsl:apply-templates/></p>
    </xsl:template>-->
    <xsl:template match = "sd">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match = "sp">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match = "spk">
        <b><xsl:apply-templates/>:</b>
    </xsl:template>
 </xsl:stylesheet>
