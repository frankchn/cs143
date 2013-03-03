/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */

#include <string.h>
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "errors.h"
#include "codegen.h"
#include "tac.h"

extern Hashtable<Decl *>* __globalST;

Type* Expr::Check(Hashtable<Decl*>* parentST) { 
    return NULL;
}

Location* Expr::Emit(CodeGenerator *cg) {
    return NULL;
}

Type* EmptyExpr::Check(Hashtable<Decl*>* parentST) {
    return Type::voidType;
}

Location* EmptyExpr::Emit(CodeGenerator *cg) {
    return NULL;
}

Type* NullConstant::Check(Hashtable<Decl*>* parentST) {
    return Type::nullType;
}

Location* NullConstant::Emit(CodeGenerator *cg) {
    return NULL;
}

IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
    value = val;
}

Type* IntConstant::Check(Hashtable<Decl*>* parentST) { 
    return Type::intType;
}

Location* IntConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value);
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
}

Type* DoubleConstant::Check(Hashtable<Decl*>* parentST) {
    return Type::doubleType;
}

Location* DoubleConstant::Emit(CodeGenerator *cg) {
    return NULL;
}

Type* ErrorConstant::Check(Hashtable<Decl*>* parentST) {
    return Type::errorType;
}

Location* ErrorConstant::Emit(CodeGenerator *cg) {
    return NULL;
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
}

Type* BoolConstant::Check(Hashtable<Decl*>* parentST) { 
    return Type::boolType;
}

Location* BoolConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value ? 1 : 0);
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
}

Type* StringConstant::Check(Hashtable<Decl*>* parentST) { 
    return Type::stringType;
}

Location* StringConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value);
}

PostfixExpr::PostfixExpr(Expr *l, Operator *o) 
  : Expr(Join(l->GetLocation(), o->GetLocation())) {
    Assert(l != NULL && o != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this); 
}

Type* PostfixExpr::Check(Hashtable<Decl*>* parentST) { 
    /* NOTE: Need to be integer */
    if(!Type::TypeEquivalence(left->Check(parentST), Type::intType, true)) {
        ReportError::IncompatibleOperand(op, left->Check(parentST));
        return Type::errorType;
    }
    return Type::intType;
}

Location* PostfixExpr::Emit(CodeGenerator *cg) {
    Location* one = cg->GenLoadConstant(1);

    // need to handle what L is a local/global variable or something I malloc'd
    if(dynamic_cast<ArrayAccess*>(left) != NULL) {
        Location* l_ref = dynamic_cast<ArrayAccess*>(left)->EmitMemoryLocation(cg);
        Location* l = cg->GenLoad(l_ref);
        if(strcmp(op->GetToken(), "++") == 0) {
            cg->GenStore(l_ref, cg->GenBinaryOp("+", one, l));
        } else {
            cg->GenStore(l_ref, cg->GenBinaryOp("-", one, l));
        }
        return l;
    } else {
        if(FieldAccess* fa = dynamic_cast<FieldAccess *>(left)) {
            Location* l_ref = fa->EmitReference(cg);
            if(l_ref == NULL) {
                Location* l = fa->Emit(cg);
                Location* tmp = cg->GenTempVar();
                cg->GenAssign(tmp, l);
                if(strcmp(op->GetToken(), "++") == 0)
                    cg->GenAssign(l, cg->GenBinaryOp("+", tmp, one));
                else
                    cg->GenAssign(l, cg->GenBinaryOp("-", tmp, one));
                return tmp;
            } else {
                Location* l = cg->GenLoad(l_ref);
                if(strcmp(op->GetToken(), "++") == 0) {
                    cg->GenStore(l_ref, cg->GenBinaryOp("+", one, l));
                } else {
                    cg->GenStore(l_ref, cg->GenBinaryOp("-", one, l));
                }
                return l;
            }
        } else {
            Location* l = left->Emit(cg);
            Location* tmp = cg->GenTempVar();
            cg->GenAssign(tmp, l);
            if(strcmp(op->GetToken(), "++") == 0)
                cg->GenAssign(l, cg->GenBinaryOp("+", tmp, one));
            else
                cg->GenAssign(l, cg->GenBinaryOp("-", tmp, one));
            return tmp;
        } 
    }
    return NULL;
}

Operator::Operator(yyltype loc, const char *tok) : Node(loc) {
    Assert(tok != NULL);
    strncpy(tokenString, tok, sizeof(tokenString));
}

