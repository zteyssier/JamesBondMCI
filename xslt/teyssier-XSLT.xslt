<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:variable name="IntroSongColl" select="collection('../XML-Intro-Songs/?select=*.xml')"/>
    <xsl:template match = "/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../BondMCI-Website/Intro-Songs.css"/>
                <title>
                    
                </title>
            </head>
            <body>
               <!-- <h1 id="H"><u><xsl:apply-templates select="descendant::SongTitle"/></u></h1>-->
               
                <hr/>
                <section id="contents">
                    <h1><b>James Bond Intro Songs</b></h1>
                    <table> 
                        <tr>
                            <th>Song Title</th>
                            <th>Artists</th>
                            <th>Movie Correlation</th>
                        </tr>
                        <xsl:for-each select = "$IntroSongColl//IntroSong">
                            <xsl:sort select = "Song/@num=>number()"/><tr>
                            <td><a href = "#{current()/Song/SongTitle!substring-before(., ' ')}{-Song/@num}"><xsl:apply-templates select = "Song/SongTitle"/></a></td>
                                <td><xsl:apply-templates select = "Song/Artist"/></td>
                            <td><ul><xsl:apply-templates select = "Song/FilmTitle" mode = "toc"/></ul></td>
                           
                        </tr>
                        </xsl:for-each>
                        <!--<xsl:apply-templates select="descendant::scene" mode="toc"/>-->
                    </table>
                </section>
                <hr/>
                <br/>
                
              
                
                <section id="readingView">
                <xsl:for-each select = "$IntroSongColl//IntroSong">
                    <xsl:sort select = "Song/@num=>number()"/>
                    <section class="song"><h2 id="{current()/Song/SongTitle!substring-before(., ' ')}{-Song/@num}"><a href="#H"><xsl:apply-templates select="Song[num]"/></a></h2>
                        
                    <a href = "#H"><h2><xsl:apply-templates select = "descendant::SongTitle"/></h2></a>
                    <xsl:apply-templates select="descendant::Verse"/><br/></section>
              
                
                </xsl:for-each>
           
            </section>
            </body>
                    
            
        </html>
        
       
       
    </xsl:template>

    <xsl:template match="Song/FilmTitle" mode="toc">
        
            
               <xsl:choose> <xsl:when test="@target"><li><a href="{@target}"><xsl:apply-templates/></a></li></xsl:when>
                   <xsl:otherwise><li><xsl:apply-templates/></li></xsl:otherwise>               
               </xsl:choose>
 
    </xsl:template>
    <xsl:template match = "Verse">
        <div class="Verse"><xsl:apply-templates/></div>
    </xsl:template>
 
    <xsl:template match="lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
</xsl:stylesheet>
