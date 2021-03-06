/*
* Name: Tingjun Li
* Email: li400@purdue.edu
*/

%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *);
%}

Separator	[\(\)]
Delimiter	[\=\>\<\+\-\*\/\|]

%%
{Separator}	{return yytext[0];}

{Delimiter}	{return yytext[0];}

"or"		{return OR;}

"and"		{return AND;}

"not"		{return NOT;}

"line"		{return LINE;}

"=="		{return OP_EQ;}

">="		{return OP_GE;}

"<="		{return OP_LE;}

"!="		{return OP_NE;}

[0-9]+ 		{
		    yylval.iValue = atoi(yytext);
		    return INTEGER_LITERAL;
		}
		
[a-z]		{
		    return CHAR_LITERAL;
		}

\n               {};       /* ignore end of line */

[ \t]+           ;      /* ignore whitespace */

.  		{return SYNERROR;}

%%

int yywrap(void) {
    return 1;
}