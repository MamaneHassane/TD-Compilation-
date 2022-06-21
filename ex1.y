%{
	#include<stdio.h>
	int flag=0;
	void yyerror(char *s);
	int yylex();

%}

%token DEBUT FIN AF ID ENTIER REEL

%%
S: DEBUT ListOper FIN ;
ListOper: Oper ListOper| Oper; 
Oper: ID AF nb| ID MUL nb |ID DIV nb {printf("Operation \n");}
nb: ENTIER | REEL
%%

void main(){
printf("Enter affectation expression \n");

yyparse();
if(flag==0)
printf("Entered expression is valid \n");

}
void yyerror(char *s){printf("ERROR :%s\n",s);
flag =1;}
