%{
/*Inclure ce fichier qui sera généré par bison*/
      #include "y.tab.h"
%}

%option noyywrap

entier ("+"|"-")?[0-9]+
reel   ("+"|"-")?[0-9]+","[0-9]+
id     [a-zA-Z][a-zA-Z0-9_]*

%%
"debut" return DEBUT;
"fin" return FIN;
":=" return AF;
"*" return MUL;
"/" return DIV;
{entier} return ENTIER;
{reel} return REEL;
{id} return ID;
"/"(.|"\n")+"*/" /*Ignorer les commentaires*/
[ \t\n]
.  printf("Erreur lexicale");
%%
