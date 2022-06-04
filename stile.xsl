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
                        
                        <div class="gyeah">
                            <h3 id="about">Riferimenti</h3>
                            <xsl:apply-templates select="//tei:editionStmt"/>
                            <p>Traduzione di: <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[@xml:id='EF']"></xsl:value-of></p>
                        </div>
                        
                        
                    </div>
                </div>
                <article id="p10">
                </article>
                <article id="p11">
                </article>
                <!-- <script type="text/javascript">some script here</script>-->
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
    
</xsl:stylesheet>
