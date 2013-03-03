/* File: parser.y
 * --------------
 * Bison input file to generate the parser for the compiler.
 *
 * pp2: your job is to write a parser that will construct the parse tree
 *      and if no parse errors were found, print it.  The parser should 
 *      accept the language as described in specification, and as augmented 
 *      in the pp2 handout.
 */

%{

/* Just like lex, the text within this first region delimited by %{ and %}
 * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
 * file ahead of the definitions of the yyparse() function. Add other header
 * file inclusions or C++ variable declarations/prototypes that are needed
 * by your code here.
 */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"

void yyerror(const char *msg); // standard error-handling routine

%}

/* The section before the first %% is the Definitions section of the yacc
 * input file. Here is where you declare tokens and types, add precedence
 * and associativity options, and so on.
 */
 
/* yylval 
 * ------
 * Here we define the type of the yylval global variable that is used by
 * the scanner to store attibute information about the token just scanned
 * and thus communicate that information to the parser. 
 *
 * pp2: You will need to add new fields to this union as you add different 
 *      attributes to your non-terminal symbols.
 */

%union {
    int integerConstant;
    bool boolConstant;
    char *stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null
    Decl *decl;
    List<Decl*> *declList;
    Type *type;
    VarDecl *varDecl;
    FnDecl *fnDecl;
    List<VarDecl*> *formals;
    Identifier *identObj;
    List<NamedType*>* nTList;
    ClassDecl* classDecl;
    InterfaceDecl* ifaceDecl;
    List<VarDecl*> *vardecls;
    List<Stmt*> *statements;
    Stmt* stmt;
    PrintStmt* printStmt;
    List<Expr*>* exprList;
    Expr* expr;
    StmtBlock* stmtBlock;
    LValue* lvalue;
    Call* call;
    IfStmt* ifStmt;
    WhileStmt* whileStmt;
    ForStmt* forStmt;
    ReturnStmt* returnStmt;
    BreakStmt* breakStmt;
    SwitchStmt* switchStmt;
    List<Case*>* caseStmts;
    Case* caseStmt;
    Default* defStmt;
}


/* Tokens
 * ------
 * Here we tell yacc about all the token types that we are using.
 * Bison will assign unique numbers to these and export the #define
 * in the generated y.tab.h header file.
 */
%token   T_Void T_Bool T_Int T_Double T_String T_Class 
%token   T_LessEqual T_GreaterEqual T_Equal T_NotEqual T_Dims
%token   T_And T_Or T_Null T_Extends T_This T_Interface T_Implements
%token   T_While T_For T_If T_Else T_Return T_Break
%token   T_New T_NewArray T_Print T_ReadInteger T_ReadLine
%token   T_Increment T_Decrement T_Switch T_Case T_Default

%token   <identifier> T_Identifier
%token   <stringConstant> T_StringConstant 
%token   <integerConstant> T_IntConstant
%token   <doubleConstant> T_DoubleConstant
%token   <boolConstant> T_BoolConstant

// these are virtual tokens that aren't really parsed.
// used for precedence operations
%token   T_UnaryMinus
%token   T_NoElse

/* Non-terminal types
 * ------------------
 * In order for yacc to assign/access the correct field of $$, $1, we
 * must to declare which field is appropriate for the non-terminal.
 * As an example, this first type declaration establishes that the DeclList
 * non-terminal uses the field named "declList" in the yylval union. This
 * means that when we are setting $$ for a reduction for DeclList ore reading
 * $n which corresponds to a DeclList nonterminal we are accessing the field
 * of the union named "declList" which is of type List<Decl*>.
 * pp2: You'll need to add many of these of your own.
 */
%type <declList>   DeclList 
%type <decl>       Decl
%type <type>       Type
%type <varDecl>    VariableDecl
%type <varDecl>    Variable
%type <fnDecl>     FunctionDecl
%type <formals>    OptFormals
%type <formals>    Formals
%type <identObj>   Identifier
%type <declList>   FieldList
%type <decl>       Field
%type <nTList>     ImplementsDecl
%type <nTList>     ImplementsList
%type <classDecl>  ClassDecl
%type <decl>       Prototype
%type <declList>   PrototypeList
%type <ifaceDecl>  InterfaceDecl
%type <vardecls>   VarDeclList
%type <stmtBlock>  StmtBlock
%type <statements> StmtList
%type <stmt>       Stmt
%type <printStmt>  PrintStmt
%type <exprList>   ExprList
%type <expr>       Expr
%type <lvalue>     LValue
%type <exprList>   Actuals
%type <exprList>   OptActuals
%type <call>       Call
%type <ifStmt>     IfStmt
%type <whileStmt>  WhileStmt
%type <forStmt>    ForStmt
%type <returnStmt> ReturnStmt
%type <breakStmt>  BreakStmt
%type <switchStmt> SwitchStmt
%type <caseStmts>  CaseStatements
%type <caseStmt>   CaseStatement
%type <defStmt>    DefaultStatement
%type <statements> OptStmtList

