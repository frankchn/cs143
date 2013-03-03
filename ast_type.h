/* File: ast_type.h
 * ----------------
 * In our parse tree, Type nodes are used to represent and
 * store type information. The base Type class is used
 * for built-in types, the NamedType for classes and interfaces,
 * and the ArrayType for arrays of other types.  
 *
 * pp3: You will need to extend the Type classes to implement
 * the type system and rules for type equivalency and compatibility.
 */
 
#ifndef _H_ast_type
#define _H_ast_type

#include "ast.h"
#include "list.h"
#include <iostream>
#include "hashtable.h"
using namespace std;

class Decl;
class NamedType;

class Type : public Node 
{
  protected:
    char *typeName;

  public :
    static Type *intType, *doubleType, *boolType, *voidType,
                *nullType, *stringType, *errorType;

    Type(yyltype loc) : Node(loc) {}
    Type(const char *str);

    virtual const char* GetName() { return typeName; }
    virtual void PrintToStream(ostream& out) { out << typeName; }
    friend ostream& operator<<(ostream& out, Type *t) { t->PrintToStream(out); return out; }
    virtual bool IsEquivalentTo(Type *other) { return this == other; }

    static bool ValidityChecker(Hashtable<Decl *>* symbolTable, Type* type);
    static bool TypeEquivalence(Type* a, Type *b, bool strict, Hashtable<Decl *>* symbolTable = NULL,  bool lcbOneWayCheck = true);
    static Type* LeastUpperBound(NamedType* a, NamedType* b, bool checkGreater = false); 
    
    virtual bool IsErrorType() { return strcmp(this->GetName(), Type::errorType->GetName()) == 0; }
    virtual bool IsNullType() { return strcmp(this->GetName(), Type::nullType->GetName()) == 0; }
    
    virtual bool Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater);
};

class NamedType : public Type 
{
  protected:
    Identifier *id;
    
  public:
    NamedType(Identifier *i);
    virtual const char* GetName() { return id->GetName(); }
    Identifier* GetIdentifier() { return id; }
    void PrintToStream(ostream& out) { out << id; }
    
    virtual bool IsErrorType() { return false; }
    virtual bool IsNullType() { return false; }
    
    virtual bool Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater);
};

class ArrayType : public Type 
{
  protected:
    Type *elemType;

  public:
    ArrayType(yyltype loc, Type *elemType);
    Type* BaseType() { return elemType; }
    void PrintToStream(ostream& out) { out << elemType << "[]"; }
    
    virtual const char* GetName() { return "Array"; }
    virtual bool IsErrorType() { return false; }
    virtual bool IsNullType() { return false; }
    
    virtual bool Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater);
};

 
#endif
