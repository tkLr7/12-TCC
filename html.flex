/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%class MeuScanner
%cup
%unicode
%line
%column

// Macros:

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

"<"             { return new Symbol(sym.ABRE); }
">"             { return new Symbol(sym.FECHA); }
"</"            { return new Symbol(sym.FECHA_ABRE); }
"/>"            { return new Symbol(sym.AUTO_FECHA); }
"="             { return new Symbol(sym.IGUAL); }
[a-zA-Z0-9]+    { return new Symbol(sym.ID, yytext()); }
\"[^\"]*\"      { return new Symbol(sym.STRING, yytext().substring(1, yytext().length() - 1)); }
[^<>]+          { return new Symbol(sym.TEXTO, yytext().trim()); }
[ \t\r\n]+      { /* Ignora */ }
.               { System.err.println("Caractere inválido no HTML: " + yytext()); }