/* Precedence Assignment
 * ---------------------
 * Here we do some precedence assignments. Ones at the bototm have higher
 * priority than those at the top 
 */

%nonassoc   '='
%left       T_Or
%left       T_And
%nonassoc   T_Equal T_NotEqual
%nonassoc   '<' T_LessEqual '>' T_GreaterEqual
%left       '+' '-'
%left       '*' '/' '%'
%nonassoc   '!' T_UnaryMinus T_Increment T_Decrement
%nonassoc   '[' '.'
%nonassoc   T_NoElse
%nonassoc   T_Else

%%
/* Rules
 * -----
 * All productions and actions should be placed between the start and stop
 * %% markers which delimit the Rules section.
	 
 */
Program           :    DeclList    { 
                                      Program *program = new Program($1);
                                      program->SetParent(NULL);
                                      // if no errors, advance to next phase
                                      if (ReportError::NumErrors() == 0) 
                                          program->Check(); 
                                      // comment out prev line to skip semantic analysis
                                      // actual code emission
                                      if (ReportError::NumErrors() == 0) 
                                          program->Emit();
                                    }
                  ;

DeclList          :    DeclList Decl        { ($$=$1)->Append($2); }
                  |    Decl                 { ($$ = new List<Decl*>)->Append($1); }
                  ;

Decl              :    VariableDecl         { $$ = $1; }
                  |    FunctionDecl         { $$ = $1; }
                  |    ClassDecl            { $$ = $1; }
                  |    InterfaceDecl        { $$ = $1; }
                  ;

VariableDecl      : Variable ';'            { $$ = $1; }
                  | Variable '=' Expr ';'   { ReportError::Formatted(&@$, "Cannot assign a value to a variable in declaration. Assignment ignored.\n"); $$ = $1; }
                  ;

Variable          : Type Identifier         { $$ = new VarDecl($2, $1); }
                  ;

Type              : T_Int                   { $$ = Type::intType; }
                  | T_Double                { $$ = Type::doubleType; }
                  | T_Bool                  { $$ = Type::boolType; }
                  | T_String                { $$ = Type::stringType; }
                  | Identifier              { $$ = new NamedType($1); }
                  | Type T_Dims             { $$ = new ArrayType(@1, $1); }
                  ;

Identifier        : T_Identifier            { $$ = new Identifier(@1, $1); }
                  ;

FunctionDecl      : Type Identifier '(' OptFormals ')' StmtBlock     { $$ = new FnDecl($2, $1, $4); $$->SetFunctionBody($6); }
                  | T_Void Identifier '(' OptFormals ')' StmtBlock   { $$ = new FnDecl($2, Type::voidType, $4); $$->SetFunctionBody($6); }
                  ;

OptFormals        : Formals                 { $$ = $1; }
                  |                         { $$ = new List<VarDecl *>; }
                  ;

Formals           : Variable                { ($$ = new List<VarDecl *>)->Append($1); }
                  | Formals ',' Variable    { ($$ = $1)->Append($3); }
                  ; 

ClassDecl         : T_Class Identifier ImplementsDecl '{' FieldList '}'
                    { $$ = new ClassDecl($2, NULL, $3, $5); }
                  | T_Class Identifier T_Extends Identifier ImplementsDecl '{' FieldList '}'
                    { $$ = new ClassDecl($2, new NamedType($4), $5, $7); }
                  ;

ImplementsDecl    : T_Implements ImplementsList       { $$ = $2; }
                  |                                   { $$ = new List<NamedType *>; }
                  ;
                  
ImplementsList    : Identifier                        { ($$ = new List<NamedType *>)->Append(new NamedType($1)); }
                  | ImplementsList ',' Identifier     { ($$ = $1)->Append(new NamedType($3)); }
                  ;
                  
FieldList         : FieldList Field       { ($$=$1)->Append($2); }
                  |                       { $$ = new List<Decl*>; }
                  ;

Field             : VariableDecl          { $$ = $1; }
                  | FunctionDecl          { $$ = $1; }
                  ;

InterfaceDecl     : T_Interface Identifier '{' PrototypeList '}'      { $$ = new InterfaceDecl($2, $4); }
                  ;

PrototypeList     : PrototypeList Prototype    { ($$=$1)->Append($2); }
                  |                            { $$ = new List<Decl*>; }
                  ;

