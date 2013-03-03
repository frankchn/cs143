/* File: ast_stmt.h
 * ----------------
 * The Stmt class and its subclasses are used to represent
 * statements in the parse tree.  For each statment in the
 * language (for, if, return, etc.) there is a corresponding
 * node class for that construct. 
 *
 * pp3: You will need to extend the Stmt classes to implement
 * semantic analysis for rules pertaining to statements.
 */


#ifndef _H_ast_stmt
#define _H_ast_stmt

#include "list.h"
#include "ast.h"
#include "hashtable.h"
#include "ast_type.h"

class Decl;
class VarDecl;
class Expr;
class IntConstant;
class Location;
class CodeGenerator;

class Program : public Node
{
  protected:
     List<Decl*> *decls;
     
  public:
     Program(List<Decl*> *declList);
     void Check();
     void Emit();
};

class Stmt : public Node
{
  public:
     char* exitLabel;

     Stmt() : Node() {}
     Stmt(yyltype loc) : Node(loc) {}
     virtual Type* Check(Hashtable<Decl*>* symbolTable) = 0;
     virtual Location* Emit(CodeGenerator *cg) = 0;
};

class StmtBlock : public Stmt 
{
  protected:
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    
  public:
    StmtBlock(List<VarDecl*> *variableDeclarations, List<Stmt*> *statements);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

  
class ConditionalStmt : public Stmt
{
  protected:
    Expr *test;
    Stmt *body;
  
  public:
    ConditionalStmt(Expr *testExpr, Stmt *body);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class LoopStmt : public ConditionalStmt 
{
  public:
    LoopStmt(Expr *testExpr, Stmt *body) : ConditionalStmt(testExpr, body) {}
    virtual Type* Check(Hashtable<Decl*>* symbolTable) = 0;
    virtual Location* Emit(CodeGenerator *cg) = 0;
};

class ForStmt : public LoopStmt 
{
  protected:
    Expr *init, *step;
  
  public:
    ForStmt(Expr *init, Expr *test, Expr *step, Stmt *body);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class WhileStmt : public LoopStmt 
{
  public:
    WhileStmt(Expr *test, Stmt *body) : LoopStmt(test, body) {}
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class IfStmt : public ConditionalStmt 
{
  protected:
    Stmt *elseBody;
  
  public:
    IfStmt(Expr *test, Stmt *thenBody, Stmt *elseBody);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class BreakStmt : public Stmt 
{
  public:
    BreakStmt(yyltype loc) : Stmt(loc) {}
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class ReturnStmt : public Stmt  
{
  protected:
    Expr *expr;
  
  public:
    bool noReturn;
    ReturnStmt(yyltype loc, Expr *expr);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class PrintStmt : public Stmt
{
  protected:
    List<Expr*> *args;
    
  public:
    PrintStmt(List<Expr*> *arguments);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class Default : public Stmt
{
  protected:
    List<Stmt*>* s;
    
  public:
    Default(List<Stmt*>* statements);
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class Case : public Stmt
{
  protected:
    Expr* e;
    List<Stmt*>* s;
    
  public:
    char* excLabel;
    Case(Expr* expr, List<Stmt*>* statements);
    Expr* GetExpr() { return e; }
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

class SwitchStmt : public Stmt
{
  protected:
    Expr* e;
    List<Case*>* c;
    Default* d; 
    
  public:
    SwitchStmt(Expr* exp, List<Case*>* cases, Default* def); // def can be null
    virtual Type* Check(Hashtable<Decl*>* symbolTable);
    virtual Location* Emit(CodeGenerator *cg);
};

#endif
