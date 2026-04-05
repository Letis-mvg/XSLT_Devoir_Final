# L'édition numérique et critique : "Le vin du solitaire" (Baudelaire)

Ce projet a été réalosé dans le cadre de l'évaluation finale du cours **XSLT** du Master TNAH (Ecole nationale des Chartes), année 2025-2026. 

## Objectif du Projet
L'objectif de ce projet est de proposer une chaîne de publication complète à partir d'un fichier source encodé en *XML-TEI*. Il s'agit de transformer une donnée structurée "inerte" en un dispositif de lecture multi-support :
1.  *Une interface Web (HTML/CSS)* composée de plusieurs pages interconnectées pour une lecture interactive.


## Structure du Dépôt
* TEI_Source1.xml : Le document source contenant le poème encodé.
* transformation.xsl : La feuille de style XSLT (le "cerveau" du projet).
* style.css : Le fichier de styles pour l'habillage des pages HTML.
* html/ : Dossier contenant les fichiers HTML résultants (home.html, page1.html, index.html).
* edition.tex : Le fichier LaTeX généré prêt pour la compilation PDF.

## 🛠 Maîtrise Technique (XSLT & XPath)
La feuille de style respecte les exigences techniques suivantes :

### 1. XPath et Fonctions
Quatre fonctions XPath ont été utilisées pour l'extraction et le traitement des données :
* upper-case() : Pour normaliser les titres en majuscules.
* count() : Pour générer des statistiques automatiques (nombre de vers/strophes).
* string-length() : Pour analyser la longueur des segments textuels.
* normalize-space() : Pour le nettoyage des chaînes de caractères.

### 2. Prédicats et Filtres
Utilisation de prédicats pour cibler précisément l'information :
* [@type='poem'] : Pour isoler le corps du texte poétique.
* [@rhyme='A'] : Pour appliquer un traitement différencié aux rimes spécifiques.

### 3. Logique XSL
* *Variables* : Utilisation de variables pour stocker les métadonnées (titre, éditeur) et les blocs HTML répétitifs (header, footer).
* *Boucles (xsl:for-each)* : Pour parcourir les strophes (lg) et les vers (l).
* *Conditions (xsl:if)* : Pour déclencher l'habillage CSS spécifique sur certaines rimes ou longueurs de vers.

## Sortie HTML & Design (CSS)
Le mini-site web propose une navigation fluide entre trois pôles :
* *Accueil* : Présentation du projet et des sources (Gallica).
* *Lecture* : Affichage du poème avec un habillage CSS typographique soigné (style "parchemin" et polices classiques).
* *Analyse* : Statistiques textuelles et index des entités nommées (personnages).
