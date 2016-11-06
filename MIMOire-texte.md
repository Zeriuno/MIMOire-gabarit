\pdfbookmark[0]{Couverture}{label:Couverture}
\begin{titlepage}
  \noindent
  \begin{tabular}{@{}p{\textwidth}@{}}
    \vspace{0.2cm}
    \begin{center}
    \Huge{\textbf{
      Titre du MIMOire% insert your title here
    }}
    \end{center}
    \begin{center}
      \Large{
        Prénom Nom% insert your subtitle here
      }
    \end{center}
    \vspace{0.2cm}\\
  \end{tabular}
  \vspace{4 cm}
  \begin{center}
    {\large
      Mémoire
    }\\
    \vspace{0.2cm}
    {\Large
      Master MIMO
    }
  \end{center}
  \vfill
  \begin{center}
  Université Paris 1\\
  Panthéon - Sorbonne
  \end{center}
\end{titlepage}
\clearpage

\newpage\null\thispagestyle{empty}\newpage
\tableofcontents
\clearpage
\newpage\null\thispagestyle{empty}\newpage

## Introduction

## Historique des versions

1.0 Première version (Daniele Pitrolo)
1.1 Ajout du fichier des règles `Règles_memoire_Mimo.odt` (idem)
1.2 Modification du script `md2tex2pdf.sh` (idem)

## Technique

Ceci est un gabarit de MIMOire rédigé en mélangeant deux notations: Markdown et \LaTeX . La deuxième est l'outil typographique plus puissant dans le monde numérique, la première est utile pour écrire sans trop se prendre la tête avec les commandes \LaTeX . Si jamais Markdown est insuffisant pour faire ce que l'on veut, on peut toujours retomber sur les commandes \LaTeX (ou `XeLaTeX`, car le script de conversion fait recours à cette variente).

Quand on a tout fini, on fait convertir le fichier par pandoc: le processus est totalement automatisé, la mise en page est gérée par \LaTeX (i.e. impeccable sans prise de tête).

### Remarque

Tout ce qui est écrit a été testé, mais il reste **nécessaire** de bien contrôler le résultat de la conversion avant de remettre le MIMOire au correcteurs.


### Conversion

La conversion de ce fichier est faire par le script `bash` `md2tex2pdf.sh`. Voici son contenu:

```bash
#! /usr/bin/env bash

filename="$@"
basename="${filename%.*}"
pandoc "$@" -f markdown -t latex --latex-engine=xelatex  -s -o "$basename".pdf
```

Les lignes 3 et 4 traitent le nom du fichier donné en entrée et enlèvent l'extension, la conversion est faite dans la dernière ligne.

On utilise le script en ouvrant le terminal, en se plaçant dans le dossier contenant **aussi bien** le fichier avec le texte **que** le script et on appelle le script en lui disant *quel fichier* convertir:

```
./md2tex2pdf.sh MIMOire-texte.md
```

Le résultat est un fichier avec le même nom que celui d'entrée (sans extension) en version pdf: dans ce cas, donc, `MIMOire-texte.pdf`.

#### Dépendances

Il est trop douloureux de découvrir à la dernière minute qu'on ne sait pas faire marcher le script de conversion. Afin d'éviter ceci ce gabarit **doit** être distribué **sans** version pdf.\newline

**Avant** de l'adopter pour rédiger son MIMOire, chacun veuillen bien vérifier qu'il arrive à faire marcher le script.

Pour que le script de conversion fonctionne il est indispensable d'avoir installé sur le poste ces logiciels:

* latex (*remarque*: attention, ça prend beaucoup de place, de l'ordre d'un Go et des miettes.)
* xelatex
* pandoc

Pour les installer se tourner vers les gestionnaires de paquets de son système d'exploitation:

* pour les GNU/Linux `apt-get` (debian et dérivés), `snap` (Ubuntu), `yum` (Fedora), `pacman` (Arch)…
* homebrew pour macOS (voir [le site](http://brew.sh/))


## Syntaxe

Ceci est un paragraphe. Il se termine par deux retours à la ligne.

Pour faire un retour à la ligne simple, c'est comme ceci.\newline
Ceci est un espace insécable avant les deux points\thinspace: et dans les guillements «\thinspace comme ceci\thinspace».

Voici une liste à puces:

* Un
* Deux
* Trois

Et une liste ordonnée:

1. Un
2. Deux
3. Trois

Ceci est en **gras**.\newline
Ceci est en *italique*.\newline

Pour citer du code on peut faire ainsi `code` ou, pour des blocs:

```c
#include <stdio.h>
int main()
{
    printf("This is not a Quine") ;
    return 0                      ;
}
```

Pour faire parties et sous-parties on met des `#` à côté du titre. Ce sont ces titres qui sont récupérés automatiquement pour faire le sommaire.

Ceci est une citation\thinspace:

> Texte cité [Source, 1984].

Ou bien on peut le faire avec du code LaTeX:

\begin{quote}
Citation
\end{quote}

\LaTeX permet de mettre parfaitement en page toute notation mathématique. Exemples

* indice: X\textsubscript{2}
* exposant 

Ceci est une interruption de page.\newpage

Si la section se termine sur une page droite et que l'on veut commencer la section suivante sur une page droite également, on peut utiliser ce code\thinspace:
```
\newpage %ici on termine la page actuelle et l'on passe à la suivante
\newpage\null\thispagestyle{empty}\newpage %la page suivante, blanche, sans numérotation.
```

### Sous-partie de l'introduction
\newpage
## Première partie
\newpage
### Première sous-partie
\newpage
### Deuxième sous-partie
\newpage
## Deuxième partie
\newpage
### Première sous-partie
\newpage
### Deuxième sous-partie
\newpage
## Conclusion
\newpage
## Bibliographie

*Petite typologie pour la bibliographie.*

[Abbate, 2000] Jane Abbate, *Inventing the Internet*, MIT Press, 2000.\newline

Pandoc a du mal à convertir `*et alii*,`, du coup on adopte ici la notation \LaTeX\ pour avoir l'italique:

[Caragiannis \emph{et alii}, 2013] Ioannis Caragiannis \emph{et alii}, *Euro-Par 2012: Parallel Processing Workshops*, Springer, 2013.\newline

Pour rendre le lien cliquable dans le PDF du MIMOire, on adopte la syntaxe Markdown: `[texte](adresse internet)`:

[Morozov, 2014] Evgeny Morozov, *Our Naive "Innovation" Fetish*, [https://web.archive.org/web/20160310094927/https://newrepublic.com/article/116939/innovation-fetish-naive-buzzword-unites-parties-avoids-policy-choice](https://web.archive.org/web/20160310094927/https://newrepublic.com/article/116939/innovation-fetish-naive-buzzword-unites-parties-avoids-policy-choice).\newline