Prototype         : Type Identifier '(' OptFormals ')' ';'   { $$ = new FnDecl($2, $1, $4); }
                  | T_Void Identifier '(' OptFormals ')' ';' { $$ = new FnDecl($2, Type::voidType, $4); }
                  ;

StmtBlock         : '{' VarDeclList StmtList '}'   { $$ = new StmtBlock($2, $3); }
                  | '{' StmtList '}'               { $$ = new StmtBlock(new List<VarDecl*>, $2); }
                  | '{' VarDeclList '}'            { $$ = new StmtBlock($2, new List<Stmt*>); }
                  | '{' '}'                        { $$ = new StmtBlock(new List<VarDecl*>, new List<Stmt*>); }
                  | '{' error '}'  { ReportError::Formatted(&@$, "Can't parse statement block correctly. Attempting to skip."); $$ = new StmtBlock(new List<VarDecl*>, new List<Stmt*>); }
                  ;

VarDeclList       : VarDeclList VariableDecl    { ($$ = $1)->Append($2); }
                  | VariableDecl                { ($$ = new List<VarDecl*>)->Append($1); }
                  ;

StmtList          : StmtList Stmt               { ($$ = $1)->Append($2); }
                  | Stmt                        { ($$ = new List<Stmt*>)->Append($1); }
                  ;

Stmt              : PrintStmt                     { $$ = $1; }
                  | ';'                           { $$ = new EmptyExpr(); }
                  | Expr ';'                      { $$ = $1; }
                  | IfStmt                        { $$ = $1; }
                  | WhileStmt                     { $$ = $1; }
                  | ForStmt                       { $$ = $1; }
                  | BreakStmt                     { $$ = $1; }
                  | ReturnStmt                    { $$ = $1; }
                  | SwitchStmt                    { $$ = $1; }
                  | StmtBlock                     { $$ = $1; }
                  | error ';'                     { ReportError::Formatted(&@$, "Cannot parse statement. Skipping statement."); $$ = new EmptyExpr(); }
                  ;
                  
SwitchStmt        : T_Switch '(' Expr ')' '{' CaseStatements DefaultStatement '}'  { $$ = new SwitchStmt($3, $6, $7); }
                  | T_Switch '(' Expr ')' '{' DefaultStatement '}' {  ReportError::Formatted(&@$, "Need at least one case statement. Skipping entire switch statement block."); $$ = new SwitchStmt($3, new List<Case *>, NULL); }
                  | T_Switch '(' Expr ')' '{' error '}' { ReportError::Formatted(&@$, "Cannot parse switch statement block. Skipping entire switch statement block."); $$ = new SwitchStmt($3, new List<Case *>, NULL); }
                  ;

CaseStatements    : CaseStatements CaseStatement            { ($$ = $1)->Append($2); }
                  | CaseStatement                           { ($$ = new List<Case*>)->Append($1); }
                  ;

CaseStatement     : T_Case Expr ':' OptStmtList             { $$ = new Case($2, $4); }
                  ;

DefaultStatement  : T_Default ':' OptStmtList               { $$ = new Default($3); }
                  |                                         { $$ = NULL; }
                  ;

OptStmtList       : StmtList                                { $$ = $1; }
                  |                                         { $$ = new List<Stmt*>; }
                  ;

IfStmt            : T_If '(' Expr ')' Stmt T_Else Stmt       { $$ = new IfStmt($3, $5, $7); }
                  | T_If '(' Expr ')' Stmt %prec T_NoElse    { $$ = new IfStmt($3, $5, NULL); }
                  ;

WhileStmt         : T_While '(' Expr ')' Stmt     { $$ = new WhileStmt($3, $5); }
                  ;

PrintStmt         : T_Print '(' ExprList ')' ';'  { $$ = new PrintStmt($3); }
                  ;

ForStmt           : T_For '(' ';' Expr ';' ')' Stmt               { $$ = new ForStmt(new EmptyExpr(), $4, new EmptyExpr(), $7); }
                  | T_For '(' Expr ';' Expr ';' ')' Stmt          { $$ = new ForStmt($3, $5, new EmptyExpr(), $8); }
                  | T_For '(' ';' Expr ';' Expr ')' Stmt          { $$ = new ForStmt(new EmptyExpr(), $4, $6, $8); }
                  | T_For '(' Expr ';' Expr ';' Expr ')' Stmt     { $$ = new ForStmt($3, $5, $7, $9); }
                  ;

ReturnStmt        : T_Return ';'      { $$ = new ReturnStmt(@$, new EmptyExpr()); }
                  | T_Return Expr ';' { $$ = new ReturnStmt(@2, $2); }
                  ;

BreakStmt         : T_Break ';' { $$ = new BreakStmt(@1); }
                  ;

ExprList          : ExprList ',' Expr             { ($$ = $1)->Append($3); }
                  | Expr                          { ($$ = new List<Expr*>)->Append($1); }
                  ;

