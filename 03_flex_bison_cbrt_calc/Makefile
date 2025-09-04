# Makefile para calculadora con Flex/Bison (raíz cúbica cbrt)
CC = gcc
LEX = flex
YACC = bison
CFLAGS = -O2 -Wall -lm

all: calc

calc: lex.yy.c y.tab.c
	$(CC) -O2 -Wall y.tab.c lex.yy.c -o calc -lm

y.tab.c: calc.y
	$(YACC) -d calc.y

lex.yy.c: calc.l
	$(LEX) calc.l

clean:
	rm -f calc y.tab.c y.tab.h lex.yy.c