CompoundExpr::CompoundExpr(Expr *l, Operator *o, Expr *r) 
  : Expr(Join(l->GetLocation(), r->GetLocation())) {
    Assert(l != NULL && o != NULL && r != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this); 
    (right=r)->SetParent(this);
}

CompoundExpr::CompoundExpr(Operator *o, Expr *r) 
  : Expr(Join(o->GetLocation(), r->GetLocation())) {
    Assert(o != NULL && r != NULL);
    left = NULL; 
    (op=o)->SetParent(this);
    (right=r)->SetParent(this);
}
  
ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}

Type* ArrayAccess::Check(Hashtable<Decl*>* parentST) {
    Type* b_t = base->Check(parentST);
    Type* s_t = subscript->Check(parentST);

    if(dynamic_cast<ArrayType *>(b_t) == NULL) {
        ReportError::BracketsOnNonArray(base);
        return Type::errorType;
    }
    
    if(!Type::TypeEquivalence(s_t, Type::intType, true)) {
        ReportError::SubscriptNotInteger(subscript);
        return Type::errorType;
    }
    
    return (dynamic_cast<ArrayType *>(b_t))->BaseType();
}

Location* ArrayAccess::Emit(CodeGenerator *cg) {
    return cg->GenLoad(this->EmitMemoryLocation(cg));
}

Location* ArrayAccess::EmitMemoryLocation(CodeGenerator *cg) {
    Location* baseL = base->Emit(cg);
    Location* sscrL = subscript->Emit(cg);
    
    Location* zeroL = cg->GenLoadConstant(0);
    Location* fourL = cg->GenLoadConstant(4);
    
    char* contLabel = cg->NewLabel();
    
    Location* sizeL = cg->GenLoad(baseL, 0);
    
    // Runtime Check
    Location* tempL = cg->GenBinaryOp("||", 
                          cg->GenBinaryOp("<", sscrL, zeroL), 
                          cg->GenBinaryOp("||", 
                              cg->GenBinaryOp("<", sizeL, sscrL),
                              cg->GenBinaryOp("==", sizeL, sscrL)
                          )
                      );
    
    cg->GenIfZ(tempL, contLabel);
    cg->GenBuiltInCall(PrintString, cg->GenLoadConstant(err_arr_out_of_bounds), NULL);
    cg->GenBuiltInCall(Halt, NULL, NULL);
    
    cg->GenLabel(contLabel);
    Location* fL = cg->GenBinaryOp("+", baseL, cg->GenBinaryOp("+", cg->GenBinaryOp("*", sscrL, fourL), fourL));
    fL->locationRef = true;
    return fL;
}

FieldAccess::FieldAccess(Expr *b, Identifier *f) 
  : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
    Assert(f != NULL); // b can be be NULL (just means no explicit base)
    base = b; 
    if (base) base->SetParent(this); 
    (field=f)->SetParent(this);
    baseType = NULL;
}

Type* FieldAccess::Check(Hashtable<Decl*>* parentST) {
    if(base == NULL) {
        Decl* d = parentST->Lookup(field->GetName());
        if(d == NULL) {
            ReportError::IdentifierNotDeclared(field, LookingForVariable);
            return Type::errorType;
        }

        if(dynamic_cast<VarDecl *>(d) != NULL) {
            return (dynamic_cast<VarDecl *>(d))->GetType();
        } else {
            ReportError::IdentifierNotDeclared(field, LookingForVariable);
            return Type::errorType;
        }
    } else {
        Type* base_type = baseType = base->Check(parentST);

        if(base_type == Type::errorType) return Type::errorType;
        
        /* NOTE: for conformance reasons, we check whether there is a class with that field */
        NamedType* nt = dynamic_cast<NamedType *>(base_type);
        
        if(nt != NULL) {
            ClassDecl* cd = dynamic_cast<ClassDecl *>(__globalST->Lookup(nt->GetName()));
            if(cd != NULL) {
                Hashtable<Decl*>* cleanTable = new Hashtable<Decl*>();
                cd->AddSymbols(cleanTable, false, true);
                
                if(dynamic_cast<VarDecl *>(cleanTable->Lookup(field->GetName())) == NULL) {
                    ReportError::FieldNotFoundInBase(field, base_type);
                    delete cleanTable;
                    return Type::errorType;
                }
                delete cleanTable;
            }
        }

        NamedType* currclass = NULL;
        Node* p = this;
        while((p = p->GetParent()) != NULL)
            if(dynamic_cast<ClassDecl *>(p) != NULL)
                currclass = new NamedType((dynamic_cast<ClassDecl *>(p))->GetIdentifier());
                
        if(currclass == NULL && dynamic_cast<NamedType *>(base_type) != NULL) {
            ReportError::InaccessibleField(field, base_type);
            return Type::errorType;
        } else if(currclass == NULL && dynamic_cast<NamedType *>(base_type) == NULL) {
            ReportError::FieldNotFoundInBase(field, base_type);
            return Type::errorType;
        }

        if(!Type::TypeEquivalence(currclass, base_type, false, parentST, true)) {
            ReportError::InaccessibleField(field, base_type);
            return Type::errorType;
        }

        Decl* d = parentST->Lookup(field->GetName());
        if(dynamic_cast<VarDecl *>(d) != NULL) {
            return (dynamic_cast<VarDecl *>(d))->GetType();
        } else {
            ReportError::IdentifierNotDeclared(field, LookingForVariable);
            return Type::errorType;
        }
    }
    Assert(0);
}

