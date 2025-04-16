%{
    #include <iostream>
    #include <string>
    #include <cstdio>
    using namespace std;
    extern int yyparse();
    extern int yylex();
    extern FILE* yyin;

    void yyerror(const char* err);

    #define DEBUGBISON
    // Debug macro
    #ifdef DEBUGBISON
        #define debugBison(a) (cout << "\n" << a << "\n")
    #else
        #define debugBison(a)
    #endif
%}

%union {
	char *identifier;
	char *string_literal;
	double double_literal;
}

%token tok_print
%token <identifier> tok_identifier
%token <double_literal> tok_number_literal
%token <string_literal> tok_string_literal
%token tok_assignment_operator_l
%token tok_assignment_operator_r
%token tok_mult
%token tok_div
%token tok_mod
%token tok_plus
%token tok_minus
%token tok_yes;
%token tok_no;
%token tok_gt;
%token tok_gt_o_eq;
%token tok_lt;
%token tok_lt_o_eq;
%token tok_eq;

%left tok_plus tok_minus
%left tok_mult tok_div tok_mod 


%start root

%%
root: /* empty */				{debugBison(1);}  	
    | print root                     {debugBison(2);}
    | assignment root                     {debugBison(3);}
    ;

print: tok_print  tok_identifier             {debugBison(4);}
    ;

assignment: tok_identifier tok_assignment_operator_l  expression   {debugBison(5);}
            |tok_identifier tok_assignment_operator_l  tok_string_literal   {debugBison(6);}
            |expression   tok_assignment_operator_r  tok_identifier    {debugBison(7);}
            |tok_string_literal   tok_assignment_operator_r  tok_identifier    {debugBison(8);}
    ;


expression:
            term {debugBison(9);}
            |expression tok_plus expression {debugBison(10);}
            |expression tok_minus expression {debugBison(11);}
            |expression tok_mult expression {debugBison(12);}
            |expression tok_div expression  {debugBison(13);}
            |expression tok_mod expression  {debugBison(14);}
;

term:   tok_number_literal   {debugBison(15);}
    |tok_identifier      {debugBison(16);}
    ;

%%

void yyerror(const char* err) {
    cerr << "\n" << err << endl;
}

int main(int argc, char** argv) {
    if (argc > 1) {
        FILE* fp = fopen(argv[1], "r");
        yyin = fp; // read from file when its name is provided.
    } 
    if (yyin == NULL) { 
        yyin = stdin; // otherwise read from terminal
    }
    
    // yyparse will call internally yylex
    // It will get a token and insert it into AST
    int parserResult = yyparse();
    
    return EXIT_SUCCESS;
}
