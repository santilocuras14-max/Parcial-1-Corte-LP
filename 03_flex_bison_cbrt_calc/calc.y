%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s){
    fprintf(stderr, "Error de sintaxis: %s\n", s);
}
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token CBRT SQRT
%type  <dval> expr

%left '+' '-'
%left '*' '/'
%right UMINUS

%%
input:
    /* vacío */
  | input expr '\n'              { printf("= %.10g\n", $2); }
  ;

expr:
    NUMBER                       { $$ = $1; }
  | expr '+' expr                { $$ = $1 + $3; }
  | expr '-' expr                { $$ = $1 - $3; }
  | expr '*' expr                { $$ = $1 * $3; }
  | expr '/' expr                { $$ = $1 / $3; }
  | '(' expr ')'                 { $$ = $2; }
  | '-' expr %prec UMINUS        { $$ = -$2; }
  | SQRT '(' expr ')'            { $$ = sqrt($3); }
  | CBRT '(' expr ')'            { $$ = cbrt($3); }
  ;
%%

int main(int argc, char** argv){
    if (argc == 2){
        FILE* f = fopen(argv[1], "r");
        if(!f){ perror("No se pudo abrir el archivo"); return 1; }
        extern FILE* yyin;
        yyin = f;
        yyparse();
        fclose(f);
    } else {
        // modo interactivo: leer hasta EOF
        yyparse();
    }
    return 0;
}
