<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <!-- Définition du format de sortie : HTML -->
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    
    <!-- Template principal -->
    <xsl:template match="/">
        
        <!-- Génère une page pour le premier document, page d'acceuil et la page d'index-->
        <xsl:call-template name="page_poeme"/>
        <xsl:for-each select="document('TEI_Source3.xml')">
            <xsl:call-template name="page_poeme"/>
        </xsl:for-each>
        <xsl:call-template name="home"/>
        <xsl:call-template name="index"/>
    </xsl:template>
    
    <!-- Template qui génère une page HTML pour un poème -->
    
    <xsl:template name="page_poeme">
        
        <!-- Récupération du titre, l'auteur -->
        <xsl:variable name="titre" select="//tei:titleStmt/tei:title[1]"/>
        <xsl:variable name="auteur" select="normalize-space(//tei:sourceDesc//tei:author[1])"/>
        <xsl:variable name="file_id">
            <xsl:choose> 
                <xsl:when test="contains(lower-case($auteur), 'hugo')">hugo</xsl:when>
                <xsl:otherwise>baudelaire</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- Création du fichier HTML avec les navigations qui vont avec -->
        
        <xsl:result-document href="html/{$file_id}.html">
            <html lang="fr">
                <head>
                    <meta charset="UTF-8"/>
                    <title><xsl:value-of select="concat($auteur, ' - ', $titre)"/></title>
                    <link rel="stylesheet" href="../style.css"/>
                </head>
                <body class="page-lecture">
                    <nav>
                        <a href="home.html">Accueil</a>
                        <a href="index.html">Index des entités</a>
                    </nav>
                    
                    <div class="split-screen">
                        <div class="text-side">
                            <header>
                                <h1><xsl:value-of select="upper-case($titre)"/></h1>
                                <p class="auteur-label">Par <xsl:value-of select="$auteur"/></p>
                                
                                <!-- Analyse des rimes -->
                                <div class="metadata-critique">
                                    <p><strong>Structure des rimes : </strong>
                                        <xsl:for-each select="//tei:l[@rhyme]">
                                            <span class="rime-inline"><xsl:value-of select="@rhyme"/></span>
                                            <xsl:if test="position() mod 4 = 0"> | </xsl:if>
                                        </xsl:for-each>
                                    </p>
                                </div>
                            </header>
                            
                            <!-- Contenu du poème -->
                            <div class="poeme-container">
                                <xsl:for-each select="//tei:lg"> 
                                    <div class="strophe">
                                        <xsl:for-each select="tei:l">
                                            <p class="vers">
                                                
                                                <!-- Numéro du vers -->
                                                <span class="num-vers"><xsl:value-of select="@n"/></span>
                                                <xsl:apply-templates/>  <!-- Texte du vers -->
                                                
                                                <!-- Récupère la rime si elle existe , puis l'affiche -->
                                                <xsl:if test="@rhyme"> 
                                                    <span class="rime-note">
                                                        <xsl:attribute name="title">Rime en <xsl:value-of select="@rhyme"/></xsl:attribute>
                                                        [<xsl:value-of select="@rhyme"/>]
                                                    </span>
                                                </xsl:if>
                                            </p>
                                        </xsl:for-each>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                        
                        <!-- Partie des images en fonction des auteurs -->
                        <div class="image-side">
                            <xsl:choose>
                                <xsl:when test="contains($file_id, 'hugo')">
                                    <img src="../Source3.jpeg" alt="Manuscrit Hugo"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <img src="../Source1.jpeg" alt="Source Baudelaire"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <p class="legende">Document source</p>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Mise en forme des noms de personnes -->
    <xsl:template match="tei:persName">
        <span class="highlight-pers">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Mise en forme des notes -->
    <xsl:template match="tei:note">
        <span class="note-critique" title="{.}">
            <sup>[note]</sup>
        </span>
    </xsl:template>
    
    <!-- Page d’accueil -->
    <xsl:template name="home">
        <xsl:result-document href="html/home.html">
            <html lang="fr">
                <head><link rel="stylesheet" href="../style.css"/></head>
                <body class="home-page">
                    <nav><a href="index.html">Index des noms</a></nav>
                    <header class="home-hero">
                        <h1>Anthologie : Charles Baudelaire &amp; Victor Hugo</h1>
                    </header>
                    
                    <!-- Cartes auteurs -->
                    <div class="auteurs">
                        <div class="card">
                            <img src="../Baudelaire.jpg" alt="Baudelaire"/>
                            <h3>Charles Baudelaire</h3>
                            <a href="baudelaire.html">Voir le poème</a>
                        </div>
                        <div class="card">
                            <img src="../Victore_Hugo.jpeg" alt="Hugo"/>
                            <h3>Victor Hugo</h3>
                            <a href="hugo.html">Voir le poème</a>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Page index des noms -->
    <xsl:template name="index">
        <xsl:result-document href="html/index.html">
            <html lang="fr">
                <head><link rel="stylesheet" href="../style.css"/></head>
                <body class="index-page">
                    <nav><a href="home.html">Retour Accueil</a></nav>
                    <main class="index-content">
                        <h1>Index des Noms Cités</h1>
                        <ul>
                            <!-- Liste tous les noms de personnes des deux documents -->
                            <xsl:for-each select="//tei:body//tei:persName | document('TEI_Source3.xml')//tei:body//tei:persName">
                                <li class="highlight-pers"><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </main>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>