%{
#include "y.tab.h"

int lineNo = 1;
int colNo = 1;
%}

%%

^"PROGRAM"			{colNo+=7; ECHO; return Tprogram;}
"VAR"				{colNo+=3; ECHO; return Tvar;}
"INTEGER"			{colNo+=7; ECHO; return Tinteger;}
"BEGIN"				{colNo+=5; ECHO; return Tbegin;}
"READ"				{colNo+=4; ECHO; return Tread;}
"WRITE"				{colNo+=5; ECHO; return Twrite;}
"END"				{colNo+=3; ECHO; return Tend;}
"FOR"				{colNo+=3; ECHO; return Tfor;}
"TO"				{colNo+=2; ECHO; return Tto;}
"DO"				{colNo+=2; ECHO; return Tdo;}


"+"				{colNo++; ECHO; return Tplus;}
"-"				{colNo++; ECHO; return Tminus;}
"*"				{colNo++; ECHO; return Tmultiply;}
"DIV"				{colNo+=3; ECHO; return Tdivide;}
"("				{colNo++; ECHO; return Tleft;}
")"				{colNo++; ECHO; return Tright;}
":"				{colNo++; ECHO; return Tcolon;}
";"				{colNo++; ECHO; return Tsemicolon;}
":="				{colNo++; ECHO; return Tassignment;}
"."				{colNo++; ECHO; return Tpoint;}
","				{colNo++; ECHO; return Tcomma;}

0|[1-9][0-9]* 			{ colNo += strlen(yytext); yylloc.first_line=lineNo;
				yylloc.first_column=colNo; yylval.val=atoi(yytext); 					ECHO; return Tintvalue; }

[a-zA-Z][a-zA-Z0-9_]* 		{ yylloc.first_line = lineNo; yylloc.first_column = 					colNo; colNo+=strlen(yytext); yylval.sir = new 					char[strlen(yytext)+1]; strcpy(yylval.sir,yytext); 					ECHO; return Tid;}
[ ]		{ colNo++; }
.		{ colNo++; ECHO; return Terror; }
\r\n|\n		{ lineNo++; colNo=1; }
%%



