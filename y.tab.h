/* A Bison parser, made by GNU Bison 3.2.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    Tprogram = 258,
    Tvar = 259,
    Tbegin = 260,
    Tend = 261,
    Tpoint = 262,
    Tplus = 263,
    Tminus = 264,
    Tmultiply = 265,
    Tdivide = 266,
    Tleft = 267,
    Tright = 268,
    Tcolon = 269,
    Tsemicolon = 270,
    Tassignment = 271,
    Tcomma = 272,
    Tinteger = 273,
    Tread = 274,
    Twrite = 275,
    Tfor = 276,
    Tdo = 277,
    Tto = 278,
    Terror = 279,
    Tid = 280,
    Tintvalue = 281
  };
#endif
/* Tokens.  */
#define Tprogram 258
#define Tvar 259
#define Tbegin 260
#define Tend 261
#define Tpoint 262
#define Tplus 263
#define Tminus 264
#define Tmultiply 265
#define Tdivide 266
#define Tleft 267
#define Tright 268
#define Tcolon 269
#define Tsemicolon 270
#define Tassignment 271
#define Tcomma 272
#define Tinteger 273
#define Tread 274
#define Twrite 275
#define Tfor 276
#define Tdo 277
#define Tto 278
#define Terror 279
#define Tid 280
#define Tintvalue 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 125 "tema2.y" /* yacc.c:1906  */
int val; char* sir;

#line 112 "y.tab.h" /* yacc.c:1906  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
