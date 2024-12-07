%%

%unicode
%public
%standalone

// Definição de expressões regulares
Keyword = (if|else|while|return)
Identificador = [a-zA-Z]+
NumeroInteiro = [0-9]+
NumeroFloat = [0-9]*"."[0-9]+
Operador = (\+|\-|\*|\/|\=\=|\!\=|\<|\>|\+\+|\-\-|\=\=)
Delimitador = (\;|\{|\}|\(|\)|\,|\.)
ComentarioLinha = "//[^\n]*"
ComentarioBloco = "/\\*([^\*]|(\*+[^\/]))*\\*+/"


%%

// Regras de ação
{Keyword} {
    System.out.println("> Encontrei uma keyword: " + yytext());
}

{Identificador} {
    System.out.println("> Encontrei um identificador: " + yytext());
}

{NumeroInteiro} {
    System.out.println("> Encontrei um número inteiro: " + yytext());
}

{NumeroFloat} {
    System.out.println("> Encontrei um número flutuante: " + yytext());
}

{Operador} {
    System.out.println("> Encontrei um operador: " + yytext());
}

{Delimitador} {
    System.out.println("> Encontrei um delimitador: " + yytext());
}

{ComentarioLinha} {
    // Ignora o comentário de linha
}

{ComentarioBloco} {
    // Ignora o comentário de bloco
}

[^] { /* Ignora qualquer outro caractere */ }