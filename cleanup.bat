@echo off
if exist parser.java del parser.java
if exist sym.java del sym.java
if exist scanner.java del scanner.java
if exist Yylex.java del Yylex.java
if exist Yylex.class del Yylex.class
if exist LexicoCup.java del LexicoCup.java
for /r %%f in (*.class) do del "%%f"