Location* FieldAccess::Emit(CodeGenerator *cg) {
    Location* l = EmitReference(cg);
    if(l == NULL) {
        return cg->GetLocation(field->GetName());
    } else {
        return cg->GenLoad(l);
    }
}

Location* FieldAccess::EmitReference(CodeGenerator *cg) {
    ClassDecl* cd = NULL;
    Node* p = this;
    if(baseType != NULL) cd = dynamic_cast<ClassDecl* >(__globalST->Lookup(baseType->GetName()));
    
    if(cd == NULL)
        while((p = p->GetParent()) != NULL)
            if(dynamic_cast<ClassDecl *>(p) != NULL)
                cd = dynamic_cast<ClassDecl *>(p);
    
    if(cd == NULL) {
        return NULL;
    } else {
        if(base == NULL && cg->GetLocation(field->GetName()) != NULL) return NULL;
    
        int actualOffset = -1;
        for(int i = 0; i < cd->allVariables->NumElements(); i++) {
            if(strcmp(cd->allVariables->Nth(i)->GetName(), field->GetName()) == 0) {
                actualOffset = cd->varOffset + 4 * i;
                break;
            }
        }

        if(actualOffset == -1) return NULL;

        if(base != NULL) {
            Location* baseL = base->Emit(cg);
            return cg->GenBinaryOp("+", baseL, cg->GenLoadConstant(actualOffset));
        } else {
            return cg->GenBinaryOp("+", new Location(fpRelative, 4, "this"), cg->GenLoadConstant(actualOffset));
        }
    }
}

Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
    Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
    base = b;
    if (base) base->SetParent(this);
    (field=f)->SetParent(this);
    (actuals=a)->SetParentAll(this);
    isArrayLengthCheck = false;
}

