# Édition Numérique Interactive :  Baudelaire et Hugo

Ce projet a été réalisé dans le cadre de l'évaluation finale du cours **XSLT** du Master TNAH (École nationale des chartes), année 2025-2026.

## Objectif du Projet
L'objectif de ce projet est de proposer une chaîne de publication web complète à partir d'un fichier source encodé en **XML-TEI**. Il s'agit de transformer une donnée structurée "inerte" en un dispositif de lecture dynamique et intelligent :
1.  **Une interface Web (HTML/CSS)** composée de plusieurs pages interconnectées.
2.  **Une automatisation de l'analyse** (statistiques et repérage des rimes) via le moteur XSLT.
 Le projet permet non seulement de lire les textes, mais aussi de les analyser techniquement (versification, rimes, entités nommées).


---

## Fonctionnalités Techniques
Le projet utilise des fonctions avancées pour offrir une expérience critique :
* **Mise en regard (Split-Screen)** : Confrontation directe entre le texte encodé et le captures de poèmes.
* **Analyse Automatique** : Calcul du schéma des rimes et numérotation des vers via XSLT.
* **Indexation des Entités** : Extraction et surlignage dynamique des noms de personnes (`<persName>`) à travers plusieurs fichiers sources.
* **Notes Critiques** : Affichage d'informations complémentaires au survol du texte.

---

## Organisation des Fichiers

Le projet est structuré de manière à séparer strictement les données, la logique de traitement et la mise en forme :

### 1. Racines et Logique 
* `transformation_html.xsl` : Le script principal qui génère l'intégralité du site web.
* `style.css` : La feuille de style.
* `tei_source1.xml` (Charles Baudelaire) & `tei_source3.xml` (Victor Hugo) : Les fichiers XML_TEI utilisé pour un autre cours.

### 2. Dossier `/source_images` 
* Regroupe les portraits des auteurs.
* Contient les images des poèmes (`Source1.jpeg`, `Source3.jpeg`).

### 3. Dossier `/html` (Documents de sortie)
C'est ici que sont générés les fichiers finaux consultables dans un navigateur :
* `home.html` : Portail d'accueil de l'anthologie.
* `baudelaire.html` : Édition enrichie du poème de Baudelaire.
* `hugo.html` : Édition enrichie du poème de Hugo.
* `index.html` : Index global centralisant toutes les personnes citées dans les deux poèmes.


