%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <ctype.h>
	#include <iostream>
	using namespace std;

	int yylex();
	int yyerror(const char *message);

	int IsOk = 0;
	char message[500];

	class TVAR
	{
		char *name;
		char *type;
		char *value;
		TVAR *next;

		public:
			static TVAR *head;
			static TVAR *tail;
			TVAR(char *n,char *type, char *val);
			TVAR();
			int exists(char *n);
			void add(char *n, char *type, char *val);
			char *getValue(char *n);
			char *getType(char *n);
			void setValue(char *n, char *val);
			
	};

	TVAR *TVAR::head;
	TVAR *TVAR::tail;

	TVAR::TVAR(char *n, char *type, char *val)
	{
		this->name = new char[strlen(n) + 1];
		strcpy(this->name, n);
		this->type = new char[strlen(type) + 1];
		strcpy(this->type, type);
		this->value = new char[strlen(val) +1];
		strcpy(this->value, val);
		this->next = NULL;
	}

	int TVAR::exists(char *n)
	{
		TVAR *tmp = TVAR::head;
		while(tmp != NULL)
		{
			if(strcmp(tmp->name, n) == 0)
				return 1;
			tmp = tmp->next;
		}
		return 0;
	}
	
	TVAR::TVAR()
	{
		TVAR::head = NULL;
		TVAR::tail = NULL;
	}
	

	void TVAR::add(char *n, char *type, char *val)
	{
		TVAR *elem = new TVAR(n, type, val);
		if(head == NULL)
			{
				TVAR::head = TVAR::tail = elem;
			}
		else 
			{
				TVAR::tail->next = elem;
				TVAR::tail = elem;
			}
	}

	char *TVAR::getValue(char *n)
	{
		TVAR *tmp = TVAR::head;
		while(tmp != NULL)
		{
			if(strcmp(tmp->name, n) == 0)
				return tmp->value;
			tmp = tmp->next;
		}
		return nullptr;
	}

	char* TVAR::getType(char* n)
	{
	 TVAR* tmp = TVAR::head;
	 while(tmp != NULL)
	 {
	  if(strcmp(tmp->name,n) == 0)
	  	return tmp->type;
	  tmp = tmp->next;
	 }
	 return nullptr;
	}

	void TVAR::setValue(char *n, char *val)
	{
		TVAR *tmp = TVAR::head;
		while(tmp != NULL)
		{
			if(strcmp(tmp->name, n) == 0)
			{
				strcpy(tmp->value, val);
			}
			tmp = tmp->next;
		}
	}

	TVAR *ts = NULL;

	
%}


%union {int val; char* sir;}

%token Tprogram Tvar Tbegin Tend Tpoint
%token Tplus Tminus Tmultiply Tdivide Tleft Tright Tcolon Tsemicolon Tassignment Tcomma
%token Tinteger 
%token Tread Twrite
%token Tfor Tdo Tto
%token <sir> Terror Tid
%token <val> Tintvalue

%type <sir> id_list

%start prog

%left Tplus Tminus 
%left Tmultiply Tdivide

%locations

%%

prog: Tprogram prog_name Tvar dec_list Tbegin stmt_list Tend Tpoint
		{IsOk = 1; }
	;

prog_name: Tid
		
	;

dec_list: dec
		
 
	|
	dec_list Tsemicolon dec
	
	;

dec: id_list Tcolon type
	
	;

type: Tinteger
	;

id_list: Tid	
	|
	id_list Tcomma Tid
		
	;

stmt_list: stmt
	|
	stmt_list Tsemicolon stmt
	;

stmt: assign
	|
	read
	|
	write
	|
	for
	;

assign: Tid Tassignment exp
	
	
	;
exp: term
	|
	exp Tplus term
	|
	exp Tminus term
	;

term: factor	
	|
	term Tmultiply factor
	|
	term Tdivide factor
	;

factor: Tid	
	|
	Tintvalue
	|
	Tleft exp Tright
	;

read: Tread Tleft id_list Tright
	

	
	;

write: Twrite Tleft id_list Tright
	
 	
	;

for: Tfor index_exp Tdo body
	;

index_exp: Tid Tassignment exp Tto exp
	;

body: stmt
	|
	Tbegin stmt_list Tend
	;

%%

int main()
{
	yyparse();
	
	if(IsOk == 1)
	{
		printf("CORECTA\n");		
	}	

       return 0;
}

int yyerror(const char *message)
{
	printf("Error: %s\n", message);
	return 1;
}

			