Type* Call::Check(Hashtable<Decl*>* parentST) {
    Type* returnType = Type::errorType;
    FnDecl* actualFn = NULL;

    for(int j = 0; j < actuals->NumElements(); j++) {
        if(actuals->Nth(j)->Check(parentST)->IsErrorType()) {
            actuals->RemoveAt(j);
            actuals->InsertAt(new ErrorConstant(), j);
        }
    }

    if(base == NULL) {
        Decl* d = parentST->Lookup(field->GetName());
        if(d == NULL) {
            ReportError::IdentifierNotDeclared(field, LookingForFunction);
            return Type::errorType;
        }

        if(dynamic_cast<FnDecl *>(d) != NULL) {
            actualFn = (dynamic_cast<FnDecl *>(d));
            returnType = (dynamic_cast<FnDecl *>(d))->GetReturnType();
            
            // For Code Generator
            if(ClassDecl* cd = dynamic_cast<ClassDecl* >(actualFn->GetParent())) {
                this->fullyQualifiedFnName = NULL;
                this->isClassFunction = true;
                this->baseDecl = cd;
            } else {
                string tmp = "f_";
                tmp += actualFn->GetName();
                
                this->fullyQualifiedFnName = strdup(tmp.c_str());
                this->isClassFunction = false;
            }
            
            goto CheckParams;
        } else {
            ReportError::IdentifierNotDeclared(field, LookingForFunction);
            return Type::errorType;
        }
    } else {
        Hashtable<Decl*>* symbolTable = parentST->MakeCopy();
        Type* base_type = base->Check(symbolTable);
        if(dynamic_cast<NamedType *>(base_type) == NULL) {
            if(dynamic_cast<ArrayType *>(base_type) != NULL && strcmp(field->GetName(), "length") == 0) {
                // Special handling of length
                if(actuals->NumElements() != 0) {
                    ReportError::NumArgsMismatch(field, 0, actuals->NumElements());
                    return Type::errorType;
                }
                this->isArrayLengthCheck = true;
                return Type::intType;
            } else {
                ReportError::FieldNotFoundInBase(field, base_type);
                delete symbolTable;
                return Type::errorType;
            }
        } else {
            NamedType* nt = dynamic_cast<NamedType *>(base_type);
            ClassDecl* cd = dynamic_cast<ClassDecl *>(__globalST->Lookup(nt->GetName()));
            InterfaceDecl* in = dynamic_cast<InterfaceDecl *>(__globalST->Lookup(nt->GetName()));
            
            this->fullyQualifiedFnName = NULL;
            this->isClassFunction = true;
            
            if(in == NULL && cd == NULL) {
                // Can't even find the identifier
                // NOTE: NOT REPORTING ANY ERROR HERE - SINCE ALREADY WARNED
                delete symbolTable;
                return Type::errorType;
            }
            if(cd != NULL) {
                this->baseDecl = cd;
                Hashtable<Decl*>* cleanTable = new Hashtable<Decl*>();
                cd->AddSymbols(cleanTable, false, true);
                
                Decl* childDecl = cleanTable->Lookup(field->GetName());
                if(dynamic_cast<FnDecl *>(childDecl) != NULL) {
                    actualFn = (dynamic_cast<FnDecl *>(childDecl));
                    returnType = (dynamic_cast<FnDecl *>(childDecl))->GetReturnType();
                    goto CheckParams;
                } else {
                    ReportError::FieldNotFoundInBase(field, base_type); 
                    return Type::errorType;
                }
            } else if(in != NULL) {
                this->baseDecl = in;
                for(int i = 0; i < in->GetMembers()->NumElements(); ++i) {
                    if(strcmp(in->GetMembers()->Nth(i)->GetName(), field->GetName()) == 0) {
                        actualFn = (dynamic_cast<FnDecl *>(in->GetMembers()->Nth(i)));
                        returnType = (dynamic_cast<FnDecl *>(in->GetMembers()->Nth(i)))->GetReturnType();
                        goto CheckParams;
                    }
                }
                ReportError::FieldNotFoundInBase(field, base_type);
                return Type::errorType;
            }
        }
    }
    
CheckParams:
    if(returnType != Type::voidType) {
        hasReturnType = true;
    } else {
        hasReturnType = false;
    }

    if(actualFn->GetFormals()->NumElements() != actuals->NumElements()) {
        ReportError::NumArgsMismatch(field, actualFn->GetFormals()->NumElements(), actuals->NumElements());
        return Type::errorType;
    }

    for(int j = 0; j < actualFn->GetFormals()->NumElements(); j++) {
        if(!Type::TypeEquivalence(actuals->Nth(j)->Check(parentST), actualFn->GetFormals()->Nth(j)->GetType(), false, parentST, true)) {
            ReportError::ArgMismatch(actuals->Nth(j), j + 1, actuals->Nth(j)->Check(parentST), actualFn->GetFormals()->Nth(j)->GetType());
            return Type::errorType;
        }
    }

    return returnType;
}

