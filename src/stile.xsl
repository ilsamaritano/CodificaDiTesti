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
                <script src="del.js"></script>
                <script src="mark.js"></script>
                <script src="reg.js"></script>
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
                    <h2>doc. <xsl:value-of select="//tei:idno" /></h2>
                    <h1 class="fr"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                    <h2 class="it"><xsl:value-of select="//tei:title[@xml:lang='it']" /></h2>
                    <h2>Autore: <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" /></h2>
                </div>
                
                <div>
                    <div id="info">
                        <article>
                            <h2>Caratteristiche</h2>
                            <div>
                                <xsl:apply-templates select="//tei:msContents" />
                            </div>
                            <div>
                                <div>
                                    <xsl:apply-templates select="//tei:physDesc" />
                                </div>
                                <div>
                                    <h3>Storia editoriale</h3>
                                    <xsl:value-of select="//tei:history" />
                                </div>
                            </div>
                        </article>
                        
                        <div id="fenomeni">
                            <h3>Visualizza fenomeni notevoli</h3>
                            <div id="bottoni">
                                <button type="button" id="del">Cancellazioni</button>
                                <button type="button" id="reg">Correzioni</button>
                                <button type="button" id="gap">Gap</button>
                                <button type="button" id="mark">Terminologia</button>
                                <button type="button" id="mark">Esempi linguistici</button>
                            </div>
                        </div>
                    </div>
                </div>
                <article id="p10">
                    <h2> Pagina 10 </h2>
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
                    <div>
                        <button type="button" id="ruotapag10"> Mostra retro </button>
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
                        <label>
                            <term xml:id="EdL" xml:lang="fr">Étude des langues</term>
                            <term ref="#EdL" xml:lang="it">Studio delle lingue</term>
                        </label>
                        <item>
                            <gloss target="#EdL" xml:lang="it" source="https://it.wikipedia.org/wiki/Linguistica_storica">
                                Lo <hi rend="bold">studio delle lingue</hi>, o <hi rend="bold">glottologia</hi>, si occupa dello studio storico delle lingue e delle loro famiglie e
                                gruppi di appartenenza, delle origini etimologiche delle parole, considerando i loro rapporti e sviluppi
                                in diacronia.
                            </gloss>
                        </item>
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
        <p><b>Traduzione di: </b> <i><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[@xml:id='EF']"></xsl:value-of></i></p>
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
    
    <!-- Template msContents -->
    <xsl:template match="tei:msContents">
        <b>Titolo:</b><xsl:value-of select="//tei:msItem/tei:title" />
        <br />
        <b>Autore: </b><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" />
        <br />
        <b>Lingua: </b><xsl:value-of select="//tei:language" />
        <br />
        <b>Acquisizione:</b><xsl:value-of select="//tei:settingDesc/tei:setting/tei:name" />
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
        <add><xsl:apply-templates /></add>
    </xsl:template>
    
    <!-- Forma originale -->
    <xsl:template match="tei:orig">
        <orig><xsl:apply-templates /></orig>
    </xsl:template>
    
    <!-- Forma corretta (reg) -->
    <xsl:template match="tei:reg">
        <reg><xsl:apply-templates /></reg>
    </xsl:template>
    
    <!-- Esempio linguistico -->
    <xsl:template match="tei:mentioned">
        <mentioned>
        <xsl:apply-templates />
        </mentioned>
    </xsl:template>


     <!-- Esempio linguistico sottolineato 
    <xsl:template match="tei:mentioned[@rend = 'underline]">
        <mentioned>
        <u><xsl:apply-templates /></u>
        </mentioned>
    </xsl:template>  -->

    
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
            <b><xsl:value-of select="@n" /></b>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:term | tei:persName | tei:placeName">
        
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
            
            <!-- Descrizione dei termini -->
            
            <xsl:element name="span">
                <xsl:choose>
                    <xsl:when test="name() = 'term'">
                        <xsl:attribute name="class">tooltipTermine</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('desc_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
                    </xsl:when>
                    
                    <xsl:when test="name() = 'persName'">
                        <xsl:attribute name="class">tooltipPersona</xsl:attribute>
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
                        </xsl:element>
                        
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
                        </xsl:element>
                        
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
                        <xsl:attribute name="class">tooltipLuogo</xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('plD_', substring(current()/@ref, 2))" />
                        </xsl:attribute>
                        <xsl:element name="span">
                            <xsl:attribute name="class">settlement</xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'state'">
                                    Stato
                                </xsl:when>
                                <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'region'">
                                    Regione
                                </xsl:when>
                            </xsl:choose>
                            <b>
                                <xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement" />
                            </b>
                        </xsl:element>
                        
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
                            <b><xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:country" /></b>
                        </xsl:element>
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
    
    
    
    
    
</xsl:stylesheet>
