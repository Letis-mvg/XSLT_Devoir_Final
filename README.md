# Édition Numérique Interactive : "Le Vin du Solitaire" (Baudelaire)

Ce projet a été réalisé dans le cadre de l'évaluation finale du cours **XSLT** du Master TNAH (École nationale des chartes), année 2025-2026.

## Objectif du Projet
L'objectif de ce projet est de proposer une chaîne de publication web complète à partir d'un fichier source encodé en **XML-TEI**. Il s'agit de transformer une donnée structurée "inerte" en un dispositif de lecture dynamique et intelligent :
1.  **Une interface Web (HTML/CSS)** composée de plusieurs pages interconnectées.
2.  **Une automatisation de l'analyse** (statistiques et repérage des rimes) via le moteur XSLT.

## Structure du Dépôt
* `TEI_Source1.xml` : Le document source contenant le poème de Baudelaire encodé.
* `transformation.xsl` : La feuille de style XSLT (le "cerveau" qui génère les pages).
* `style.css` : Le fichier de styles pour l'habillage visuel (ambiance "Fleurs du Mal").
* `html/` : Dossier contenant les fichiers HTML résultants :
    * `home.html` : Page d'accueil et présentation.
    * `page1.html` : Lecture du poème avec enrichissement visuel.
    * `index.html` : Analyses statistiques et indexation des entités.

## Maîtrise Technique (XSLT & XPath)
La feuille de style respecte scrupuleusement les exigences du barème :

### 1. XPath et Fonctions
Quatre fonctions XPath ont été utilisées pour traiter la donnée :
* `upper-case()` : Normalisation automatique des titres.
* `count()` : Calcul du nombre de vers et de strophes sans intervention manuelle.
* `string-length()` : Mesure de la longueur des vers pour l'analyse métrique.
* `normalize-space()` : Nettoyage des espaces blancs lors de l'extraction des textes.

### 2. Prédicats et Filtres
Utilisation de prédicats pour cibler précisément l'information :
* `[@type='poem']` : Extraction ciblée du bloc poétique.
* `[@rhyme='A']` : Identification automatique des rimes pour un traitement CSS différencié.

### 3. Logique XSL
* **Variables** : Stockage des métadonnées et des structures HTML répétitives (header/navbar).
* **Boucles (`xsl:for-each`)** : Parcours itératif des strophes (`lg`) et des vers (`l`).
* **Conditions (`xsl:if`)** : Déclenchement de styles spécifiques selon la nature du vers ou la rime détectée.

## Sortie HTML & Design (CSS)
Le mini-site web propose une navigation fluide entre trois pôles :
* **Accueil** : Présentation contextuelle (source Gallica, éditeur Poulet-Malassis).
* **Lecture** : Affichage élégant avec un habillage "Dark Mode" littéraire (texte ambré sur fond sombre).
* **Analyse** : Page dédiée aux statistiques textuelles et à l'affichage des entités nommées (personnages comme Adeline).
