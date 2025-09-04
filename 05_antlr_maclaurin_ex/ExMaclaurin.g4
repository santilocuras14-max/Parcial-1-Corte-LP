grammar ExMaclaurin;

// Entrada del tipo: maclaurin(n=10, x=1.5);
prog  : 'maclaurin' '(' 'n' '=' INT ',' 'x' '=' NUMBER ')' ';' EOF ;

INT    : [0-9]+ ;
NUMBER : [0-9]+ ('.' [0-9]+)? ;
WS     : [ \t\r\n]+ -> skip ;
