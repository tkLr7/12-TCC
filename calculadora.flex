/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }
"/"       { return new Symbol(sym.DIVI); }
"%"       { return new Symbol(sym.RESTO); }
"^"       { return new Symbol(sym.POTEN); }
"("       { return new Symbol(sym.APARENT); }
")"       { return new Symbol(sym.FPARENT); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\n Caractere inválido: " + yytext() +
                               "\n Linha: " + yyline +
                               "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }