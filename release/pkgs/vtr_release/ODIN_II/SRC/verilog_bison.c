/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.7"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
#line 1 "SRC/verilog_bison.y"

/*
Copyright (c) 2009 Peter Andrew Jamieson (jamieson.peter@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/ 
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "types.h"
#include "parse_making_ast.h"
 
#define PARSE {printf("here\n");}

#ifndef YYLINENO
int yylineno;
#define YYLINENO yylineno
#else
extern int yylineno;
#endif

void yyerror(const char *str);
int yywrap();
int yyparse();
int yylex(void);

 // RESPONCE in an error
void yyerror(const char *str)
{
	fprintf(stderr,"error in parsing: %s - on line number %d\n",str, yylineno);
	exit(-1);
}
 
// point of continued file reading
int yywrap()
{
	return 1;
}


/* Line 371 of yacc.c  */
#line 128 "SRC/verilog_bison.c"

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "verilog_bison.h".  */
#ifndef YY_YY_SRC_VERILOG_BISON_H_INCLUDED
# define YY_YY_SRC_VERILOG_BISON_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     vSYMBOL_ID = 258,
     vNUMBER_ID = 259,
     vDELAY_ID = 260,
     vALWAYS = 261,
     vAND = 262,
     vASSIGN = 263,
     vBEGIN = 264,
     vCASE = 265,
     vDEFAULT = 266,
     vDEFINE = 267,
     vELSE = 268,
     vEND = 269,
     vENDCASE = 270,
     vENDMODULE = 271,
     vIF = 272,
     vINOUT = 273,
     vINPUT = 274,
     vMODULE = 275,
     vNAND = 276,
     vNEGEDGE = 277,
     vNOR = 278,
     vNOT = 279,
     vOR = 280,
     vFOR = 281,
     vOUTPUT = 282,
     vPARAMETER = 283,
     vPOSEDGE = 284,
     vREG = 285,
     vWIRE = 286,
     vXNOR = 287,
     vXOR = 288,
     vDEFPARAM = 289,
     voANDAND = 290,
     voOROR = 291,
     voLTE = 292,
     voGTE = 293,
     voSLEFT = 294,
     voSRIGHT = 295,
     voEQUAL = 296,
     voNOTEQUAL = 297,
     voCASEEQUAL = 298,
     voCASENOTEQUAL = 299,
     voXNOR = 300,
     voNAND = 301,
     voNOR = 302,
     vWHILE = 303,
     vINTEGER = 304,
     vNOT_SUPPORT = 305,
     UOR = 306,
     UAND = 307,
     UNOT = 308,
     UNAND = 309,
     UNOR = 310,
     UXNOR = 311,
     UXOR = 312,
     ULNOT = 313,
     UADD = 314,
     UMINUS = 315,
     LOWER_THAN_ELSE = 316
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 387 of yacc.c  */
#line 61 "SRC/verilog_bison.y"

	char *id_name;
	char *num_value;
	ast_node_t *node;


/* Line 387 of yacc.c  */
#line 239 "SRC/verilog_bison.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_SRC_VERILOG_BISON_H_INCLUDED  */

