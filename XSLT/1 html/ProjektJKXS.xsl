<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>pasja</title>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <div id="chinczyk">
          <h3>Chinczyk-co to?</h3>
          <xsl:apply-templates select="projekcik/pasja/strona[@part='chinczyk']"/>
        </div>
        <div id="zasady">
          
          <h3>Zasady</h3>
          <xsl:apply-templates select="projekcik/pasja/strona[@part='zasady']"/>
          <br/><br/><br/><br/>
          <xsl:call-template name="nazwa"/>
 
        </div>
        <br/>
        <apply-templates select="projekcik/pasja/strona/kostka"/>

        <br />
        <div id="link">
        <h3>Linki</h3>
          <xsl:copy-of select="$przycisk"/>
          <xsl:apply-templates select="projekcik/pasja/strona[@part='linki']"/><br/>
          <xsl:apply-templates select="projekcik/pasja/cena"/>
          
        </div>
        <footer>
          <xsl:apply-templates select="projekcik/autor"/>
        </footer>
      </body>
    </html>
  </xsl:template>
 
<xsl:template match="data">
<br/><br/>Daty:<br/>
<xsl:value-of select="format-number(rok[1],'#.##')"/><br/>
<xsl:value-of select="format-number(rok[2],'#.##')"/><br/>
</xsl:template>

<xsl:template match="cena">
  <xsl:value-of select='format-number(zl, "#%")'/>
</xsl:template>

  <xsl:template match="img">
    <xsl:choose>
      <xsl:when test="@source = 'img/plan.jpg'">
        <img class="right">
          <xsl:attribute name="src">
            <xsl:value-of select="@source"/>
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img class="left">
          <xsl:attribute name="src">
            <a href="{@href}"><xsl:value-of select="."/></a>
          </xsl:attribute>
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
 
<xsl:template match="nazwy">
    <br/>
    <xsl:for-each select="nazw">
      <xsl:sort select="nazwa" order="ascending"/>
      Jezyk: <xsl:number value="position()" format="1."/>
      <br/>
      <xsl:value-of select="nazwa"/>
      <br/><br/>
    </xsl:for-each>
  </xsl:template>

 <xsl:template name="nazwa">
  <xsl:text>
    Chinczyk
  </xsl:text>
  </xsl:template>

  <xsl:variable name="przycisk">
    <a href="#chinczyk">Przycisk</a><br/>
  </xsl:variable>

  <xsl:template match="autor">
    <div class="autor">
      <xsl:text>Stworzone przez: </xsl:text>
      <xsl:for-each select="*">
        <xsl:value-of select="."/>
      </xsl:for-each>
      
    </div>
  </xsl:template>
 
 <xsl:template match="@part">
  <xsl:if test="@part='chinczyk'">
    Halo
  </xsl:if>
</xsl:template>

<xsl:template match="kostka">
    <br/>
    <xsl:for-each select="ocz">
      <xsl:sort select="oczka" order="ascending"/>
      Oczko: <xsl:number value="position()" format="I"/>
      <br/>
      <xsl:value-of select="oczka"/>
      <br/><br/>
    </xsl:for-each>
  </xsl:template>



  <xsl:template match="linki"> 
    <xsl:apply-templates select="link[1]"/>
    <xsl:apply-templates select="link[2]"/>
    <xsl:apply-templates select="link[3]"/>
    
  </xsl:template>

  <xsl:template match="link">
  
    <li>
        <a>
            <xsl:attribute name="href">
              <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </li>
 
  </xsl:template>
 
</xsl:stylesheet>