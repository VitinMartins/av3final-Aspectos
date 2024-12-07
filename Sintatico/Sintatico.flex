%%

%unicode
%public
%standalone

// Definição de expressões regulares
Keyword = (if|else|while|return)
Identificador = [a-zA-Z_][a-zA-Z0-9_]*
NumeroInteiro = [0-9]+
NumeroFloat = [0-9]*"."[0-9]+
Operador = (\+|\-|\*|\/|\=\=|\!\=|\<|\>|\+\+|\-\-|\=\=)
Delimitador = (\;|\{|\}|\(|\)|\,|\.)
ComentarioLinha = "//[^\n]*"
ComentarioBloco = "/\\*([^\*]|(\*+[^\/]))*\\*+/"


%%

// Regras de ação
{Keyword} {
    return new Symbol(sym.valueOf(yytext()));
}

{Identificador} {
    return new Symbol(sym.IDENTIFICADOR, yytext());
}

{NumeroInteiro} {
    return new Symbol(sym.NUMERO_INTEIRO, Integer.parseInt(yytext()));
}

{NumeroFloat} {
    return new Symbol(sym.NUMERO_FLUTUANTE, Double.parseDouble(yytext()));
}

{Operador} {
    switch (yytext()) {
        case "+": return new Symbol(sym.MAIS);
        case "-": return new Symbol(sym.MENOS);
        case "*": return new Symbol(sym.VEZES);
        case "/": return new Symbol(sym.DIVIDIR);
        case "==": return new Symbol(sym.IGUAL_IGUAL);
        case "!=": return new Symbol(sym.DIFERENTE);
        case "<": return new Symbol(sym.MENOR);
        case ">": return new Symbol(sym.MAIOR);
        case "++": return new Symbol(sym.INCREMENTO);
        case "--": return new Symbol(sym.DECREMENTO);
        default: System.err.println("Operador não reconhecido: " + yytext()); return null;
    }
}

{Delimitador} {
    switch (yytext()) {
        case ";": return new Symbol(sym.SEMI);
        case "{": return new Symbol(sym.LBRACE);
        case "}": return new Symbol(sym.RBRACE);
        case "(": return new Symbol(sym.LPAREN);
        case ")": return new Symbol(sym.RPAREN);
        case ",": return new Symbol(sym.VIRGULA);
        case ".": return new Symbol(sym.PONTO);
        default: return null;
    }
}

{ComentarioLinha} {
    // Ignora o comentário de linha
}

{ComentarioBloco} {
    // Ignora o comentário de bloco
}

[^] { /* Ignora qualquer outro caractere */ }
