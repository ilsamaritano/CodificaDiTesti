<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Progetto di Codifica di Testi - Prolusioni 10 e 11 di F. De Saussure</title>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                
                <script src="tooltip.js"></script>
                <script src="imgjs.js"></script>
                <script src="mark.js"></script>
                <script src="map.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <header>
                    <nav class="navMenu">
                        <ul> 
                            <li><a href="#info">Informazioni</a></li>
                            <li><a href="#p10">Pagina 10</a></li>
                            <li><a href="#p11">Pagina 11</a></li>
                            <li><a href="#append">Appendice</a></li>
                        </ul>
                    </nav>
                </header>
                <div id="infogenerali">
                    <h3>doc. <xsl:value-of select="//tei:idno" /></h3>
                    <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                    <h3><xsl:value-of select="//tei:title[@xml:lang='it']" /></h3>
                    <h2>di <xsl:apply-templates select="//tei:author[@ref='FDS']" /></h2>
                </div>
                
                <div>
                    <div id="info">
                        <article>
                            <h2>Caratteristiche</h2>
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat(//tei:author[@ref='FDS']/@ref, '.jpg')" />
                                </xsl:attribute>
                            </xsl:element>
                            <div>
                                <xsl:apply-templates select="//tei:msContents" />
                            </div>
                            <div>
                                <div>
                                    <xsl:apply-templates select="//tei:physDesc" />
                                </div>
                                <div>
                                    <h3>Storia editoriale</h3>
                                    <xsl:apply-templates select="//tei:history" />
                                </div>
                            </div>
                        </article>
                        
                        <div id="fenomeni">
                            <div class='legenda'>
                                <h3>Legenda</h3>
                                <ul class='legend-labels'>
                                    <li><span></span>Correzione editore</li>
                                    <li><span></span>Termine</li>
                                    <li><span></span>Glottonimo</li>
                                    <li><span></span>Es. linguistico</li>
                                    <li><span></span>Gap</li>
                                    <li><b>&lt;&gt;</b><br />Agg. a margine</li>
                                    <li><b>^</b> <br />Agg. sul testo</li>
                                    <li><b>*</b> <br />Supplemento editore</li>
                                </ul>
                            </div>
                            
                            <div id="bottoni">
                                <h3>Visualizza fenomeni notevoli</h3>
                                <button type="button" id="abbreviazioni">Abbreviazioni</button>
                                <button type="button" id="del">Cancellazioni</button>
                                <button type="button" id="reg">Correzioni</button>
                                <button type="button" id="mark">Terminologia</button>
                                <button type="button" id="esling">Esempi linguistici</button>
                                <button type="button" id="add">Aggiunte</button>
                                <div class="gaps">
                                    <label class="container">
                                        <input type="checkbox" id="gap">
                                        </input>
                                        Gap
                                    </label> 
                                </div>
                            </div>
                            <label class="container">
                                <input type="checkbox" id="map">
                                </input>
                                Visualizza la mappa
                            </label> 
                        </div>
                    </div>
                    
                </div>
                
                
                
                
                <article id="p10">
                    <h2> Pagina 10 </h2>
                    <button type="button" id="ruotapag10"> Mostra retro </button>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='P2_10']" />
                            <xsl:apply-templates select="//tei:surface[@xml:id='P2_10R']" />
                        </div>
                        <div class="testoorig">
                            <h3>Testo originale</h3>
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '10']" />
                        </div>
                        
                        <div id="traduzionepag10">
                            <h3>Traduzione</h3>
                            <xsl:apply-templates select="//tei:div[@type='traduzionepag10']" />
                        </div>
                    </div>
                </article>
                <article id="p11">
                    <h2> Pagina 11 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='P2_11']" />
                        </div>
                        <div class="testo">
                            <h3>Testo originale</h3>
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '11']" />
                        </div>
                        <div id="traduzionepag11">
                            <h3>Traduzione</h3>
                            <xsl:apply-templates select="//tei:div[@type='traduzionepag11']" />
                        </div>
                    </div>
                </article>
                
                <article>
                    <h2> Bibliografia </h2>
                    <div class="bibl">
                        <xsl:apply-templates select="//tei:listBibl" />
                    </div>
                </article>
                
                <div id="append">
                    <h2 id="about">Riferimenti</h2>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Da qui in poi le definizioni generali dei template applicati poi sopra -->
    
    <!-- Informazioni sull'edizione -->
    <xsl:template match="tei:editionStmt">
        <b><xsl:value-of select="current()/tei:edition"></xsl:value-of></b>
        <p><b>Progetto a cura di: </b> <i><xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='CB']"></xsl:value-of></i> e <i><xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='VS']"></xsl:value-of></i></p>
        <p><b>Coordinato da: </b> <i><xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of></i></p>
        <p><b>Traduzione di: </b> <i><xsl:value-of select="//tei:name[@ref='EF']"></xsl:value-of></i></p>
    </xsl:template>
    
    
    <!-- Storia -->
    <xsl:template match="tei:history">
        <xsl:apply-templates select="current()/tei:origin" />
    </xsl:template>
    
    <!-- Template msContents -->
    <xsl:template match="tei:msContents">
        <b>Titolo:</b><xsl:value-of select="//tei:msItem/tei:title" />
        <br />
        <b>Autore: </b><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" />
        <br />
        <b>Lingua: </b><xsl:value-of select="//tei:language" />
        <br />
        <b>Acquisizione:</b><xsl:apply-templates select="//tei:settingDesc/tei:setting/tei:name" />
        <br />
        <b>Data:</b><xsl:value-of select="//tei:time" />
    </xsl:template>
    
    <!-- Templates dei fenomeni del documento -->
    
    <!-- Cancellature -->
    <xsl:template match="tei:del">
        <del><xsl:apply-templates /></del>
    </xsl:template>
    
    <!-- Aggiunte -->
    <xsl:template match="tei:add">
        <xsl:choose>
            <xsl:when test="current()[@place='margin']">
                <add><b>&lt;</b><i>(<xsl:apply-templates />)<b>&gt;</b></i></add>
            </xsl:when>
            <xsl:otherwise>
                <add><b>^</b><i>(<xsl:apply-templates />)</i></add>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Supplied -->
    <xsl:template match="tei:supplied">
        <add><b>*</b><i>(<xsl:apply-templates />)</i></add>
    </xsl:template>
    
    <!-- Forma originale -->
    <xsl:template match="tei:orig">
        <orig><xsl:apply-templates /></orig>
    </xsl:template>
    
    <!-- Forma regolarizzata (reg) -->
    <xsl:template match="tei:reg">
        <reg><xsl:apply-templates /></reg>
    </xsl:template>
    
    <!-- Glottonimo -->
    <xsl:template match="tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lang</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    
    <!-- Esempio linguistico -->
    <xsl:template match="tei:mentioned">
        <xsl:choose>
            <xsl:when test="current()[@rend='underline']">
                <mentioned>
                    <u>
                        <xsl:apply-templates />
                    </u>
                </mentioned>
            </xsl:when>
            <xsl:otherwise>
                <mentioned>
                    <xsl:apply-templates />
                </mentioned>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- Abbreviazioni -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:value-of select="current()" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            -<i><xsl:value-of select="current()" /></i>-
        </xsl:element>
    </xsl:template>
    
    <!-- Elementi mancanti --> 
    <xsl:template match="tei:gap">
        <span class="gap">?</span>
    </xsl:template>
    
    <!-- Termini stranieri e corsivo --> 
    <xsl:template match="tei:foreign | tei:hi[@rend = 'italic']">
        <i><xsl:apply-templates /></i>
    </xsl:template>
    
    <!-- Grassetto --> 
    <xsl:template match="tei:hi[@rend = 'bold']">
        <b><xsl:apply-templates /></b>
    </xsl:template>
    
    <!-- Sottolineature --> 
    <xsl:template match="tei:emph[@rend = 'underline']">
        <u><xsl:apply-templates /></u>
    </xsl:template>
    
    <!-- Page beginning --> 
    <xsl:template match="tei:pb">
        <xsl:element name="div">
            <xsl:attribute name="id">pagina_<xsl:value-of select="current()/@n" /></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- Line beginning --> 
    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="span">
            <xsl:attribute name="class">numeroRiga</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="current()/@xml:id"/></xsl:attribute>
            <b><xsl:value-of select="@n" /></b>
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:term | tei:persName | tei:placeName | tei:author">
        
        <xsl:element name="span">
            <xsl:choose>
                <xsl:when test="name() = 'term'">
                    <xsl:attribute name="class">termini</xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="current()/@ref" />
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="name() = 'persName'">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()" />
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="current()/@ref" />
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="name() = 'placeName'">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()" />
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="current()/@ref" />
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="name() = 'author'">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()" />
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="current()/@ref" />
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            
            <xsl:apply-templates />
            
            <!-- Descrizione dei termini / persone / luoghi -->
            
            <xsl:element name="span">
                <xsl:choose>
                    <xsl:when test="name() = 'term'">
                        <xsl:attribute name="class">tooltipTermine</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('desc_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
                    </xsl:when>
                    
                    <xsl:when test="name() = 'author'">
                        <xsl:attribute name="class">tooltipPersona</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('desc_', substring(current()/@ref, 1))" />
                        </xsl:attribute>
                        <xsl:element name="span">
                            Nato il <xsl:value-of select="//tei:person/tei:birth/tei:date" /> a <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:settlement" />, <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:country" />
                            <br />
                            <xsl:if test="//tei:person/tei:death">
                                Morto il <xsl:value-of select="//tei:person/tei:death/tei:date" /> a <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement" />, <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:country" />
                            </xsl:if>
                        </xsl:element>                        
                    </xsl:when>
                    
                    <xsl:when test="name() = 'placeName'">
                        <xsl:attribute name="class">tooltipLuogo</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('desc_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <b>
                            <xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement" />, 
                            <xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:country" />
                        </b>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Template immagini -->
    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat(@xml:id, '.jpg')" />
            </xsl:attribute>
        </xsl:element>
        
        <xsl:element name="map">
            <xsl:for-each select="current()/tei:zone">
                <xsl:variable name="ulx" select="@ulx" />
                <xsl:variable name="uly" select="@uly" />
                <xsl:variable name="lrx" select="@lrx" />
                <xsl:variable name="lry" select="@lry" />
                <xsl:variable name="ratio" select="400 div 4032" />
                
                <xsl:element name="area">
                    <xsl:attribute name="shape">rect</xsl:attribute>
                    <xsl:attribute name="coords">
                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)" />
                    </xsl:attribute>
                    
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id" />
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="starts-with(@xml:id, 'P10')">
                            <xsl:attribute name="style"> <!-- P10 -->
                                position: absolute;
                                top: <xsl:value-of select="concat(($uly * $ratio), 'px')" />;
                                left: <xsl:value-of select="concat(68+($ulx * $ratio), 'px')" />;
                                width: <xsl:value-of select="concat(16+($lrx - $ulx) * $ratio, 'px')" />;
                                height: <xsl:value-of select="concat(($lry - $uly) * $ratio, 'px')" />;
                                opacity: 0.5;
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise> <!-- P11 -->
                            <xsl:attribute name="style">
                                position: absolute;
                                top: <xsl:value-of select="concat(($uly * $ratio), 'px')" />;
                                left: <xsl:value-of select="concat(68+($ulx * $ratio), 'px')" />;
                                width: <xsl:value-of select="concat(16+($lrx - $ulx) * $ratio, 'px')" />;
                                height: <xsl:value-of select="concat(($lry - $uly) * $ratio, 'px')" />;
                                opacity: 0.5;
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- Template traduzione -->
    
    <!-- Template physDesc -->
    <xsl:template match="tei:physDesc">
        <xsl:element name="div">
            <xsl:element name="h3">Descrizione fisica</xsl:element>
            <xsl:element name="div">
                <b>Supporto: </b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:support" />
                </xsl:element> 
                <br />
                <b>Quantità: </b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:extent" />
                </xsl:element>
                <br />
                <b>Condizioni: </b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:condition" />
                </xsl:element>
                <br />
                <b>Layout:</b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:layout" />
                </xsl:element>
                <br />
                <b>Grafia: </b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:typeDesc" />
                </xsl:element> 
                <br />
                <b>Mani: </b>
                <xsl:element name="a">
                    <xsl:apply-templates select="current()//tei:handDesc" />
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    <!-- Template bibliografia -->
    <xsl:template match="tei:listBibl">
        <xsl:for-each select="current()/tei:bibl">
            <xsl:element name="li">
                <xsl:for-each select="current()//tei:author">
                    <xsl:value-of select="normalize-space(current())" />,
                </xsl:for-each> 
                <i><xsl:value-of select="current()/tei:title" /></i>. 
                <xsl:apply-templates select="current()/tei:pubPlace" />,
                <xsl:value-of select="current()/tei:publisher" />,
                <xsl:value-of select="current()/tei:date" />.
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
