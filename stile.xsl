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
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                
            </head>
            <body>
                <header>
                    <div>
                        <h2>doc. <xsl:value-of select="//tei:idno" /></h2>
                        <h1 class="fr"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                        <h1 class="it"><xsl:value-of select="//tei:title[@xml:lang='it']" /></h1>
                        <h2>Autore: <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" /></h2>
                    </div>
                </header>
                
                <nav class="navMenu">
                    <ul> 
                        <li><a href="#info">Informazioni</a></li>
                        <li><a href="#p10">Pagina 10</a></li>
                        <li><a href="#p11">Pagina 11</a></li>
                        <li><a href="#append">Appendice</a></li>
                    </ul>
                </nav>
                <div>
                    <div id="info">
                        <article>
                            <h3>Caratteristiche</h3>
                            <div>
                                <div>
                                    <xsl:apply-templates select="//tei:msContents" />
                                    <h3>Storia editoriale</h3>
                                    <xsl:apply-templates select="//tei:history" />
                                </div>
                                <div>
                                    <h3>Descrizione fisica</h3>
                                    <xsl:apply-templates select="//tei:physDesc" />
                                </div>
                            </div>
                        </article>
                        
                        
                    </div>
                </div>
                <article id="p10">
                    <h2> Pagina 10 </h2>
                    <div class="page">
                        <div class="img">
                            <!--<xsl:apply-templates select="//tei:surface[@xml:id='P2_10']" />
                                 <xsl:apply-templates select="//tei:surface[@xml:id='P2_10R']" /> -->
                            <div>
                                <input type="checkbox" id="ruotapag10" /> Mostra retro
                            </div>
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '10']" />
                        </div>
                        
                        <div id="traduzionepag10">
                            <xsl:apply-templates select="//tei:div[@type='traduzionepag10']" />
                        </div>
                    </div>
                </article>
                <article id="p11">
                    <h2> Pagina 11 </h2>
                    <div class="page">
                        <div class="img">
                            <!--<xsl:apply-templates select="//tei:surface[@xml:id='P2_11']" /> -->
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '11']" />
                        </div>
                        <div id="traduzionepag11">
                            <xsl:apply-templates select="//tei:div[@type='traduzionepag11']" />
                        </div>
                    </div>
                </article>
                
                <div id="append">
                    <h3 id="about">Riferimenti</h3>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                    <p>Traduzione di: <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[@xml:id='EF']"></xsl:value-of></p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Da qui in poi le definizioni generali dei template applicati poi sopra -->
    
    <!-- Informazioni sull'edizione -->
    <xsl:template match="tei:editionStmt">
        <p><xsl:value-of select="current()/tei:edition"></xsl:value-of></p>
        <p>Progetto a cura di: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='CB']"></xsl:value-of> e <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='VS']"></xsl:value-of></p>
        <p>Coordinato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of></p>
    </xsl:template>
    
    
    <!-- Storia editoriale -->
    <xsl:template match="tei:history">
        <xsl:element name="div">
            <xsl:attribute name="id">history</xsl:attribute>
            <xsl:element name="h4">Cenni storici</xsl:element>
            <xsl:element name="h5">Origine della bozza</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docOrigin</xsl:attribute>
                <xsl:apply-templates select="current()/tei:origin" />
            </xsl:element>
            <xsl:element name="h5">Acquisizione</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docAcq</xsl:attribute>
                <xsl:apply-templates select="current()/tei:acquisition" />
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Templates dei fenomeni del documento -->
    
    <!-- Cancellature -->
    <xsl:template match="tei:del">
        <del><xsl:apply-templates /></del>
    </xsl:template>
    
    <!-- Aggiunte -->
    <xsl:template match="tei:add">
        <ins><xsl:apply-templates /></ins>
    </xsl:template>
    
    <!-- Abbreviazioni -->
    <xsl:template match="tei:abbr">
        <abbr><xsl:value-of select="current()" /></abbr>
    </xsl:template>
    
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:value-of select="current()" />
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
    
    <!-- Sottolineature --> 
    <xsl:template match="tei:hi[@rend = 'underline']">
        <u><xsl:apply-templates /></u>
    </xsl:template>
    
    <!-- Page beginning --> 
    <xsl:template match="tei:pb">
        <xsl:element name="span">
            <xsl:attribute name="class">pageNumber</xsl:attribute>
            <xsl:attribute name="id">page_<xsl:value-of select="current()/@n" /></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- Line beginning --> 
    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="span">
            <xsl:attribute name="class">lineNumber</xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="concat('line', substring(@xml:id, 6, 1), '_', @n)" />
            </xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:ptr">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="@target" />
                </xsl:attribute>
                <xsl:attribute name="class">noteIndex</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('n_', substring(current()/@target, 2))" />
                </xsl:attribute>
                <xsl:value-of select="substring(current()/@target, 10)" />
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='notes']">
        <xsl:element name="div">
            <xsl:attribute name="class">noteList</xsl:attribute>
            <xsl:for-each select="current()/tei:item">
                
                <xsl:element name="span">
                    <xsl:attribute name="class">noteIndex</xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="concat('i_', current()//@xml:id)" />
                    </xsl:attribute>
                    <xsl:value-of select="@n" />
                </xsl:element>
                
                <xsl:element name="span">
                    <xsl:attribute name="class">noteDesc</xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="current()//@xml:id" />
                    </xsl:attribute>
                    <xsl:apply-templates select="current()/tei:note" />
                </xsl:element>
                
                <br />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:term | tei:persName | tei:placeName">
        
        <xsl:element name="div">
            <xsl:attribute name="class">key</xsl:attribute>
            <xsl:element name="span">
                <xsl:choose>
                    <xsl:when test="name() = 'term'">
                        <xsl:attribute name="class">keyword</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('k_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'persName'">
                        <xsl:attribute name="class">
                            <xsl:value-of select="name()" />
                        </xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('pr_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'placeName'">
                        <xsl:attribute name="class">
                            <xsl:value-of select="name()" />
                        </xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('pl_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:apply-templates />
            </xsl:element>
            
            <!-- Descrizione dei termini -->
            
            <xsl:element name="div">
                <xsl:choose>
                    <xsl:when test="name() = 'term'">
                        <xsl:attribute name="class">tooltip keyDesc</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('kD_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
                    </xsl:when>
                    
                    <xsl:when test="name() = 'persName'">
                        <xsl:attribute name="class">tooltip persDesc</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('prD_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        
                        <xsl:element name="span">
                            
                            <xsl:attribute name="class">fullName</xsl:attribute>
                            <xsl:for-each select="//tei:person[concat('#', @xml:id) = current()/@ref]//tei:forename">
                                <xsl:apply-templates /><xsl:text> </xsl:text>
                            </xsl:for-each>
                            <xsl:text> </xsl:text>
                            <xsl:for-each select="//tei:person[concat('#', @xml:id) = current()/@ref]//tei:surname">
                                <xsl:apply-templates /><xsl:text> </xsl:text>
                            </xsl:for-each>
                            <xsl:element name="img">
                                <xsl:attribute name="class">icon</xsl:attribute>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('', //tei:person[concat('#', @xml:id) = current()/@ref]/tei:sex, 'M.ico')" />
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="concat('Sesso ', //tei:person[concat('#', @xml:id) = current()/@ref]/tei:sex)" />
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:element> <br />
                        
                        <xsl:element name="span">
                            <xsl:attribute name="class">birth</xsl:attribute>
                            <xsl:element name="img">
                                <xsl:attribute name="class">icon</xsl:attribute>
                                <xsl:attribute name="src">src/birth.png</xsl:attribute>
                                <xsl:attribute name="alt">Icon nascita</xsl:attribute>
                                <xsl:text> </xsl:text>
                                <span><xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:birth//tei:settlement[@type='municipality']" /></span>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:birth/tei:date" />
                            </xsl:element>
                        </xsl:element> <br />
                        
                        <xsl:if test="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death">
                            <xsl:element name="span">
                                <xsl:attribute name="class">death</xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="class">icon</xsl:attribute>
                                    <xsl:attribute name="src">src/death.png</xsl:attribute>
                                    <xsl:attribute name="alt">Icon morte</xsl:attribute>
                                    <xsl:text> </xsl:text>
                                    <span><xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death//tei:settlement[@type='municipality']" /></span>
                                    <xsl:text>, </xsl:text>
                                    <xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death/tei:date" />
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        
                    </xsl:when>
                    
                    <xsl:when test="name() = 'placeName'">
                        <xsl:attribute name="class">tooltip placeDesc</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('plD_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <xsl:element name="span">
                            <xsl:attribute name="class">settlement</xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'canton'">
                                    Cantone
                                </xsl:when>
                                <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'state'">
                                    Stato
                                </xsl:when>
                                <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'region'">
                                    Regione
                                </xsl:when>
                            </xsl:choose>
                            <strong>
                                <xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement" />
                            </strong>
                        </xsl:element>
                        <br />
                        <xsl:element name="span">
                            <xsl:attribute name="class">country</xsl:attribute>
                            <xsl:element name="img">
                                <xsl:attribute name="class">icon</xsl:attribute>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('', //tei:place[concat('#', @xml:id) = current()/@ref]/tei:country/@key, 'CH.png')" />
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="concat('Bandiera ', //tei:place[concat('#', @xml:id) = current()/@ref]/tei:country)" />
                                </xsl:attribute>
                            </xsl:element>
                            <strong><xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:country" /></strong>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Traduzione -->
    
    <xsl:template match="//tei:div[@type='translation']">
        <xsl:for-each select="current()/tei:ab">
            <xsl:element name="p">
                <xsl:attribute name="class">trslText</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('tr_', substring(@corresp, 2))" />
                </xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
