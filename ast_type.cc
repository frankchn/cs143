/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */

#include <string.h>
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_stmt.h"
#include "errors.h"
#include "hashtable.h"
 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

extern Hashtable<Decl *>* __globalST;

Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    typeName = strdup(n);
}

bool Type::ValidityChecker(Hashtable<Decl *>* parentST, Type* type) {
    NamedType* nT = dynamic_cast<NamedType *>(type);
    ArrayType *aT = dynamic_cast<ArrayType *>(type);
    
    Hashtable<Decl *>* symbolTable = __globalST->MakeCopy();

    if(nT != NULL) {
        Decl* dT = symbolTable->Lookup(nT->GetName());
        if(dT == NULL || dynamic_cast<VarDecl *>(dT) != NULL || dynamic_cast<FnDecl *>(dT) != NULL) {
            ReportError::IdentifierNotDeclared(nT->GetIdentifier(), LookingForType);
            return false;
        }
        return true;
    } else if(aT != NULL) {
        return Type::ValidityChecker(symbolTable, aT->BaseType());
    } else {
        return true;
    }
    return false;
}

/* Calculates the least upper bound type 
   If checkGreater is enabled, NamedType a must be <= NamedType b.
 */
Type* Type::LeastUpperBound(NamedType* a, NamedType* b, bool checkGreater) {
    Hashtable<Decl *>* symbolTable = __globalST->MakeCopy();

    Decl* a_decl = symbolTable->Lookup(a->GetName());
    Decl* b_decl = symbolTable->Lookup(b->GetName());

    if(a_decl == NULL || b_decl == NULL) return Type::errorType;

    ClassDecl* a_class = dynamic_cast<ClassDecl *>(a_decl);
    ClassDecl* b_class = dynamic_cast<ClassDecl *>(b_decl);
    InterfaceDecl* a_if = dynamic_cast<InterfaceDecl *>(a_decl);
    InterfaceDecl* b_if = dynamic_cast<InterfaceDecl *>(b_decl);

    if(a_if != NULL && b_if != NULL) {
        /* They are both interfaces, so either they are completely compatible or nothing */
        if(strcmp(a_if->GetName(), b_if->GetName()) == 0) return a;
        return Type::errorType;
    }

    if((a_class != NULL && b_if != NULL) || (a_if != NULL && b_class != NULL)) {
        /* One is a class and another is an interface */
        if(!checkGreater && a_if != NULL) { 
            swap(a_if, b_if); swap(a_class, b_class); // ensures that a is always the class
        } else if(checkGreater && a_if != NULL) {
            return Type::errorType; // NOTE: this means requires class but you give it an interface 
        }
        ClassDecl* savedClass = a_class;
        List<NamedType*>* a_list = a_class->GetImplements();
        while(true) {
            for(int i = 0; i < a_list->NumElements(); ++i) {
                if(strcmp(a_list->Nth(i)->GetName(), b_if->GetName()) == 0) 
                    return new NamedType(savedClass->GetIdentifier());
            }
            if(a_class->GetExtends() == NULL) break;
            if(((a_decl = symbolTable->Lookup(a_class->GetExtends()->GetName())) != NULL) && dynamic_cast<ClassDecl *>(a_decl) != NULL) {
                a_class = dynamic_cast<ClassDecl *>(a_decl);
                a_list = a_class->GetImplements();
            }
        }
        /* Drops down to nothing */
        return Type::errorType;
    }
    
    // if they are both classes then we need to walk the hierarchy
    Hashtable<ClassDecl *> a_ancestors;
    a_ancestors.Enter(a_class->GetName(), a_class);
    
    while(true) {
        if(a_class->GetExtends() == NULL) break;
        while(((a_decl = symbolTable->Lookup(a_class->GetExtends()->GetName())) != NULL) && dynamic_cast<ClassDecl *>(a_decl) == NULL)
            symbolTable->Remove(a_class->GetExtends()->GetName(), a_decl);
        if(a_decl == NULL) break;
        a_class = dynamic_cast<ClassDecl *>(a_decl);
        a_ancestors.Enter(a_class->GetName(), a_class);
    }

    if(a_ancestors.Lookup(b_class->GetName()) != NULL) {
        /* Then B is an ancestor of A and we can just return B's type */
        return new NamedType(b_class->GetIdentifier());
    }

    /* If the checkGreater flag is not flag then we can compare both ways */
    if(!checkGreater) {
        while(true) {
            if(b_class->GetExtends() == NULL) break;
            while(((b_decl = symbolTable->Lookup(b_class->GetExtends()->GetName())) != NULL) && dynamic_cast<ClassDecl *>(b_decl) == NULL)
                symbolTable->Remove(b_class->GetExtends()->GetName(), b_decl);
            if(b_decl == NULL) break;
            b_class = dynamic_cast<ClassDecl *>(b_decl);
            if(a_ancestors.Lookup(b_class->GetName()) != NULL) {
                return new NamedType(b_class->GetIdentifier());
            }
        }
    }
    
    delete symbolTable;
    return Type::errorType;
}

/* If not strict, then A <= B is okay */
bool Type::TypeEquivalence(Type* a, Type *b, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater) {
    Assert(strict || parentST != NULL);
    Assert(a != NULL);
    Assert(b != NULL);

    return a->Equivalence(b, strict, parentST, lcbCheckGreater);
}

bool Type::Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater) {
    if(this->IsErrorType() || other->IsErrorType())
        return true;

    if(this->IsNullType() && other->IsNullType())
        return true;

    if(this->IsNullType() && !other->IsNullType()) 
        return other->Equivalence(this, strict, parentST, lcbCheckGreater);

    if(dynamic_cast<NamedType*>(other) != NULL || dynamic_cast<ArrayType*>(other) != NULL)
        return false;

    return strcmp(this->typeName, other->typeName) == 0;
}

bool NamedType::Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater) {
    if(this->IsErrorType() || other->IsErrorType())
        return true;
        
    if(!strict && (this->IsNullType() || other->IsNullType()))
        return true;

    if(dynamic_cast<NamedType*>(other) == NULL)
        return false;
    
    if(strict) return (strcmp(this->GetName(), other->GetName()) == 0);

    Hashtable<Decl *>* symbolTable = parentST->MakeCopy();
    if(LeastUpperBound(this, dynamic_cast<NamedType*>(other), lcbCheckGreater) == Type::errorType) {
        delete symbolTable;
        return false;
    } else {
        delete symbolTable;
        return true;
    }
}

bool ArrayType::Equivalence(Type* other, bool strict, Hashtable<Decl *>* parentST, bool lcbCheckGreater) {
    if(this->IsErrorType() || other->IsErrorType())
        return true;
    
    if(dynamic_cast<ArrayType*>(other) == NULL) return false;

    return this->BaseType()->Equivalence(dynamic_cast<ArrayType*>(other)->BaseType(), strict, parentST, lcbCheckGreater);
}

NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 


ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}
