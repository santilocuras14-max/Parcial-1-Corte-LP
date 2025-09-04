%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[ \t\r\n]+          ;
"cbrt"              { return CBRT; }
"sqrt"              { return SQRT; }
[0-9]+(\.[0-9]+)?   { yylval.dval = atof(yytext); return NUMBER; }
"("                 { return '('; }
")"                 { return ')'; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }
.                   { return yytext[0]; }
%%

int yywrap(void){ return 1; }
