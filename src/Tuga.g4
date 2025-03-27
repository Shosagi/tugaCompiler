grammar Tuga;

prog   : stat+ EOF;

stat   : 'escreve' expr SEMICOLON NEWLINE;

expr   : '(' expr ')'                   # Parens
       | op=('-'|'nao') expr               # Uminus
       | expr op=('*'|'/'|'%') expr     # MulDivMod
       | expr op=('+'|'-') expr         # AddSub
       | expr (LE|GR|LEQ|GTE) expr      # Comparators
       | expr (EQUALS|DIFF) expr        # Equals
       | expr AND expr                  # And
       | expr OR expr                   # Or
       | INT                            # Int
       | REAL                           # Real
       | STRING                         # String
       | BOOLEAN                        # Boolean
       | expr POW expr                  # Power
       ;

INT      : DIGIT+ ;
REAL     : INT+ '.' INT+? ;
STRING   : '"'  ~["]* '"'  ;
NEWLINE  : '\r'? '\n' ;
WS       : [ \t\r\n]+ -> skip ;
SL_COMMENT : '//' .*? (EOF|'\n') -> skip;
ML_COMMENT : '/*' .*? '*/' -> skip ;
SEMICOLON : ';' ;
BOOLEAN : 'verdadeiro'|'falso' ;
AND : 'e' ;
OR  : 'ou' ;
LE : '<' ;
GR : '>' ;
LEQ : '<=' ;
GTE : '>=' ;
EQUALS : 'igual' ;
DIFF : 'diferente' ;
POW : '^' ;

fragment
DIGIT    : [0-9] ;
LETTER   : [a-zA-Z] ;
