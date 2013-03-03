/* File: ast_decl.h
 * ----------------
 * In our parse tree, Decl nodes are used to represent and
 * manage declarations. There are 4 subclasses of the base class,
 * specialized for declarations of variables, functions, classes,
 * and interfaces.
 *
 * pp3: You will need to extend the Decl classes to implement 
 * semantic processing including detection of declaration conflicts 
 * and managing scoping issues.
 */

#ifndef _H_ast_decl
#define _H_ast_decl

#include "ast.h"
#include "list.h"
#include "hashtable.h"
#include "codegen.h"

class Type;
class NamedType;
class Identifier;
class Stmt;
class FnDecl;

class Decl : public Node 
{
  protected:
    Identifier *id;
  
  public:
    Decl(Identifier *name);
    friend ostream& operator<<(ostream& out, Decl *d) { return out << d->id; }
    const char* GetName() { return id->GetName(); }
    Identifier* GetIdentifier() { return id; }
    virtual void Check(Hashtable<Decl *>* symbolTable) = 0;
    virtual bool CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable) = 0;
    
    virtual void Emit(CodeGenerator* cg) = 0;
};

class VarDecl : public Decl 
{
  protected:
    Type *type;
    
  public:
    VarDecl(Identifier *name, Type *type);
    Type* GetType() { return type; }
    virtual void Check(Hashtable<Decl *>* symbolTable);
    virtual bool CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable);

    virtual void Emit(CodeGenerator* cg);
};

class ClassDecl : public Decl 
{
  protected:
    List<Decl*> *members;
    NamedType *extends;
    List<NamedType*> *implements;
    
  public:
    List<VarDecl *>* allVariables;
    List<FnDecl *>* allMethods;
    List<List<FnDecl *>*>* allInterfaces;
    List<const char *>* ifName;
    
    int varOffset;
    int objectSize;

    void EmitHeader(CodeGenerator* cg, List<const char*>* names, int offsetCount);
    void AddSymbols(Hashtable<Decl *>* symbolTable, bool checkConflict, bool recurse);
    ClassDecl(Identifier *name, NamedType *extends, 
              List<NamedType*> *implements, List<Decl*> *members);
    NamedType* GetExtends() { return extends; }
    List<NamedType*>* GetImplements() { return implements; }
    virtual void Check(Hashtable<Decl *>* symbolTable);
    virtual bool CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable) { return false; }
    void RecursiveAddList(List<VarDecl*>* v, List<FnDecl*>* m, List<List<FnDecl*>*>* i, List<const char *>* ifname);
    void RecursiveInterfaceAdd(List<VarDecl*>* v, List<FnDecl*>* m, List<List<FnDecl *>*>* interf, List<const char *>* ifname);
    virtual void Emit(CodeGenerator* cg);
};

class InterfaceDecl : public Decl 
{
  protected:
    List<Decl*> *members;
    
  public:
    List<const char*>* allMethods;
  
    InterfaceDecl(Identifier *name, List<Decl*> *members);
    List<Decl*>* GetMembers() { return members; }
    virtual void Check(Hashtable<Decl *>* symbolTable);
    virtual bool CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable) { return false; }

    virtual void Emit(CodeGenerator* cg);
};

class FnDecl : public Decl 
{
  protected:
    List<VarDecl*> *formals;
    Type *returnType;
    Stmt *body;
    
  public:
    FnDecl(Identifier *name, Type *returnType, List<VarDecl*> *formals);
    void SetFunctionBody(Stmt *b);
    virtual void Check(Hashtable<Decl *>* symbolTable);
    static bool CheckSignature(FnDecl *o_f, FnDecl *c_f);

    List<VarDecl*>* GetFormals() { return formals; }
    Type* GetReturnType() { return returnType; }
    virtual bool CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable);
    FnDecl* MakeCopy() { FnDecl* n = new FnDecl(id, returnType, formals); n->SetFunctionBody(body); return n; }
    virtual void Emit(CodeGenerator* cg);
};

#endif