Location* Call::Emit(CodeGenerator *cg) {
    if(this->isArrayLengthCheck) {
        Location* baseL = base->Emit(cg);
        return cg->GenLoad(baseL);
    } else if(this->isClassFunction) {
        Location* baseL;
        if(base != NULL) {
            baseL = base->Emit(cg);
        } else {
            baseL = new Location(fpRelative, 4, "this");
        }
        int callCounter = 0;
        Location* rtn = NULL;
    
        for(int i = actuals->NumElements() - 1; i >= 0; i--) {
            Location* tmp = actuals->Nth(i)->Emit(cg);
            cg->GenPushParam(tmp);
            callCounter++;
        }
        
        Location* myVTable = cg->GenLoad(baseL);
        Location* offsetFunction = cg->GenLoad(myVTable);
        Location* offsetValue = cg->GenACall(offsetFunction, true);
        Location* actualBaseL = cg->GenBinaryOp("-", baseL, offsetValue);
        
        int actualFnOffset = 0;
        
        if(ClassDecl* cd = dynamic_cast<ClassDecl *>(baseDecl)) {
            for(int j = 0; j < cd->allMethods->NumElements(); j++) {
                if(strcmp(cd->allMethods->Nth(j)->GetName(), field->GetName()) == 0) {
                    actualFnOffset = (j + 1) * 4;
                    break;
                }
            }
        } else if(InterfaceDecl* in = dynamic_cast<InterfaceDecl *>(baseDecl)) {
            for(int j = 0; j < in->allMethods->NumElements(); j++) {
                if(strcmp(in->allMethods->Nth(j), field->GetName()) == 0) {
                    actualFnOffset = (j + 1) * 4;
                    break;
                }
            }
        }

        Location* actualFunctionLoc = cg->GenLoad(myVTable, actualFnOffset);
        
        cg->GenPushParam(actualBaseL);
        callCounter++;
        
        rtn = cg->GenACall(actualFunctionLoc, hasReturnType);
        if(!hasReturnType) rtn = cg->GenLoadConstant(0);
        cg->GenPopParams(callCounter * 4);
        
        return rtn;
    } else {

        int callCounter = 0;
        Location* rtn = NULL;
    
        for(int i = actuals->NumElements() - 1; i >= 0; i--) {
            Location* tmp = actuals->Nth(i)->Emit(cg);
            cg->GenPushParam(tmp);
            callCounter++;
        }
        
        rtn = cg->GenLCall(this->fullyQualifiedFnName, hasReturnType);
        if(!hasReturnType) rtn = cg->GenLoadConstant(0);
        cg->GenPopParams(callCounter * 4);
    
        return rtn;
    }
}

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}

Type* NewExpr::Check(Hashtable<Decl*>* parentST) { 
    /* NOTE: NEW CLASS ONLY - NOT NEW INTERFACES */
    Decl* d = parentST->Lookup(cType->GetName());
    if(dynamic_cast<ClassDecl *>(d) == NULL) {
        ReportError::IdentifierNotDeclared(cType->GetIdentifier(), LookingForClass);
        return Type::errorType;
    }
    return cType;
}

Location* NewExpr::Emit(CodeGenerator *cg) {
    ClassDecl* c = dynamic_cast<ClassDecl *>(__globalST->Lookup(cType->GetName()));
    Location* start = cg->GenBuiltInCall(Alloc, cg->GenLoadConstant(c->objectSize));

    cg->GenStore(start, cg->GenLoadLabel(cType->GetName()));
    for(int i = 0; i < c->ifName->NumElements(); i++) {
        string vtableName;
        vtableName += c->GetName();
        vtableName += "_";
        vtableName += c->ifName->Nth(i);
        cg->GenStore(start, cg->GenLoadLabel(strdup(vtableName.c_str())), (i + 1) * 4);
    }

    return start;
}

NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this); 
    (elemType=et)->SetParent(this);
}

Type* NewArrayExpr::Check(Hashtable<Decl*>* parentST) { 
    bool error = false;
    Type* sizeType = size->Check(parentST);
    if(!Type::TypeEquivalence(sizeType, Type::intType, true)) {
        ReportError::NewArraySizeNotInteger(size);
        error = true;
    }
    error = !Type::ValidityChecker(parentST, elemType);
    if(!error)
        return new ArrayType(*(this->GetLocation()), elemType);
    return Type::errorType;
}

Location* NewArrayExpr::Emit(CodeGenerator *cg) {
    char* haltLabel = cg->NewLabel();
    char* continueLabel = cg->NewLabel();
    Location* sizeL = size->Emit(cg);
    Location* zeroL = cg->GenLoadConstant(0);
    Location* fourL = cg->GenLoadConstant(4);
    
    /* NOTE: Runtime Check - Whether arrsize is positive */
    Location* isLessL = cg->GenBinaryOp("<", zeroL, sizeL);
    cg->GenIfZ(isLessL, haltLabel);
    cg->GenGoto(continueLabel);
    
    cg->GenLabel(haltLabel);
    cg->GenBuiltInCall(PrintString, cg->GenLoadConstant(err_arr_bad_size), NULL);
    cg->GenBuiltInCall(Halt, NULL, NULL);
    
    cg->GenLabel(continueLabel);
    Location* start = cg->GenBuiltInCall(Alloc, cg->GenBinaryOp("+" ,cg->GenBinaryOp("*", sizeL, fourL), fourL), NULL);
    cg->GenStore(start, sizeL, 0);

    return start;
}

