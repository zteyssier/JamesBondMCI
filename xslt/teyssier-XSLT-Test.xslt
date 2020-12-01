<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <xsl:variable name="IntroSongColl" select="collection('../XML-Intro-Songs/?select=*.xml')"/>
    <xsl:template match = "/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="James-Bond-Intro-Songs.css"/>
                <title>
                    
                </title>
            </head>
            <body>
               <!-- <h1 id="H"><u><xsl:apply-templates select="descendant::SongTitle"/></u></h1>-->
               
                <hr/>
                <section id="contents">
                    <h2><b>James Bond Intro Songs</b></h2>
                    <table> 
                        <tr>
                            <th>Song Title</th>
                            <th>Artists</th>
                            <th>Movie Correlation</th>
                        </tr>
                        <xsl:for-each select = "$IntroSongColl//IntroSong"> <tr>
                          <td><a href = "#H"><xsl:apply-templates select = "Song/SongTitle"/></a></td>
                            <td></td>
                            <td></td></tr>
                        </xsl:for-each>
                        <!--<xsl:apply-templates select="descendant::scene" mode="toc"/>-->
                    </table>
                </section>
                <hr/>
                <br/>
                
                <h4>Listen to an audio track that concides with the play:  <a href="https://youtu.be/__J_T2zzmQc">Ring Christmas Bells</a>  </h4>
                <!--<h1>Licence to Kill</h1>-->
                <xsl:for-each select = "$IntroSongColl//IntroSong"><section id="readingView">
                    <h2 id="C{count(preceding-sibling::Song) + 1}"><a href="#H"><xsl:apply-templates select="Song[num]"/></a></h2>
                    <a href = "#H"><h2><xsl:apply-templates select = "descendant::SongTitle"/></h2></a>
                    <xsl:apply-templates select="descendant::Verse"/><br/>
              
                </section></xsl:for-each>
            </body>
                    
            
        </html>
        
       
       
    </xsl:template>
<!--    <xsl:template match = "IntroSong">
        <p><apply-templates/></p>
    </xsl:template>-->

    <xsl:template match="Verse" mode="toc">
        <tr>
            <td><a href="#C{count(preceding-sibling::Song) + 1}">
                <xsl:apply-templates select="Song[num]"/></a>
            </td>
   <!--         <td><xsl:value-of select="string-join(sort(distinct-values(descendant::spk ! normalize-space())), ', ') "/></td>
            <td><xsl:value-of select="string-join(sort(distinct-values(descendant::pn ! normalize-space())), ', ')"/></td>  --> 
        </tr>
    </xsl:template>
    
    <xsl:template match="scene">
        <br/>
        <h2 id="C{count(preceding-sibling::Song) + 1}"><a href="#H"><xsl:apply-templates select="Song[num]"/></a></h2>
      <!--  <div class="p"><xsl:apply-templates select="sd"/></div>
        <div class="p"><xsl:apply-templates select="dial"/></div>-->
        
    </xsl:template>
    <xsl:template match="lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
</xsl:stylesheet>