Expr              : LValue '=' Expr               { $$ = new AssignExpr($1, new Operator(@2, "="), $3);  }
                  | LValue                        { $$ = $1; }
                  
                  /* Constants here */
                  | T_StringConstant              { $$ = new StringConstant(@1, $1); }
                  | T_IntConstant                 { $$ = new IntConstant(@1, $1); }
                  | T_DoubleConstant              { $$ = new DoubleConstant(@1, $1); }
                  | T_BoolConstant                { $$ = new BoolConstant(@1, $1); }
                  | T_Null                        { $$ = new NullConstant(@1); }
                  
                  | T_This                        { $$ = new This(@1); }
                  | Call                          { $$ = $1; }
                  | '(' Expr ')'                  { $$ = $2; }
                  | Expr '+' Expr                 { $$ = new ArithmeticExpr($1, new Operator(@2, "+"), $3); }
                  | Expr '-' Expr                 { $$ = new ArithmeticExpr($1, new Operator(@2, "-"), $3); }
                  | Expr '*' Expr                 { $$ = new ArithmeticExpr($1, new Operator(@2, "*"), $3); }
                  | Expr '/' Expr                 { $$ = new ArithmeticExpr($1, new Operator(@2, "/"), $3); }
                  | Expr '%' Expr                 { $$ = new ArithmeticExpr($1, new Operator(@2, "%"), $3); }
                  | '-' Expr %prec T_UnaryMinus   { $$ = new ArithmeticExpr(new Operator(@1, "-"), $2); }
                  | Expr '<' Expr                 { $$ = new RelationalExpr($1, new Operator(@2, "<"), $3); }
                  | Expr T_LessEqual Expr         { $$ = new RelationalExpr($1, new Operator(@2, "<="), $3); }
                  | Expr '>' Expr                 { $$ = new RelationalExpr($1, new Operator(@2, ">"), $3); }
                  | Expr T_GreaterEqual Expr      { $$ = new RelationalExpr($1, new Operator(@2, ">="), $3); }
                  | Expr T_Equal Expr             { $$ = new EqualityExpr($1, new Operator(@2, "=="), $3); }
                  | Expr T_NotEqual Expr          { $$ = new EqualityExpr($1, new Operator(@2, "!="), $3); }
                  | Expr T_And Expr               { $$ = new LogicalExpr($1, new Operator(@2, "&&"), $3); }
                  | Expr T_Or Expr                { $$ = new LogicalExpr($1, new Operator(@2, "||"), $3); }
                  | '!' Expr                      { $$ = new LogicalExpr(new Operator(@1, "!"), $2); }
                  | LValue T_Increment              { $$ = new PostfixExpr($1, new Operator(@2, "++")); }
                  | LValue T_Decrement              { $$ = new PostfixExpr($1, new Operator(@2, "--")); }
                  | T_ReadInteger '(' ')'         { $$ = new ReadIntegerExpr(@$); }
                  | T_ReadLine '(' ')'            { $$ = new ReadLineExpr(@$); }
                  | T_New Identifier              { $$ = new NewExpr(@$, new NamedType($2)); }
                  | T_NewArray '(' Expr ',' Type ')'  { $$ = new NewArrayExpr(@$, $3, $5); }
                  ;

Call              : Identifier '(' OptActuals ')'            { $$ = new Call(@$, NULL, $1, $3); }
                  | Expr '.' Identifier '(' OptActuals ')'   { $$ = new Call(@$, $1, $3, $5); }
                  ;

OptActuals        : Actuals                       { $$ = $1; }
                  |                               { $$ = new List<Expr*>; }
                  ;

Actuals           : Expr                          { ($$ = new List<Expr*>)->Append($1); }
                  | Actuals ',' Expr              { ($$ = $1)->Append($3); }
                  ;

LValue            : Identifier                    { $$ = new FieldAccess(NULL, $1); }
                  | Expr '.' Identifier           { $$ = new FieldAccess($1, $3); }
                  | Expr '[' Expr ']'             { $$ = new ArrayAccess(@$, $1, $3); }
                  ;

%%

/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated y.tab.c file.
 * This section is where you put definitions of helper functions.
 */

/* Function: InitParser
 * --------------------
 * This function will be called before any calls to yyparse().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the parser (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yydebug that controls whether yacc prints debugging information about
 * parser actions (shift/reduce) and contents of state stack during parser.
 * If set to false, no information is printed. Setting it to true will give
 * you a running trail that might be helpful when debugging your parser.
 * Please be sure the variable is set to false when submitting your final
 * version.
 */
void InitParser()
{
   PrintDebug("parser", "Initializing parser");
   yydebug = false;
}
