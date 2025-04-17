/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_BISON_TAB_H_INCLUDED
# define YY_YY_BISON_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    tok_print = 258,               /* tok_print  */
    tok_identifier = 259,          /* tok_identifier  */
    tok_number_literal = 260,      /* tok_number_literal  */
    tok_string_literal = 261,      /* tok_string_literal  */
    tok_assignment_operator_l = 262, /* tok_assignment_operator_l  */
    tok_assignment_operator_r = 263, /* tok_assignment_operator_r  */
    tok_mult = 264,                /* tok_mult  */
    tok_div = 265,                 /* tok_div  */
    tok_mod = 266,                 /* tok_mod  */
    tok_plus = 267,                /* tok_plus  */
    tok_minus = 268,               /* tok_minus  */
    tok_yes = 269,                 /* tok_yes  */
    tok_no = 270,                  /* tok_no  */
    tok_gt = 271,                  /* tok_gt  */
    tok_gt_o_eq = 272,             /* tok_gt_o_eq  */
    tok_lt = 273,                  /* tok_lt  */
    tok_lt_o_eq = 274,             /* tok_lt_o_eq  */
    tok_eq = 275,                  /* tok_eq  */
    tok_if_else = 276,             /* tok_if_else  */
    tok_end = 277,                 /* tok_end  */
    tok_begin = 278,               /* tok_begin  */
    tok_while_loop = 279           /* tok_while_loop  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 22 "bison.y"

	char *identifier;
	char *string_literal;
	double double_literal;

#line 94 "bison.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_BISON_TAB_H_INCLUDED  */
