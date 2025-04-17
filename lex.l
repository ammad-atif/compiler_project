%{
#include<iostream>
#include"bison.tab.h"
using namespace std;

//#define debug_lex_output

#ifdef debug_lex_output
    #define lex_output(token) (cout << "\n" << yylineno << ": Token=<" << token << ", lexeme>=<" << yytext << ">\n")
#else
    #define lex_output(token)
#endif
%}

%option yylineno
%option noyywrap

%%

"print"  {lex_output("tok_print"); return tok_print;}

"begin"  {lex_output("tok_begin"); return tok_begin;}

"end"   {lex_output("tok_end"); return tok_end;}

"@loop" {lex_output("tok_while_loop"); return tok_while_loop;}

"@?"  {lex_output("tok_if_else"); return tok_if_else;}

"yes"    {lex_output("tok_yes"); return tok_yes;}

"no"     {lex_output("tok_no"); return tok_no;}

"gt"     {lex_output("tok_gt"); return tok_gt;}

"gt_o_eq"  {lex_output("tok_gt_o_eq"); return tok_gt_o_eq;}

"lt"     {lex_output("tok_lt"); return tok_lt;}

"lt_o_eq"  {lex_output("tok_lt_o_eq"); return tok_lt_o_eq;}

"eq"     {lex_output("tok_eq"); return tok_eq;}


"mult"   {lex_output("tok_mult"); return tok_mult;}

"div"    {lex_output("tok_div"); return tok_div;}

"mod"    {lex_output("tok_mod"); return tok_mod;}

"plus"   {lex_output("tok_plus"); return tok_plus;}

"minus"  {lex_output("tok_minus"); return tok_minus;}

"<-"     {lex_output("tok_assignment_operator"); return tok_assignment_operator_l;}

"->"     {lex_output("tok_assignment_operator"); return tok_assignment_operator_r;}

[a-zA-Z][a-zA-Z0-9_]* {yylval.identifier=strdup(yytext);lex_output("tok_identifier"); return tok_identifier; }

[^a-zA-Z \t\n\r][a-zA-Z][a-zA-Z0-9_]* {
    cerr << "Lexical Error at line " << yylineno << ": Invalid identifier " << yytext << "\n";
    exit(EXIT_FAILURE); // Exits on invalid identifier
}

[0-9]+(\.[0-9]+)?     {yylval.double_literal=atof(yytext);lex_output("tok_number_literal"); return tok_number_literal;}

\"[^"]*\"             {yylval.string_literal=strdup(yytext);lex_output("tok_string_literal"); return tok_string_literal;}

[ \t\n\r]+    { /* ignore whitespace */ ;}

.                 { cerr << "\nLexical Error at line " << yylineno << ": Invalid character '" << yytext << "'\n"; exit(1); }

%%

/*
int main(int argc, char** argv) {
    if (argc > 1) {
        FILE* fp = fopen(argv[1], "r");
        if (!fp) {
            cerr << "Error: Cannot open file " << argv[1] << endl;
            return 1;
        }
        yyin = fp;
    } else {
        yyin = stdin;
    }

    int token = yylex();

    while (token) {
        token = yylex();
    }

    return 0;
}
*/