/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 267 "SRC/verilog_bison.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(N) (N)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1534

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  88
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  38
/* YYNRULES -- Number of rules.  */
#define YYNRULES  136
/* YYNRULES -- Number of states.  */
#define YYNSTATES  334

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   316

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    70,     2,    86,     2,    62,    55,     2,
      63,    64,    60,    58,    83,    59,    84,    61,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    52,    82,
      56,    85,    57,    51,    87,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    67,     2,    68,    54,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    65,    53,    66,    69,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    11,    13,    15,    19,    28,
      38,    46,    49,    51,    53,    55,    57,    59,    61,    63,
      65,    67,    69,    71,    75,    79,    83,    87,    91,    95,
      99,   103,   107,   111,   113,   115,   122,   134,   143,   147,
     151,   155,   159,   163,   167,   171,   175,   179,   188,   196,
     203,   209,   212,   218,   228,   233,   242,   246,   248,   254,
     256,   260,   262,   268,   270,   274,   276,   279,   282,   288,
     296,   303,   313,   319,   321,   325,   330,   334,   339,   342,
     344,   348,   352,   356,   359,   361,   366,   371,   375,   377,
     379,   382,   385,   387,   390,   393,   396,   399,   402,   405,
     408,   411,   414,   417,   421,   425,   429,   433,   437,   441,
     445,   449,   453,   457,   461,   465,   469,   473,   477,   481,
     485,   489,   493,   497,   501,   505,   509,   515,   519,   526,
     533,   535,   537,   542,   549,   553,   557
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      89,     0,    -1,    90,    -1,    90,    92,    -1,    90,    91,
      -1,    92,    -1,    91,    -1,    12,     3,     4,    -1,    20,
       3,    63,   101,    64,    82,    93,    16,    -1,    20,     3,
      63,   101,    83,    64,    82,    93,    16,    -1,    20,     3,
      63,    64,    82,    93,    16,    -1,    93,    94,    -1,    94,
      -1,    95,    -1,    97,    -1,    98,    -1,    99,    -1,   100,
      -1,   103,    -1,   104,    -1,   106,    -1,   112,    -1,    96,
      -1,    28,   101,    82,    -1,    34,   101,    82,    -1,    19,
     101,    82,    -1,    27,   101,    82,    -1,    18,   101,    82,
      -1,    31,   101,    82,    -1,    30,   101,    82,    -1,    49,
     101,    82,    -1,   101,    83,   102,    -1,   101,    84,   102,
      -1,   102,    -1,     3,    -1,    67,   123,    52,   123,    68,
       3,    -1,    67,   123,    52,   123,    68,     3,    67,   123,
      52,   123,    68,    -1,    67,   123,    52,   123,    68,     3,
      85,   124,    -1,     3,    85,   124,    -1,     8,   114,    82,
      -1,     7,   105,    82,    -1,    21,   105,    82,    -1,    23,
     105,    82,    -1,    24,   105,    82,    -1,    25,   105,    82,
      -1,    32,   105,    82,    -1,    33,   105,    82,    -1,     3,
      63,   123,    83,   123,    83,   123,    64,    -1,    63,   123,
      83,   123,    83,   123,    64,    -1,     3,    63,   123,    83,
     123,    64,    -1,    63,   123,    83,   123,    64,    -1,     3,
     107,    -1,     3,    63,   108,    64,    82,    -1,    86,    63,
     110,    64,     3,    63,   108,    64,    82,    -1,     3,    63,
      64,    82,    -1,    86,    63,   110,    64,     3,    63,    64,
      82,    -1,   108,    83,   109,    -1,   109,    -1,    84,     3,
      63,   123,    64,    -1,   123,    -1,   110,    83,   111,    -1,
     111,    -1,    84,     3,    63,   123,    64,    -1,   123,    -1,
       6,   120,   113,    -1,   118,    -1,   114,    82,    -1,   115,
      82,    -1,    17,    63,   123,    64,   113,    -1,    17,    63,
     123,    64,   113,    13,   113,    -1,    10,    63,   123,    64,
     116,    15,    -1,    26,    63,   114,    82,   123,    82,   114,
      64,   113,    -1,    48,    63,   123,    64,   113,    -1,    82,
      -1,   124,    85,   123,    -1,   124,    85,     5,   123,    -1,
     124,    37,   123,    -1,   124,    37,     5,   123,    -1,   116,
     117,    -1,   117,    -1,   123,    52,   113,    -1,    11,    52,
     113,    -1,     9,   119,    14,    -1,   119,   113,    -1,   113,
      -1,    87,    63,   121,    64,    -1,    87,    63,    60,    64,
      -1,   121,    25,   122,    -1,   122,    -1,   124,    -1,    29,
       3,    -1,    22,     3,    -1,   124,    -1,    58,   123,    -1,
      59,   123,    -1,    69,   123,    -1,    55,   123,    -1,    53,
     123,    -1,    46,   123,    -1,    47,   123,    -1,    45,   123,
      -1,    70,   123,    -1,    54,   123,    -1,   123,    54,   123,
      -1,   123,    60,   123,    -1,   123,    61,   123,    -1,   123,
      62,   123,    -1,   123,    58,   123,    -1,   123,    59,   123,
      -1,   123,    55,   123,    -1,   123,    53,   123,    -1,   123,
      46,   123,    -1,   123,    47,   123,    -1,   123,    45,   123,
      -1,   123,    56,   123,    -1,   123,    57,   123,    -1,   123,
      40,   123,    -1,   123,    39,   123,    -1,   123,    41,   123,
      -1,   123,    42,   123,    -1,   123,    37,   123,    -1,   123,
      38,   123,    -1,   123,    43,   123,    -1,   123,    44,   123,
      -1,   123,    36,   123,    -1,   123,    35,   123,    -1,   123,
      51,   123,    52,   123,    -1,    63,   123,    64,    -1,    65,
     123,    65,   123,    66,    66,    -1,    65,   123,    65,   125,
      66,    66,    -1,     4,    -1,     3,    -1,     3,    67,   123,
      68,    -1,     3,    67,   123,    52,   123,    68,    -1,    65,
     125,    66,    -1,   125,    83,   123,    -1,   123,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   119,   119,   122,   132,   133,   134,   137,   140,   141,
     142,   145,   146,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   162,   165,   169,   172,   175,   178,   179,
     180,   183,   184,   185,   188,   189,   190,   191,   192,   195,
     199,   200,   201,   202,   203,   204,   205,   208,   209,   210,
     211,   215,   218,   219,   220,   221,   224,   225,   228,   229,
     232,   233,   236,   237,   241,   244,   245,   246,   247,   248,
     249,   250,   251,   252,   255,   256,   259,   260,   263,   264,
     267,   268,   271,   274,   275,   278,   279,   283,   284,   287,
     288,   289,   292,   293,   294,   295,   296,   297,   298,   299,
     300,   301,   302,   303,   304,   305,   306,   307,   308,   309,
     310,   311,   312,   313,   314,   315,   316,   317,   318,   319,
     320,   321,   322,   323,   324,   325,   326,   327,   331,   332,
     335,   336,   337,   338,   339,   342,   343
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "vSYMBOL_ID", "vNUMBER_ID", "vDELAY_ID",
  "vALWAYS", "vAND", "vASSIGN", "vBEGIN", "vCASE", "vDEFAULT", "vDEFINE",
  "vELSE", "vEND", "vENDCASE", "vENDMODULE", "vIF", "vINOUT", "vINPUT",
  "vMODULE", "vNAND", "vNEGEDGE", "vNOR", "vNOT", "vOR", "vFOR", "vOUTPUT",
  "vPARAMETER", "vPOSEDGE", "vREG", "vWIRE", "vXNOR", "vXOR", "vDEFPARAM",
  "voANDAND", "voOROR", "voLTE", "voGTE", "voSLEFT", "voSRIGHT", "voEQUAL",
  "voNOTEQUAL", "voCASEEQUAL", "voCASENOTEQUAL", "voXNOR", "voNAND",
  "voNOR", "vWHILE", "vINTEGER", "vNOT_SUPPORT", "'?'", "':'", "'|'",
  "'^'", "'&'", "'<'", "'>'", "'+'", "'-'", "'*'", "'/'", "'%'", "'('",
  "')'", "'{'", "'}'", "'['", "']'", "'~'", "'!'", "UOR", "UAND", "UNOT",
  "UNAND", "UNOR", "UXNOR", "UXOR", "ULNOT", "UADD", "UMINUS",
  "LOWER_THAN_ELSE", "';'", "','", "'.'", "'='", "'#'", "'@'", "$accept",
  "source_text", "items", "define", "module", "list_of_module_items",
  "module_item", "parameter_declaration", "defparam_declaration",
  "input_declaration", "output_declaration", "inout_declaration",
  "net_declaration", "variable_list", "variable", "continuous_assign",
  "gate_declaration", "gate_instance", "module_instantiation",
  "module_instance", "list_of_module_connections", "module_connection",
  "list_of_module_parameters", "module_parameter", "always", "statement",
  "blocking_assignment", "non_blocking_assignment", "case_item_list",
  "case_items", "seq_block", "stmt_list", "delay_control",
  "event_expression_list", "event_expression", "expression", "primary",
  "expression_list", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,    63,    58,   124,    94,    38,    60,    62,    43,    45,
      42,    47,    37,    40,    41,   123,   125,    91,    93,   126,
      33,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,    59,    44,    46,    61,    35,    64
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    88,    89,    90,    90,    90,    90,    91,    92,    92,
      92,    93,    93,    94,    94,    94,    94,    94,    94,    94,
      94,    94,    94,    95,    96,    97,    98,    99,   100,   100,
     100,   101,   101,   101,   102,   102,   102,   102,   102,   103,
     104,   104,   104,   104,   104,   104,   104,   105,   105,   105,
     105,   106,   107,   107,   107,   107,   108,   108,   109,   109,
     110,   110,   111,   111,   112,   113,   113,   113,   113,   113,
     113,   113,   113,   113,   114,   114,   115,   115,   116,   116,
     117,   117,   118,   119,   119,   120,   120,   121,   121,   122,
     122,   122,   123,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123,   123,
     124,   124,   124,   124,   124,   125,   125
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     2,     1,     1,     3,     8,     9,
       7,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     1,     1,     6,    11,     8,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     8,     7,     6,
       5,     2,     5,     9,     4,     8,     3,     1,     5,     1,
       3,     1,     5,     1,     3,     1,     2,     2,     5,     7,
       6,     9,     5,     1,     3,     4,     3,     4,     2,     1,
       3,     3,     3,     2,     1,     4,     4,     3,     1,     1,
       2,     2,     1,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     5,     3,     6,     6,
       1,     1,     4,     6,     3,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     2,     6,     5,     0,     0,     1,
       4,     3,     7,     0,    34,     0,     0,     0,    33,     0,
       0,   131,   130,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    92,     0,     0,     0,
       0,    38,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,    22,    14,    15,    16,    17,    18,    19,
      20,    21,     0,   100,    98,    99,    97,   102,    96,    93,
      94,     0,   136,     0,    95,   101,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    31,    32,   136,     0,     0,    51,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      10,    11,     0,   127,     0,   134,     0,   125,   124,   120,
     121,   117,   116,   118,   119,   122,   123,   113,   111,   112,
       0,     0,   110,   103,   109,   114,   115,   107,   108,   104,
     105,   106,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    73,    64,     0,     0,    65,     0,     0,     0,
      40,    39,     0,    27,     0,    25,    41,    42,    43,    44,
      26,    23,    29,    28,    45,    46,    24,    30,     0,   132,
     136,     0,   135,     0,     0,     8,     0,     0,     0,     0,
      57,    59,     0,     0,    61,    63,     0,     0,     0,     0,
      88,    89,    84,     0,     0,     0,     0,     0,    66,    67,
       0,     0,     0,     0,    74,     0,     0,     0,   126,    35,
       9,    54,     0,     0,     0,     0,     0,     0,    91,    90,
      86,     0,    85,    82,    83,     0,     0,     0,     0,     0,
      76,     0,     0,    75,   133,   128,   129,     0,     0,     0,
      52,    56,     0,     0,    60,    87,     0,     0,     0,     0,
      77,     0,    50,     0,     0,    37,     0,     0,     0,     0,
       0,    79,     0,    68,     0,    72,    49,     0,     0,     0,
      58,    62,     0,     0,     0,    70,    78,     0,     0,     0,
       0,    48,     0,    55,     0,    81,    80,    69,     0,    47,
      36,    53,     0,    71
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     4,     5,     6,    60,    61,    62,    63,    64,
      65,    66,    67,    17,    18,    68,    69,   123,    70,   118,
     219,   220,   223,   224,    71,   183,   184,   185,   300,   301,
     186,   233,   120,   229,   230,   221,    36,    83
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -177
static const yytype_int16 yypact[] =
{
      11,    21,    30,    35,    11,  -177,  -177,    46,   -24,  -177,
    -177,  -177,  -177,     4,   -30,   -29,   462,   -39,  -177,    37,
     778,    -9,  -177,   462,   462,   462,   462,   462,   462,   462,
     462,   462,   462,   462,   462,  1218,  -177,   -15,     5,    31,
     462,  -177,    19,   -17,    40,    37,    31,    31,    40,    40,
      40,    40,    31,    31,    31,    31,    40,    40,    31,    31,
     682,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,
    -177,  -177,   462,  -177,  -177,  -177,  -177,  -177,  -177,  -177,
    -177,   978,   947,   -37,  -177,  -177,   462,   462,   462,   462,
     462,   462,   462,   462,   462,   462,   462,   462,   462,   462,
     462,   462,   462,   462,   462,   462,   462,   462,   462,   462,
     462,   778,    24,  -177,  -177,  1330,    45,    47,  -177,    49,
     202,    51,   462,    33,    50,    38,   -22,   -18,    52,    55,
      57,    62,    67,   114,   157,   169,    63,    72,   195,   199,
    -177,  -177,   779,  -177,   462,  -177,   462,  1384,  1358,   108,
     108,   187,   187,  1472,  1472,  1472,  1472,  1436,  1446,  1436,
    1246,   813,  1410,  1436,  1446,   108,   108,   230,   230,  -177,
    -177,  -177,   714,   778,   118,   285,   124,   202,    92,    96,
     115,   117,  -177,  -177,   103,   104,  -177,    15,   462,   560,
    -177,  -177,   377,  -177,    31,  -177,  -177,  -177,  -177,  -177,
    -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,   462,  -177,
     915,    41,  1330,   462,   189,  -177,   746,   112,   196,   -36,
    -177,  1330,   198,   -34,  -177,  1330,   200,   201,   143,   -16,
    -177,  -177,  -177,   126,   462,   462,    37,   462,  -177,  -177,
     405,   591,   462,   462,  1330,   847,   144,   147,  1330,   -31,
    -177,  -177,   127,   133,   320,   146,   213,   285,  -177,  -177,
    -177,    34,  -177,  -177,  -177,  1008,  1038,   136,  1068,   462,
    1330,   462,   498,  1330,  -177,  -177,  -177,   462,    37,   462,
    -177,  -177,   462,   160,  -177,  -177,   434,   202,   462,   202,
    1330,   529,  -177,   462,  1274,  -177,  1098,  1128,   257,   168,
     348,  -177,  1302,   222,   622,  -177,  -177,   462,  1158,   462,
    -177,  -177,   154,   -32,   202,  -177,  -177,   202,   202,    37,
    1188,  -177,   881,  -177,   161,  -177,  -177,  -177,   190,  -177,
    -177,  -177,   202,  -177
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -177,  -177,  -177,   251,   253,   -69,   -56,  -177,  -177,  -177,
    -177,  -177,  -177,   179,   -33,  -177,  -177,    69,  -177,  -177,
     -35,     8,  -177,    14,  -177,  -176,   -43,  -177,  -177,   -28,
    -177,  -177,  -177,  -177,    13,   -13,   -19,   121
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint16 yytable[] =
{
      41,   232,   124,    35,   141,   113,   114,    14,    14,   261,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      84,    85,   116,     1,     7,    37,   125,   115,   253,   145,
     256,     2,   324,     8,    14,     9,   277,    21,    22,    13,
      21,    22,   172,   121,    38,    39,   146,   254,   262,   257,
      12,   254,   240,    20,   278,    19,   226,   264,    72,   142,
     193,   194,    39,   227,   195,   194,    39,   111,    15,   112,
     119,    16,    16,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,    16,    40,
     192,   187,    40,   122,   216,   117,   173,   247,   174,   189,
     175,   303,   176,   305,   188,   190,   141,   128,   129,   130,
     131,    21,    22,   192,   146,   136,   137,    21,    22,    21,
      22,   210,   191,   212,   196,   177,   178,   197,   325,   198,
     263,   326,   327,   179,   199,   204,   226,    90,    91,   200,
     194,    39,   180,   227,   205,   234,   333,   231,   187,   235,
     141,   113,   225,    23,    24,    25,   106,   107,   108,   109,
     110,    26,    27,    28,   181,   241,    29,    30,   236,   244,
     237,    31,   217,    32,   228,   238,   239,    33,    34,    40,
     279,    40,   249,   267,   251,   245,   201,   194,    39,   252,
     248,   255,   218,   258,   259,    21,    22,   260,   182,   282,
     275,   177,   178,   276,   187,   280,   283,   125,   288,   179,
     314,   265,   266,   298,   268,   126,   127,   270,   180,   272,
     273,   132,   133,   134,   135,   318,   323,   138,   139,   202,
     194,    39,   231,   331,   225,   106,   107,   108,   109,   110,
     181,   203,   194,    39,   332,    10,   290,    11,   291,   295,
      21,    22,   281,   313,   294,   211,   296,    40,   187,   297,
     187,   284,   316,   302,   285,   304,   328,   206,   194,    39,
     308,   207,   194,    39,   182,     0,     0,   302,    21,    22,
     108,   109,   110,     0,   320,   187,   322,     0,   187,   187,
     125,     0,    23,    24,    25,     0,     0,     0,     0,     0,
      26,    27,    28,   187,     0,    29,    30,     0,     0,     0,
      31,   312,    32,    21,    22,     0,    33,    34,     0,     0,
      23,    24,    25,     0,     0,     0,     0,     0,    26,    27,
      28,   218,     0,    29,    30,     0,     0,     0,    31,     0,
      32,    21,    22,     0,    33,    34,     0,     0,     0,   299,
       0,     0,     0,   315,     0,    23,    24,    25,     0,   222,
       0,     0,     0,    26,    27,    28,     0,     0,    29,    30,
      21,    22,   243,    31,     0,    32,     0,     0,     0,    33,
      34,     0,     0,    23,    24,    25,     0,     0,     0,     0,
       0,    26,    27,    28,   218,     0,    29,    30,    21,    22,
     269,    31,     0,    32,     0,     0,     0,    33,    34,     0,
       0,     0,    23,    24,    25,     0,     0,     0,     0,     0,
      26,    27,    28,     0,     0,    29,    30,    21,    22,     0,
      31,     0,    32,     0,     0,   299,    33,    34,     0,     0,
      23,    24,    25,     0,     0,     0,     0,     0,    26,    27,
      28,     0,     0,    29,    30,    21,    22,     0,    31,     0,
      32,     0,     0,     0,    33,    34,     0,     0,     0,    23,
      24,    25,     0,     0,     0,     0,     0,    26,    27,    28,
       0,     0,    29,    30,     0,     0,     0,    31,     0,    32,
       0,     0,     0,    33,    34,     0,     0,    23,    24,    25,
       0,     0,     0,     0,     0,    26,    27,    28,     0,     0,
      29,    30,     0,     0,     0,    31,     0,    32,     0,     0,
       0,    33,    34,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   292,     0,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,     0,     0,     0,
      99,   293,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,     0,   306,     0,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     0,     0,
       0,    99,   307,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,     0,     0,     0,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,     0,
       0,     0,    99,   242,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,     0,     0,     0,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
       0,     0,     0,    99,   271,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,    42,     0,     0,    43,    44,
      45,     0,     0,     0,     0,     0,     0,     0,   140,     0,
      46,    47,     0,    48,   319,    49,    50,    51,     0,    52,
      53,     0,    54,    55,    56,    57,    58,    42,     0,     0,
      43,    44,    45,     0,     0,     0,     0,     0,     0,     0,
     215,    59,    46,    47,     0,    48,     0,    49,    50,    51,
       0,    52,    53,     0,    54,    55,    56,    57,    58,    42,
       0,     0,    43,    44,    45,     0,     0,     0,     0,     0,
       0,     0,   250,    59,    46,    47,     0,    48,     0,    49,
      50,    51,     0,    52,    53,     0,    54,    55,    56,    57,
      58,    42,     0,     0,    43,    44,    45,     0,     0,     0,
       0,     0,     0,     0,     0,    59,    46,    47,     0,    48,
       0,    49,    50,    51,     0,    52,    53,     0,    54,    55,
      56,    57,    58,     0,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    59,     0,     0,
      99,   208,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,     0,     0,     0,     0,     0,   209,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,     0,     0,     0,    99,     0,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,     0,     0,     0,     0,
       0,   214,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,     0,     0,     0,    99,     0,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
       0,     0,     0,     0,     0,   274,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,     0,
       0,     0,    99,     0,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,     0,     0,     0,     0,     0,   330,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,     0,     0,     0,    99,     0,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,     0,     0,
       0,   246,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,     0,     0,     0,    99,     0,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
       0,     0,   144,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   143,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   286,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   287,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   289,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   310,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   311,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   321,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,     0,   329,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,     0,     0,     0,    99,   213,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,     0,     0,     0,    99,   309,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
       0,     0,     0,    99,   317,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     0,     0,
       0,    99,     0,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,    86,     0,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     0,     0,     0,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,     0,     0,     0,     0,     0,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     0,     0,
       0,     0,     0,     0,   102,   103,   104,   105,   106,   107,
     108,   109,   110,    88,    89,    90,    91,    92,    93,    94,
      95,     0,    97,    88,    89,    90,    91,    92,    93,    94,
      95,   103,   104,   105,   106,   107,   108,   109,   110,     0,
       0,     0,   104,   105,   106,   107,   108,   109,   110,    88,
      89,    90,    91,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   104,   105,
     106,   107,   108,   109,   110
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-177)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      19,   177,    45,    16,    60,    38,    39,     3,     3,    25,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,     3,    12,     3,    64,    45,    40,    64,    66,
      64,    20,    64,     3,     3,     0,    67,     3,     4,    63,
       3,     4,   111,     3,    83,    84,    83,    83,    64,    83,
       4,    83,    37,    82,    85,    85,    22,   233,    67,    72,
      82,    83,    84,    29,    82,    83,    84,    82,    64,    64,
      87,    67,    67,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,    67,    65,
      85,   120,    65,    63,   173,    86,    82,    66,    63,   122,
      63,   287,    63,   289,    63,    82,   172,    48,    49,    50,
      51,     3,     4,    85,    83,    56,    57,     3,     4,     3,
       4,   144,    82,   146,    82,     9,    10,    82,   314,    82,
      14,   317,   318,    17,    82,    82,    22,    39,    40,    82,
      83,    84,    26,    29,    82,    63,   332,   176,   177,    63,
     216,   194,   175,    45,    46,    47,    58,    59,    60,    61,
      62,    53,    54,    55,    48,   188,    58,    59,    63,   192,
      63,    63,    64,    65,    60,    82,    82,    69,    70,    65,
      63,    65,     3,   236,    82,   208,    82,    83,    84,     3,
     213,     3,    84,     3,     3,     3,     4,    64,    82,    63,
      66,     9,    10,    66,   233,    82,     3,   236,    82,    17,
      52,   234,   235,    63,   237,    46,    47,   240,    26,   242,
     243,    52,    53,    54,    55,    13,    82,    58,    59,    82,
      83,    84,   261,    82,   257,    58,    59,    60,    61,    62,
      48,    82,    83,    84,    64,     4,   269,     4,   271,   278,
       3,     4,   254,   298,   277,   144,   279,    65,   287,   282,
     289,   257,   300,   286,   261,   288,   319,    82,    83,    84,
     293,    82,    83,    84,    82,    -1,    -1,   300,     3,     4,
      60,    61,    62,    -1,   307,   314,   309,    -1,   317,   318,
     319,    -1,    45,    46,    47,    -1,    -1,    -1,    -1,    -1,
      53,    54,    55,   332,    -1,    58,    59,    -1,    -1,    -1,
      63,    64,    65,     3,     4,    -1,    69,    70,    -1,    -1,
      45,    46,    47,    -1,    -1,    -1,    -1,    -1,    53,    54,
      55,    84,    -1,    58,    59,    -1,    -1,    -1,    63,    -1,
      65,     3,     4,    -1,    69,    70,    -1,    -1,    -1,    11,
      -1,    -1,    -1,    15,    -1,    45,    46,    47,    -1,    84,
      -1,    -1,    -1,    53,    54,    55,    -1,    -1,    58,    59,
       3,     4,     5,    63,    -1,    65,    -1,    -1,    -1,    69,
      70,    -1,    -1,    45,    46,    47,    -1,    -1,    -1,    -1,
      -1,    53,    54,    55,    84,    -1,    58,    59,     3,     4,
       5,    63,    -1,    65,    -1,    -1,    -1,    69,    70,    -1,
      -1,    -1,    45,    46,    47,    -1,    -1,    -1,    -1,    -1,
      53,    54,    55,    -1,    -1,    58,    59,     3,     4,    -1,
      63,    -1,    65,    -1,    -1,    11,    69,    70,    -1,    -1,
      45,    46,    47,    -1,    -1,    -1,    -1,    -1,    53,    54,
      55,    -1,    -1,    58,    59,     3,     4,    -1,    63,    -1,
      65,    -1,    -1,    -1,    69,    70,    -1,    -1,    -1,    45,
      46,    47,    -1,    -1,    -1,    -1,    -1,    53,    54,    55,
      -1,    -1,    58,    59,    -1,    -1,    -1,    63,    -1,    65,
      -1,    -1,    -1,    69,    70,    -1,    -1,    45,    46,    47,
      -1,    -1,    -1,    -1,    -1,    53,    54,    55,    -1,    -1,
      58,    59,    -1,    -1,    -1,    63,    -1,    65,    -1,    -1,
      -1,    69,    70,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    -1,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    -1,    -1,    -1,
      51,    83,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    64,    -1,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    -1,    -1,
      -1,    51,    83,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    -1,
      -1,    -1,    51,    83,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      -1,    -1,    -1,    51,    83,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,     3,    -1,    -1,     6,     7,
       8,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    16,    -1,
      18,    19,    -1,    21,    82,    23,    24,    25,    -1,    27,
      28,    -1,    30,    31,    32,    33,    34,     3,    -1,    -1,
       6,     7,     8,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      16,    49,    18,    19,    -1,    21,    -1,    23,    24,    25,
      -1,    27,    28,    -1,    30,    31,    32,    33,    34,     3,
      -1,    -1,     6,     7,     8,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    16,    49,    18,    19,    -1,    21,    -1,    23,
      24,    25,    -1,    27,    28,    -1,    30,    31,    32,    33,
      34,     3,    -1,    -1,     6,     7,     8,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    49,    18,    19,    -1,    21,
      -1,    23,    24,    25,    -1,    27,    28,    -1,    30,    31,
      32,    33,    34,    -1,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    49,    -1,    -1,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    -1,    -1,    68,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    -1,    -1,    -1,    51,    -1,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    -1,
      -1,    68,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    -1,    -1,    -1,    51,    -1,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    -1,    -1,    68,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    -1,
      -1,    -1,    51,    -1,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    -1,    -1,    68,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    -1,    -1,    -1,    51,    -1,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    -1,    -1,    -1,    51,    -1,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    -1,    -1,    -1,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    -1,    -1,    -1,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      -1,    -1,    -1,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    -1,    -1,
      -1,    51,    -1,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    35,    -1,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    -1,    -1,    -1,    -1,
      -1,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    -1,    -1,    -1,    -1,    -1,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    -1,    -1,
      -1,    -1,    -1,    -1,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    37,    38,    39,    40,    41,    42,    43,
      44,    -1,    46,    37,    38,    39,    40,    41,    42,    43,
      44,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    56,    57,    58,    59,    60,    61,    62,    37,
      38,    39,    40,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    56,    57,
      58,    59,    60,    61,    62
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    12,    20,    89,    90,    91,    92,     3,     3,     0,
      91,    92,     4,    63,     3,    64,    67,   101,   102,    85,
      82,     3,     4,    45,    46,    47,    53,    54,    55,    58,
      59,    63,    65,    69,    70,   123,   124,    64,    83,    84,
      65,   124,     3,     6,     7,     8,    18,    19,    21,    23,
      24,    25,    27,    28,    30,    31,    32,    33,    34,    49,
      93,    94,    95,    96,    97,    98,    99,   100,   103,   104,
     106,   112,    67,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   125,   123,   123,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    82,    64,   102,   102,   123,     3,    86,   107,    87,
     120,     3,    63,   105,   114,   124,   101,   101,   105,   105,
     105,   105,   101,   101,   101,   101,   105,   105,   101,   101,
      16,    94,   123,    64,    65,    66,    83,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123,   123,
     123,   123,    93,    82,    63,    63,    63,     9,    10,    17,
      26,    48,    82,   113,   114,   115,   118,   124,    63,   123,
      82,    82,    85,    82,    83,    82,    82,    82,    82,    82,
      82,    82,    82,    82,    82,    82,    82,    82,    52,    68,
     123,   125,   123,    52,    68,    16,    93,    64,    84,   108,
     109,   123,    84,   110,   111,   123,    22,    29,    60,   121,
     122,   124,   113,   119,    63,    63,    63,    63,    82,    82,
      37,   123,    83,     5,   123,   123,    66,    66,   123,     3,
      16,    82,     3,    64,    83,     3,    64,    83,     3,     3,
      64,    25,    64,    14,   113,   123,   123,   114,   123,     5,
     123,    83,   123,   123,    68,    66,    66,    67,    85,    63,
      82,   109,    63,     3,   111,   122,    64,    64,    82,    64,
     123,   123,    64,    83,   123,   124,   123,   123,    63,    11,
     116,   117,   123,   113,   123,   113,    64,    83,   123,    52,
      64,    64,    64,   108,    52,    15,   117,    52,    13,    82,
     123,    64,   123,    82,    64,   113,   113,   113,   114,    64,
      68,    82,    64,   113
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))