Type* This::Check(Hashtable<Decl*>* parentST) {
    Node* p = this;
    while((p = p->GetParent()) != NULL) {
    	if(dynamic_cast<ClassDecl *>(p) != NULL) { 
            return new NamedType((dynamic_cast<ClassDecl *>(p))->GetIdentifier());
    	}
    }

    ReportError::ThisOutsideClassScope(this);
    return Type::errorType;
}

Location* This::Emit(CodeGenerator *cg) {
    return new Location(fpRelative, 4, "this");
}

Type* ReadIntegerExpr::Check(Hashtable<Decl*>* parentST) {
    return Type::intType;
}

Location* ReadIntegerExpr::Emit(CodeGenerator *cg) {
    return cg->GenBuiltInCall(ReadInteger, NULL, NULL);
}

Type* ReadLineExpr::Check(Hashtable<Decl*>* parentST) {
    return Type::stringType;
}

Location* ReadLineExpr::Emit(CodeGenerator *cg) {
    return cg->GenBuiltInCall(ReadLine, NULL, NULL);
}

Type* AssignExpr::Check(Hashtable<Decl*>* parentST) {
    Type* l = leftType = left->Check(parentST);
    Type* r = rightType = right->Check(parentST);

    if(!Type::TypeEquivalence(r, l, false, parentST)) {
        ReportError::IncompatibleOperands(op, l, r);
        return Type::errorType;
    }
    
    return r;
}

Location* AssignExpr::Emit(CodeGenerator *cg) {
    Location* l = left->Emit(cg);
    Location* r = right->Emit(cg);

    // need to handle what L is a local/global variable or something I malloc'd
    if(dynamic_cast<ArrayAccess*>(left) != NULL) {
        Location* l_ref = dynamic_cast<ArrayAccess*>(left)->EmitMemoryLocation(cg);
        cg->GenStore(l_ref, r);
    } else {
        Decl* leftDecl = (leftType != NULL && leftType->GetName() != NULL) ? __globalST->Lookup(leftType->GetName()) : NULL;
        Decl* rightDecl = (rightType != NULL && rightType->GetName() != NULL) ? __globalST->Lookup(rightType->GetName()) : NULL;
        if(dynamic_cast<InterfaceDecl *>(leftDecl) != NULL && dynamic_cast<ClassDecl *>(rightDecl) != NULL) {
            ClassDecl* rc = dynamic_cast<ClassDecl *>(rightDecl);
            int offset = 0;
            for(int i = 0; i < rc->ifName->NumElements(); i++) {
                if(strcmp(rc->ifName->Nth(i), leftDecl->GetName()) == 0) {
                    offset = (i + 1) * 4;
                    break;
                }
            }
            cg->GenAssign(l, cg->GenBinaryOp("+", r, cg->GenLoadConstant(offset)));
        } else if(FieldAccess* fa = dynamic_cast<FieldAccess *>(left)) {
            //cg->GenAssign(l, r);
            Location* lref = fa->EmitReference(cg);
            if(lref == NULL) {
                lref = fa->Emit(cg);
                cg->GenAssign(lref, r);
            } else {
                cg->GenStore(lref, r);
            }
        } else {
            cg->GenAssign(l, r);
        } 
    }
    return l;
}

Type* ArithmeticExpr::Check(Hashtable<Decl*>* parentST) { 
    if(left != NULL) {
        Type* l = left->Check(parentST);
        Type* r = right->Check(parentST);
        if(Type::TypeEquivalence(l, r, true) && (Type::TypeEquivalence(l, Type::doubleType, true) || Type::TypeEquivalence(l, Type::intType, true)))
            return l;
        else {
            ReportError::IncompatibleOperands(op, l, r);
            return Type::errorType;
        }
    } else {
        Type* r = right->Check(parentST);
        if(Type::TypeEquivalence(r, Type::doubleType, true) || Type::TypeEquivalence(r, Type::intType, true))
            return r;
        else {
            ReportError::IncompatibleOperand(op, r);
            return Type::errorType;
        }
    }
}

