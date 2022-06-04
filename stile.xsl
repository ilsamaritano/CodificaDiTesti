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
                        
                        
                    </div>
                </div>
                <article id="p10">
                </article>
                <article id="p11">
                </article>
                
                <footer>
                    <xsl:apply-templates select="//tei:titleStmt" />
                    <div>
                        <xsl:apply-templates select="//tei:editionStmt" />
                    </div>
                    <div>
                        <xsl:apply-templates select="//tei:publicationStmt" />
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>