/* Error token number */
#define YYTERROR	1
#define YYERRCODE	256


/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */
#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
        break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
        break;
    }
}




/* The lookahead symbol.  */
int yychar;


#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE(yyval_default);

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
/* Line 1792 of yacc.c  */
#line 119 "SRC/verilog_bison.y"
    {next_parsed_verilog_file((yyvsp[(1) - (1)].node));}
    break;

  case 3:
/* Line 1792 of yacc.c  */
#line 122 "SRC/verilog_bison.y"
    {
											if ((yyvsp[(1) - (2)].node) != NULL)
											{
												(yyval.node) = newList_entry((yyvsp[(1) - (2)].node), (yyvsp[(2) - (2)].node));
											}
											else
											{
												(yyval.node) = newList(FILE_ITEMS, (yyvsp[(2) - (2)].node));
											}
										}
    break;

  case 4:
/* Line 1792 of yacc.c  */
#line 132 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (2)].node);}
    break;

  case 5:
/* Line 1792 of yacc.c  */
#line 133 "SRC/verilog_bison.y"
    {(yyval.node) = newList(FILE_ITEMS, (yyvsp[(1) - (1)].node));}
    break;

  case 6:
/* Line 1792 of yacc.c  */
#line 134 "SRC/verilog_bison.y"
    {(yyval.node) = NULL;}
    break;

  case 7:
/* Line 1792 of yacc.c  */
#line 137 "SRC/verilog_bison.y"
    {(yyval.node) = NULL; newConstant((yyvsp[(2) - (3)].id_name), (yyvsp[(3) - (3)].num_value), yylineno);}
    break;

  case 8:
/* Line 1792 of yacc.c  */
#line 140 "SRC/verilog_bison.y"
    {(yyval.node) = newModule((yyvsp[(2) - (8)].id_name), (yyvsp[(4) - (8)].node), (yyvsp[(7) - (8)].node), yylineno);}
    break;

  case 9:
/* Line 1792 of yacc.c  */
#line 141 "SRC/verilog_bison.y"
    {(yyval.node) = newModule((yyvsp[(2) - (9)].id_name), (yyvsp[(4) - (9)].node), (yyvsp[(8) - (9)].node), yylineno);}
    break;

  case 10:
/* Line 1792 of yacc.c  */
#line 142 "SRC/verilog_bison.y"
    {(yyval.node) = newModule((yyvsp[(2) - (7)].id_name), NULL, (yyvsp[(6) - (7)].node), yylineno);}
    break;

  case 11:
/* Line 1792 of yacc.c  */
#line 145 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (2)].node), (yyvsp[(2) - (2)].node));}
    break;

  case 12:
/* Line 1792 of yacc.c  */
#line 146 "SRC/verilog_bison.y"
    {(yyval.node) = newList(MODULE_ITEMS, (yyvsp[(1) - (1)].node));}
    break;

  case 13:
/* Line 1792 of yacc.c  */
#line 149 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 14:
/* Line 1792 of yacc.c  */
#line 150 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 15:
/* Line 1792 of yacc.c  */
#line 151 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 16:
/* Line 1792 of yacc.c  */
#line 152 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 17:
/* Line 1792 of yacc.c  */
#line 153 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 18:
/* Line 1792 of yacc.c  */
#line 154 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 19:
/* Line 1792 of yacc.c  */
#line 155 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 20:
/* Line 1792 of yacc.c  */
#line 156 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 21:
/* Line 1792 of yacc.c  */
#line 157 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 22:
/* Line 1792 of yacc.c  */
#line 158 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 23:
/* Line 1792 of yacc.c  */
#line 162 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(PARAMETER, (yyvsp[(2) - (3)].node));}
    break;

  case 24:
/* Line 1792 of yacc.c  */
#line 165 "SRC/verilog_bison.y"
    {(yyval.node) = newDefparam(MODULE_PARAMETER_LIST, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 25:
/* Line 1792 of yacc.c  */
#line 169 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(INPUT, (yyvsp[(2) - (3)].node));}
    break;

  case 26:
/* Line 1792 of yacc.c  */
#line 172 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(OUTPUT, (yyvsp[(2) - (3)].node));}
    break;

  case 27:
/* Line 1792 of yacc.c  */
#line 175 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(INOUT, (yyvsp[(2) - (3)].node));}
    break;

  case 28:
/* Line 1792 of yacc.c  */
#line 178 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(WIRE, (yyvsp[(2) - (3)].node));}
    break;

  case 29:
/* Line 1792 of yacc.c  */
#line 179 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(REG, (yyvsp[(2) - (3)].node));}
    break;

  case 30:
/* Line 1792 of yacc.c  */
#line 180 "SRC/verilog_bison.y"
    {(yyval.node) = markAndProcessSymbolListWith(INTEGER, (yyvsp[(2) - (3)].node));}
    break;

  case 31:
/* Line 1792 of yacc.c  */
#line 183 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));}
    break;

  case 32:
/* Line 1792 of yacc.c  */
#line 184 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));}
    break;

  case 33:
/* Line 1792 of yacc.c  */
#line 185 "SRC/verilog_bison.y"
    {(yyval.node) = newList(VAR_DECLARE_LIST, (yyvsp[(1) - (1)].node));}
    break;

  case 34:
/* Line 1792 of yacc.c  */
#line 188 "SRC/verilog_bison.y"
    {(yyval.node) = newVarDeclare((yyvsp[(1) - (1)].id_name), NULL, NULL, NULL, NULL, NULL, yylineno);}
    break;

  case 35:
/* Line 1792 of yacc.c  */
#line 189 "SRC/verilog_bison.y"
    {(yyval.node) = newVarDeclare((yyvsp[(6) - (6)].id_name), (yyvsp[(2) - (6)].node), (yyvsp[(4) - (6)].node), NULL, NULL, NULL, yylineno);}
    break;

  case 36:
/* Line 1792 of yacc.c  */
#line 190 "SRC/verilog_bison.y"
    {(yyval.node) = newVarDeclare((yyvsp[(6) - (11)].id_name), (yyvsp[(2) - (11)].node), (yyvsp[(4) - (11)].node), (yyvsp[(8) - (11)].node), (yyvsp[(10) - (11)].node), NULL, yylineno);}
    break;

  case 37:
/* Line 1792 of yacc.c  */
#line 191 "SRC/verilog_bison.y"
    {(yyval.node) = newVarDeclare((yyvsp[(6) - (8)].id_name), (yyvsp[(2) - (8)].node), (yyvsp[(4) - (8)].node), NULL, NULL, (yyvsp[(8) - (8)].node), yylineno);}
    break;

  case 38:
/* Line 1792 of yacc.c  */
#line 192 "SRC/verilog_bison.y"
    {(yyval.node) = newVarDeclare((yyvsp[(1) - (3)].id_name), NULL, NULL, NULL, NULL, (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 39:
/* Line 1792 of yacc.c  */
#line 195 "SRC/verilog_bison.y"
    {(yyval.node) = newAssign((yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 40:
/* Line 1792 of yacc.c  */
#line 199 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_AND, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 41:
/* Line 1792 of yacc.c  */
#line 200 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_NAND, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 42:
/* Line 1792 of yacc.c  */
#line 201 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_NOR, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 43:
/* Line 1792 of yacc.c  */
#line 202 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_NOT, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 44:
/* Line 1792 of yacc.c  */
#line 203 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_OR, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 45:
/* Line 1792 of yacc.c  */
#line 204 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_XNOR, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 46:
/* Line 1792 of yacc.c  */
#line 205 "SRC/verilog_bison.y"
    {(yyval.node) = newGate(BITWISE_XOR, (yyvsp[(2) - (3)].node), yylineno);}
    break;

  case 47:
/* Line 1792 of yacc.c  */
#line 208 "SRC/verilog_bison.y"
    {(yyval.node) = newGateInstance((yyvsp[(1) - (8)].id_name), (yyvsp[(3) - (8)].node), (yyvsp[(5) - (8)].node), (yyvsp[(7) - (8)].node), yylineno);}
    break;

  case 48:
/* Line 1792 of yacc.c  */
#line 209 "SRC/verilog_bison.y"
    {(yyval.node) = newGateInstance(NULL, (yyvsp[(2) - (7)].node), (yyvsp[(4) - (7)].node), (yyvsp[(6) - (7)].node), yylineno);}
    break;

  case 49:
/* Line 1792 of yacc.c  */
#line 210 "SRC/verilog_bison.y"
    {(yyval.node) = newGateInstance((yyvsp[(1) - (6)].id_name), (yyvsp[(3) - (6)].node), (yyvsp[(5) - (6)].node), NULL, yylineno);}
    break;

  case 50:
/* Line 1792 of yacc.c  */
#line 211 "SRC/verilog_bison.y"
    {(yyval.node) = newGateInstance(NULL, (yyvsp[(2) - (5)].node), (yyvsp[(4) - (5)].node), NULL, yylineno);}
    break;

  case 51:
/* Line 1792 of yacc.c  */
#line 215 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleInstance((yyvsp[(1) - (2)].id_name), (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 52:
/* Line 1792 of yacc.c  */
#line 218 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleNamedInstance((yyvsp[(1) - (5)].id_name), (yyvsp[(3) - (5)].node), NULL, yylineno);}
    break;

  case 53:
/* Line 1792 of yacc.c  */
#line 219 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleNamedInstance((yyvsp[(5) - (9)].id_name), (yyvsp[(7) - (9)].node), (yyvsp[(3) - (9)].node), yylineno); }
    break;

  case 54:
/* Line 1792 of yacc.c  */
#line 220 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleNamedInstance((yyvsp[(1) - (4)].id_name), NULL, NULL, yylineno);}
    break;

  case 55:
/* Line 1792 of yacc.c  */
#line 221 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleNamedInstance((yyvsp[(5) - (8)].id_name), NULL, (yyvsp[(3) - (8)].node), yylineno);}
    break;

  case 56:
/* Line 1792 of yacc.c  */
#line 224 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));}
    break;

  case 57:
/* Line 1792 of yacc.c  */
#line 225 "SRC/verilog_bison.y"
    {(yyval.node) = newList(MODULE_CONNECT_LIST, (yyvsp[(1) - (1)].node));}
    break;

  case 58:
/* Line 1792 of yacc.c  */
#line 228 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleConnection((yyvsp[(2) - (5)].id_name), (yyvsp[(4) - (5)].node), yylineno);}
    break;

  case 59:
/* Line 1792 of yacc.c  */
#line 229 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleConnection(NULL, (yyvsp[(1) - (1)].node), yylineno);}
    break;

  case 60:
/* Line 1792 of yacc.c  */
#line 232 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));}
    break;

  case 61:
/* Line 1792 of yacc.c  */
#line 233 "SRC/verilog_bison.y"
    {(yyval.node) = newList(MODULE_PARAMETER_LIST, (yyvsp[(1) - (1)].node));}
    break;

  case 62:
/* Line 1792 of yacc.c  */
#line 236 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleParameter((yyvsp[(2) - (5)].id_name), (yyvsp[(4) - (5)].node), yylineno);}
    break;

  case 63:
/* Line 1792 of yacc.c  */
#line 237 "SRC/verilog_bison.y"
    {(yyval.node) = newModuleParameter(NULL, (yyvsp[(1) - (1)].node), yylineno);}
    break;

  case 64:
/* Line 1792 of yacc.c  */
#line 241 "SRC/verilog_bison.y"
    {(yyval.node) = newAlways((yyvsp[(2) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 65:
/* Line 1792 of yacc.c  */
#line 244 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 66:
/* Line 1792 of yacc.c  */
#line 245 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (2)].node);}
    break;

  case 67:
/* Line 1792 of yacc.c  */
#line 246 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (2)].node);}
    break;

  case 68:
/* Line 1792 of yacc.c  */
#line 247 "SRC/verilog_bison.y"
    {(yyval.node) = newIf((yyvsp[(3) - (5)].node), (yyvsp[(5) - (5)].node), NULL, yylineno);}
    break;

  case 69:
/* Line 1792 of yacc.c  */
#line 248 "SRC/verilog_bison.y"
    {(yyval.node) = newIf((yyvsp[(3) - (7)].node), (yyvsp[(5) - (7)].node), (yyvsp[(7) - (7)].node), yylineno);}
    break;

  case 70:
/* Line 1792 of yacc.c  */
#line 249 "SRC/verilog_bison.y"
    {(yyval.node) = newCase((yyvsp[(3) - (6)].node), (yyvsp[(5) - (6)].node), yylineno);}
    break;

  case 71:
/* Line 1792 of yacc.c  */
#line 250 "SRC/verilog_bison.y"
    {(yyval.node) = newFor((yyvsp[(3) - (9)].node), (yyvsp[(5) - (9)].node), (yyvsp[(7) - (9)].node), (yyvsp[(9) - (9)].node), yylineno);}
    break;

  case 72:
/* Line 1792 of yacc.c  */
#line 251 "SRC/verilog_bison.y"
    {(yyval.node) = newWhile((yyvsp[(3) - (5)].node), (yyvsp[(5) - (5)].node), yylineno);}
    break;

  case 73:
/* Line 1792 of yacc.c  */
#line 252 "SRC/verilog_bison.y"
    {(yyval.node) = NULL;}
    break;

  case 74:
/* Line 1792 of yacc.c  */
#line 255 "SRC/verilog_bison.y"
    {(yyval.node) = newBlocking((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 75:
/* Line 1792 of yacc.c  */
#line 256 "SRC/verilog_bison.y"
    {(yyval.node) = newBlocking((yyvsp[(1) - (4)].node), (yyvsp[(4) - (4)].node), yylineno);}
    break;

  case 76:
/* Line 1792 of yacc.c  */
#line 259 "SRC/verilog_bison.y"
    {(yyval.node) = newNonBlocking((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 77:
/* Line 1792 of yacc.c  */
#line 260 "SRC/verilog_bison.y"
    {(yyval.node) = newNonBlocking((yyvsp[(1) - (4)].node), (yyvsp[(4) - (4)].node), yylineno);}
    break;

  case 78:
/* Line 1792 of yacc.c  */
#line 263 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (2)].node), (yyvsp[(2) - (2)].node));}
    break;

  case 79:
/* Line 1792 of yacc.c  */
#line 264 "SRC/verilog_bison.y"
    {(yyval.node) = newList(CASE_LIST, (yyvsp[(1) - (1)].node));}
    break;

  case 80:
/* Line 1792 of yacc.c  */
#line 267 "SRC/verilog_bison.y"
    {(yyval.node) = newCaseItem((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 81:
/* Line 1792 of yacc.c  */
#line 268 "SRC/verilog_bison.y"
    {(yyval.node) = newDefaultCase((yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 82:
/* Line 1792 of yacc.c  */
#line 271 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(2) - (3)].node);}
    break;

  case 83:
/* Line 1792 of yacc.c  */
#line 274 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (2)].node), (yyvsp[(2) - (2)].node));}
    break;

  case 84:
/* Line 1792 of yacc.c  */
#line 275 "SRC/verilog_bison.y"
    {(yyval.node) = newList(BLOCK, (yyvsp[(1) - (1)].node));}
    break;

  case 85:
/* Line 1792 of yacc.c  */
#line 278 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(3) - (4)].node);}
    break;

  case 86:
/* Line 1792 of yacc.c  */
#line 279 "SRC/verilog_bison.y"
    {(yyval.node) = NULL;}
    break;

  case 87:
/* Line 1792 of yacc.c  */
#line 283 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));}
    break;

  case 88:
/* Line 1792 of yacc.c  */
#line 284 "SRC/verilog_bison.y"
    {(yyval.node) = newList(DELAY_CONTROL, (yyvsp[(1) - (1)].node));}
    break;

  case 89:
/* Line 1792 of yacc.c  */
#line 287 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 90:
/* Line 1792 of yacc.c  */
#line 288 "SRC/verilog_bison.y"
    {(yyval.node) = newPosedgeSymbol((yyvsp[(2) - (2)].id_name), yylineno);}
    break;

  case 91:
/* Line 1792 of yacc.c  */
#line 289 "SRC/verilog_bison.y"
    {(yyval.node) = newNegedgeSymbol((yyvsp[(2) - (2)].id_name), yylineno);}
    break;

  case 92:
/* Line 1792 of yacc.c  */
#line 292 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(1) - (1)].node);}
    break;

  case 93:
/* Line 1792 of yacc.c  */
#line 293 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(ADD, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 94:
/* Line 1792 of yacc.c  */
#line 294 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(MINUS, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 95:
/* Line 1792 of yacc.c  */
#line 295 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_NOT, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 96:
/* Line 1792 of yacc.c  */
#line 296 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_AND, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 97:
/* Line 1792 of yacc.c  */
#line 297 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_OR, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 98:
/* Line 1792 of yacc.c  */
#line 298 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_NAND, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 99:
/* Line 1792 of yacc.c  */
#line 299 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_NOR, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 100:
/* Line 1792 of yacc.c  */
#line 300 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_XNOR, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 101:
/* Line 1792 of yacc.c  */
#line 301 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(LOGICAL_NOT, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 102:
/* Line 1792 of yacc.c  */
#line 302 "SRC/verilog_bison.y"
    {(yyval.node) = newUnaryOperation(BITWISE_XOR, (yyvsp[(2) - (2)].node), yylineno);}
    break;

  case 103:
/* Line 1792 of yacc.c  */
#line 303 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_XOR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 104:
/* Line 1792 of yacc.c  */
#line 304 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(MULTIPLY, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 105:
/* Line 1792 of yacc.c  */
#line 305 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(DIVIDE, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 106:
/* Line 1792 of yacc.c  */
#line 306 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(MODULO, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 107:
/* Line 1792 of yacc.c  */
#line 307 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(ADD, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 108:
/* Line 1792 of yacc.c  */
#line 308 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(MINUS, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 109:
/* Line 1792 of yacc.c  */
#line 309 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_AND, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 110:
/* Line 1792 of yacc.c  */
#line 310 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_OR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 111:
/* Line 1792 of yacc.c  */
#line 311 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_NAND, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 112:
/* Line 1792 of yacc.c  */
#line 312 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_NOR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 113:
/* Line 1792 of yacc.c  */
#line 313 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(BITWISE_XNOR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 114:
/* Line 1792 of yacc.c  */
#line 314 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(LT, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 115:
/* Line 1792 of yacc.c  */
#line 315 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(GT, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 116:
/* Line 1792 of yacc.c  */
#line 316 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(SR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 117:
/* Line 1792 of yacc.c  */
#line 317 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(SL, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 118:
/* Line 1792 of yacc.c  */
#line 318 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(LOGICAL_EQUAL, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 119:
/* Line 1792 of yacc.c  */
#line 319 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(NOT_EQUAL, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 120:
/* Line 1792 of yacc.c  */
#line 320 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(LTE, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 121:
/* Line 1792 of yacc.c  */
#line 321 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(GTE, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 122:
/* Line 1792 of yacc.c  */
#line 322 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(CASE_EQUAL, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 123:
/* Line 1792 of yacc.c  */
#line 323 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(CASE_NOT_EQUAL, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 124:
/* Line 1792 of yacc.c  */
#line 324 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(LOGICAL_OR, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 125:
/* Line 1792 of yacc.c  */
#line 325 "SRC/verilog_bison.y"
    {(yyval.node) = newBinaryOperation(LOGICAL_AND, (yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node), yylineno);}
    break;

  case 126:
/* Line 1792 of yacc.c  */
#line 326 "SRC/verilog_bison.y"
    {(yyval.node) = newIfQuestion((yyvsp[(1) - (5)].node), (yyvsp[(3) - (5)].node), (yyvsp[(5) - (5)].node), yylineno);}
    break;

  case 127:
/* Line 1792 of yacc.c  */
#line 327 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(2) - (3)].node);}
    break;

  case 128:
/* Line 1792 of yacc.c  */
#line 331 "SRC/verilog_bison.y"
    {(yyval.node) = newListReplicate( (yyvsp[(2) - (6)].node), (yyvsp[(4) - (6)].node) ); }
    break;

  case 129:
/* Line 1792 of yacc.c  */
#line 332 "SRC/verilog_bison.y"
    {(yyval.node) = newListReplicate( (yyvsp[(2) - (6)].node), (yyvsp[(4) - (6)].node) ); }
    break;

  case 130:
/* Line 1792 of yacc.c  */
#line 335 "SRC/verilog_bison.y"
    {(yyval.node) = newNumberNode((yyvsp[(1) - (1)].num_value), yylineno);}
    break;

  case 131:
/* Line 1792 of yacc.c  */
#line 336 "SRC/verilog_bison.y"
    {(yyval.node) = newSymbolNode((yyvsp[(1) - (1)].id_name), yylineno);}
    break;

  case 132:
/* Line 1792 of yacc.c  */
#line 337 "SRC/verilog_bison.y"
    {(yyval.node) = newArrayRef((yyvsp[(1) - (4)].id_name), (yyvsp[(3) - (4)].node), yylineno);}
    break;

  case 133:
/* Line 1792 of yacc.c  */
#line 338 "SRC/verilog_bison.y"
    {(yyval.node) = newRangeRef((yyvsp[(1) - (6)].id_name), (yyvsp[(3) - (6)].node), (yyvsp[(5) - (6)].node), yylineno);}
    break;

  case 134:
/* Line 1792 of yacc.c  */
#line 339 "SRC/verilog_bison.y"
    {(yyval.node) = (yyvsp[(2) - (3)].node); ((yyvsp[(2) - (3)].node))->types.concat.num_bit_strings = -1;}
    break;

  case 135:
/* Line 1792 of yacc.c  */
#line 342 "SRC/verilog_bison.y"
    {(yyval.node) = newList_entry((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node)); /* note this will be in order lsb = greatest to msb = 0 in the node child list */}
    break;

  case 136:
/* Line 1792 of yacc.c  */
#line 343 "SRC/verilog_bison.y"
    {(yyval.node) = newList(CONCATENATE, (yyvsp[(1) - (1)].node));}
    break;


/* Line 1792 of yacc.c  */
#line 2814 "SRC/verilog_bison.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


/* Line 2055 of yacc.c  */
#line 346 "SRC/verilog_bison.y"