Location* ArithmeticExpr::Emit(CodeGenerator *cg) {
    if(left != NULL) {
        Location* l = left->Emit(cg);
        Location* r = right->Emit(cg);
        return cg->GenBinaryOp((op->GetToken()), l, r);
    } else {
        Location* l = cg->GenLoadConstant(0);
        Location* r = right->Emit(cg);
        return cg->GenBinaryOp((op->GetToken()), l, r);
    }
}

Type* RelationalExpr::Check(Hashtable<Decl*>* parentST) { 
    Type* l = left->Check(parentST);
    Type* r = right->Check(parentST);
    if(Type::TypeEquivalence(l, r, true) && (Type::TypeEquivalence(l, Type::doubleType, true) || Type::TypeEquivalence(l, Type::intType, true)))
        return Type::boolType;
    else {
        ReportError::IncompatibleOperands(op, l, r);
        return Type::errorType;
    }
}

Location* RelationalExpr::Emit(CodeGenerator *cg) {
    char* o = op->GetToken();
    Location* l = left->Emit(cg);
    Location* r = right->Emit(cg);
    
    if(strcmp(o, "<") == 0) {
        return cg->GenBinaryOp("<", l, r);
    } else if(strcmp(o, "<=") == 0) {
        return cg->GenBinaryOp("||", cg->GenBinaryOp("<", l, r), cg->GenBinaryOp("==", l, r));
    } else if(strcmp(o, ">") == 0) {
        return cg->GenBinaryOp("<", r, l);
    } else if(strcmp(o, ">=") == 0) {
        return cg->GenBinaryOp("||", cg->GenBinaryOp("<", r, l), cg->GenBinaryOp("==", l, r));
    }
    return NULL;
}

Type* EqualityExpr::Check(Hashtable<Decl*>* parentST) {
    Type* l = left->cachedType = left->Check(parentST);
    Type* r = right->cachedType = right->Check(parentST);

    if(Type::TypeEquivalence(l, r, false, parentST, false)) 
        return Type::boolType;
    else {
        ReportError::IncompatibleOperands(op, l, r);
        return Type::errorType;
    }
}

Location* EqualityExpr::Emit(CodeGenerator *cg) {
    Location* l = left->Emit(cg);
    Location* r = right->Emit(cg);

    if(left->cachedType == Type::stringType) {
        if(strcmp(op->GetToken(), "==") == 0)
            return cg->GenBuiltInCall(StringEqual, l, r);
        else {
            Location* zero = cg->GenLoadConstant(0);
            return cg->GenBinaryOp("==", cg->GenBuiltInCall(StringEqual, l, r), zero);
        }
    } else {
        if(strcmp(op->GetToken(), "==") == 0)
            return cg->GenBinaryOp("==", l, r);
        else {
            Location* zero = cg->GenLoadConstant(0);
            return cg->GenBinaryOp("==", cg->GenBinaryOp("==", l, r), zero);
        }
    }
    return NULL;
}

Type* LogicalExpr::Check(Hashtable<Decl*>* parentST) { 
    if(left != NULL) {
        Type* l = left->Check(parentST);
        Type* r = right->Check(parentST);
        if(Type::TypeEquivalence(l, r, true) && (Type::TypeEquivalence(l, Type::boolType, true)))
            return Type::boolType;
        else {
            ReportError::IncompatibleOperands(op, l, r);
            return Type::errorType;
        }
    } else {
        Type* r = right->Check(parentST);
        if(Type::TypeEquivalence(r, Type::boolType, true))
            return Type::boolType;
        else {
            ReportError::IncompatibleOperand(op, r);
            return Type::errorType;
        }
    }
}

Location* LogicalExpr::Emit(CodeGenerator *cg) {
    if(strcmp(op->GetToken(), "&&") == 0) {
        Location* l = left->Emit(cg);
        Location* r = right->Emit(cg);
        return cg->GenBinaryOp("&&", l, r);
    } else if(strcmp(op->GetToken(), "||") == 0) {
        Location* l = left->Emit(cg);
        Location* r = right->Emit(cg);
        return cg->GenBinaryOp("||", l, r);
    } else if(strcmp(op->GetToken(), "!") == 0) {
        Location* r = right->Emit(cg);
        Location* zero = cg->GenLoadConstant(0);
        return cg->GenBinaryOp("==", r, zero);
    }
    return NULL;
}




