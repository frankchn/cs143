/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast.h"
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "errors.h"
#include "list.h"
#include "tac.h"

extern Hashtable<Decl *>* __globalST;

Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}


VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
}

void VarDecl::Emit(CodeGenerator* cg) {
    // Either a StmtBlock or a ClassDecl or Program
    if(ClassDecl* parent = dynamic_cast<ClassDecl*>(this->GetParent())) {
        // TODO: Decl in class
    } else if (StmtBlock* parent = dynamic_cast<StmtBlock*>(this->GetParent())) {
        Location* l = cg->GetNewLocationOnStack(id->GetName());
        cg->InsertLocation(id->GetName(), l);
    } else {
        Location* l = cg->GenGlobalVar(id->GetName());
        cg->InsertLocation(id->GetName(), l);
    }
}

void VarDecl::Check(Hashtable<Decl *>* symbolTable) {
    Type::ValidityChecker(symbolTable, type);
}

ClassDecl::ClassDecl(Identifier *n, NamedType *ex, List<NamedType*> *imp, List<Decl*> *m) : Decl(n) {
    // extends can be NULL, impl & mem may be empty lists but cannot be NULL
    Assert(n != NULL && imp != NULL && m != NULL);     
    extends = ex;
    if (extends) extends->SetParent(this);
    (implements=imp)->SetParentAll(this);
    (members=m)->SetParentAll(this);
}

void ClassDecl::RecursiveAddList(List<VarDecl*>* v, List<FnDecl*>* m, List<List<FnDecl *>*>* interf, List<const char *>* ifname) {
    if(extends != NULL) {
        ClassDecl* parent = dynamic_cast<ClassDecl *>(__globalST->Lookup(extends->GetName()));
        if(parent != NULL) {
            parent->RecursiveAddList(v, m, interf, ifname);
        }
    }

    for(int i = 0; i < members->NumElements(); i++) {
        if(FnDecl* fn = dynamic_cast<FnDecl*>(members->Nth(i))) {
            bool found = false;
            for(int i = 0; i < m->NumElements(); i++) 
                if(strcmp(m->Nth(i)->GetName(), fn->GetName()) == 0) {
                    found = true;
                    m->RemoveAt(i);
                    m->InsertAt(fn, i);
                }
            if(!found)
                m->Append(fn);
        } else if(VarDecl* vd = dynamic_cast<VarDecl*>(members->Nth(i))) {
            v->Append(vd);
        }
    }
}

void ClassDecl::RecursiveInterfaceAdd(List<VarDecl*>* v, List<FnDecl*>* m, List<List<FnDecl *>*>* interf, List<const char *>* ifname) {
    if(extends != NULL) {
        ClassDecl* parent = dynamic_cast<ClassDecl *>(__globalST->Lookup(extends->GetName()));
        if(parent != NULL) {
            parent->RecursiveInterfaceAdd(v, m, interf, ifname);
        }
    }

    for(int i = 0; i < implements->NumElements(); ++i) {
        InterfaceDecl* imDecl = dynamic_cast<InterfaceDecl *>(__globalST->Lookup(implements->Nth(i)->GetName()));
        ifname->Append(strdup(imDecl->GetName()));
        List<Decl*>* mem = imDecl->GetMembers();
        List<FnDecl*>* currI = new List<FnDecl*>();

        for(int j = 0; j < mem->NumElements(); j++) {
            FnDecl* i_f = dynamic_cast<FnDecl *>(mem->Nth(j));
            
            for(int k = 0; k < m->NumElements(); k++) {
                if(strcmp(m->Nth(k)->GetName(), i_f->GetName()) == 0) {
                    currI->Append(m->Nth(k));
                    break;
                }
            }
        }
        interf->Append(currI);
    }
}

void ClassDecl::EmitHeader(CodeGenerator* cg, List<const char*>* names, int offsetCount) {
    char tmpName[100];
    snprintf(tmpName, 100, "_offset_%s_%d", this->GetName(), offsetCount);
    tmpName[99] = '\0';
    
    cg->GenLabel(tmpName);
    BeginFunc* bf = cg->GenBeginFunc();
    cg->GenReturn(cg->GenLoadConstant(offsetCount));
    bf->SetFrameSize(cg->currentStackSize * 4);
    cg->GenEndFunc();

    names->Append(strdup(tmpName));
}

void ClassDecl::Emit(CodeGenerator* cg) {
    int offsetCount = 0;

    List<const char *>* names = new List<const char *>();
    
    EmitHeader(cg, names, offsetCount);
    offsetCount += 4;

    for(int i = 0; i < allMethods->NumElements(); i++) {
        if(allMethods->Nth(i)->GetParent() == this) {
            string tmpName = "f_";
            tmpName += dynamic_cast<Decl*>(allMethods->Nth(i)->GetParent())->GetName();
            tmpName += ".";
            tmpName += allMethods->Nth(i)->GetName();
            names->Append(strdup(tmpName.c_str()));
        } else {
            FnDecl* myFn = allMethods->Nth(i)->MakeCopy();
            myFn->SetParent(this);
            allMethods->RemoveAt(i);
            allMethods->InsertAt(myFn, i);
            
            string tmpName = "f_";
            tmpName += dynamic_cast<Decl*>(allMethods->Nth(i)->GetParent())->GetName();
            tmpName += ".";
            tmpName += allMethods->Nth(i)->GetName();
            names->Append(strdup(tmpName.c_str()));
            
            members->Append(myFn);
        }
    }
    
    cg->GenVTable(this->GetName(), names);
    for(int j = 0; j < ifName->NumElements(); j++) {
        string vtableName;
        vtableName += this->GetName();
        vtableName += "_";
        vtableName += ifName->Nth(j);

        List<const char *>* names = new List<const char *>();
        
        EmitHeader(cg, names, offsetCount);
        offsetCount += 4;
        
        for(int i = 0; i < allInterfaces->Nth(j)->NumElements(); i++) {
            const char* fnName = allInterfaces->Nth(j)->Nth(i)->GetName();
            for(int k = 0; k < allMethods->NumElements(); k++) {
                if(strcmp(allMethods->Nth(k)->GetName(), fnName) == 0) {
                    string tmpName = "f_";
                    tmpName += dynamic_cast<Decl*>(allMethods->Nth(k)->GetParent())->GetName();
                    tmpName += ".";
                    tmpName += allMethods->Nth(k)->GetName();
                    names->Append(strdup(tmpName.c_str()));
                }
            }
        }
        cg->GenVTable(strdup(vtableName.c_str()), names);
    }

    for(int i = 0; i < members->NumElements(); i++) {
        if(FnDecl* fn = dynamic_cast<FnDecl*>(members->Nth(i))) {
            fn->Emit(cg);
        }
    }
}

bool VarDecl::CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable) {
    if(dynamic_cast<ClassDecl*>(this->GetParent()) != NULL) {
        ReportError::DeclConflict(newDecl, this);
        return false;
    }
    return true;
}

bool FnDecl::CheckCompatibilityInClass(Decl* newDecl, Hashtable<Decl *>* symbolTable) {
    //FnDecl* o_f = this;
    FnDecl* c_f = dynamic_cast<FnDecl*>(newDecl);
    
    if(dynamic_cast<ClassDecl*>(this->GetParent()) != NULL) {
        if(c_f == NULL || this->GetParent() == newDecl->GetParent()) {
            ReportError::DeclConflict(newDecl, this);
            return false;
        }

        if(!FnDecl::CheckSignature(this, c_f)) {
            ReportError::OverrideMismatch(newDecl);
            return false;
        }
    }
    return true;
}

void ClassDecl::AddSymbols(Hashtable<Decl *>* symbolTable, bool checkConflict, bool recurse) {
    if(recurse && extends != NULL) {
        ClassDecl* parent = dynamic_cast<ClassDecl *>(__globalST->Lookup(extends->GetName()));
        if(parent != NULL) {
            parent->AddSymbols(symbolTable, checkConflict, recurse);
        }
    }

    for(int i = 0; i < members->NumElements(); ++i) {
        const char* declName = members->Nth(i)->GetName();
        if(!checkConflict || symbolTable->Lookup(declName) == NULL) {
            symbolTable->Enter(declName, members->Nth(i));
        } else {
            Decl* d = symbolTable->Lookup(declName);
            if(d != NULL && !d->CheckCompatibilityInClass(members->Nth(i), symbolTable)) continue;
            symbolTable->Enter(declName, members->Nth(i));
        }
    }
}

void ClassDecl::Check(Hashtable<Decl *>* parentST) {
    Hashtable<Decl *>* symbolTable = parentST->MakeCopy();

    /* First, we check whether extends and implements are being implemented from correctly declared things */
    if(extends != NULL) {
        Decl* exDecl = symbolTable->Lookup(extends->GetName());
        if(exDecl == NULL || dynamic_cast<ClassDecl *>(exDecl) == NULL)
            ReportError::IdentifierNotDeclared(extends->GetIdentifier(), LookingForClass);

        /* Check recursive whether extends form a loop */
        Hashtable<Decl*> h_temp;
        h_temp.Enter(this->GetName(), this);
        while(true) {
            if(exDecl == NULL || dynamic_cast<ClassDecl *>(exDecl) == NULL) break;
            ClassDecl* cdec = dynamic_cast<ClassDecl *>(exDecl);
            if(h_temp.Lookup(cdec->GetName()) != NULL) {
                ReportError::Formatted(this->GetIdentifier()->GetLocation(), "The inheritance hierarchy of this class forms a loop.");
                return;
            }
            h_temp.Enter(cdec->GetName(), cdec);
            if(cdec->GetExtends() != NULL)
                exDecl = symbolTable->Lookup(cdec->GetExtends()->GetName());
            else
                exDecl = NULL;
        }
    }

    
    for(int i = 0; i < implements->NumElements(); ++i) {
        Decl* imDecl = symbolTable->Lookup(implements->Nth(i)->GetName());
        if(imDecl == NULL || dynamic_cast<InterfaceDecl *>(imDecl) == NULL)
            ReportError::IdentifierNotDeclared(implements->Nth(i)->GetIdentifier(), LookingForInterface);
    }

    /* Add everything ever inherited this into the class, starting from the top */
    if(extends != NULL) {
        ClassDecl* c = dynamic_cast<ClassDecl *>(symbolTable->Lookup(extends->GetName()));
        if(c != NULL) c->AddSymbols(symbolTable, false, true);
    }
    
    /* Add everything implemented in this class itself and check for dups and inheritance */
    this->AddSymbols(symbolTable, true, false);

    /* Now check whether interfaces are implemented properly */
    for(int i = 0; i < implements->NumElements(); ++i) {
        InterfaceDecl* imDecl = dynamic_cast<InterfaceDecl *>(symbolTable->Lookup(implements->Nth(i)->GetName()));
        if(imDecl != NULL) {
            List<Decl*>* m = imDecl->GetMembers();
            for(int j = 0; j < m->NumElements(); j++) {
                FnDecl* i_f = dynamic_cast<FnDecl *>(m->Nth(j));
                FnDecl* m_f = dynamic_cast<FnDecl *>(symbolTable->Lookup(m->Nth(j)->GetName()));

                if(m_f == NULL || dynamic_cast<ClassDecl *>(m_f->GetParent()) == NULL) {
                    ReportError::InterfaceNotImplemented(this, implements->Nth(i));
                    continue;
                }
                
                if(!FnDecl::CheckSignature(m_f, i_f)) {
                    ReportError::OverrideMismatch(m_f);
                    continue;
                }
            }
        }
    }

    /* Recursively check whether each function / var decls is proper */
    for(int i = 0; i < members->NumElements(); ++i) {
        members->Nth(i)->Check(symbolTable);
    }

    /* NOTE NOTE NOTE : CODE GEN CODE GEN CODE GEN PRELIM WORKS */
    allVariables = new List<VarDecl *>();
    allMethods = new List<FnDecl *>();
    allInterfaces = new List<List<FnDecl *>*>();
    ifName = new List<const char *>();

    RecursiveAddList(allVariables, allMethods, allInterfaces, ifName);
    RecursiveInterfaceAdd(allVariables, allMethods, allInterfaces, ifName);

    this->varOffset = (allInterfaces->NumElements() + 1) * 4;
    this->objectSize = (allInterfaces->NumElements() + 1 + allVariables->NumElements()) * 4;
    
    /* NOTE NOTE NOTE : CODE GEN CODE GEN CODE GEN PRELIM WORKS */

    delete symbolTable;
}

InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (members=m)->SetParentAll(this);
}

void InterfaceDecl::Emit(CodeGenerator* cg) {
    allMethods = new List<const char *>();
    
    for(int i = 0; i < members->NumElements(); i++) {
        if(FnDecl* fn = dynamic_cast<FnDecl*>(members->Nth(i))) {
            allMethods->Append(strdup(fn->GetName()));
        } 
    }
}

void InterfaceDecl::Check(Hashtable<Decl *>* parentST) {
    Hashtable<Decl *>* symbolTable = parentST->MakeCopy();

    /* Insert and check for identifier consistency */
    for(int i = 0; i < members->NumElements(); i++) {
        const char* declName = members->Nth(i)->GetName();

        /* Checks whether the id exists and if it does, if the id is at the same level */
        if(symbolTable->Lookup(declName) == NULL || symbolTable->Lookup(declName)->GetParent() != this) {
            symbolTable->Enter(declName, members->Nth(i));
        } else {
            ReportError::DeclConflict(members->Nth(i), symbolTable->Lookup(declName));
        }
    }

    /* Recursively check function declarations */
    for(int i = 0; i < members->NumElements(); i++) {
        members->Nth(i)->Check(symbolTable);
    }
    
    delete symbolTable;
}

FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
}

void FnDecl::Emit(CodeGenerator* cg) {
    Assert(body != NULL);

    cg->NewScope();

    if(ClassDecl* p = dynamic_cast<ClassDecl*>(this->GetParent())) {
        string tmp = "f_";
        tmp += p->GetName();
        tmp += ".";
        tmp += this->GetName();
        cg->GenLabel(tmp.c_str());
    } else {
        string tmp = "f_";
        tmp += id->GetName();
        cg->GenLabel(tmp.c_str());
        // We generate two labels right next to each other for main so main can be recursive too
        // without too many special cases littered around
        if(strcmp(id->GetName(), "main") == 0)
            cg->GenLabel(id->GetName());
    }
    BeginFunc* bf = cg->GenBeginFunc();

    int globals = 0;

    if(dynamic_cast<ClassDecl *>(this->GetParent())) {
        cg->InsertLocation("this", new Location(fpRelative, 4 + globals * 4, "this"));
        globals++;
    }

    for(int i = 0; i < formals->NumElements(); ++i) {
        cg->InsertLocation(formals->Nth(i)->GetName(), new Location(fpRelative, 4 + globals * 4, formals->Nth(i)->GetName()));
        globals++;
    }

    body->Emit(cg);

    bf->SetFrameSize(cg->currentStackSize * 4);
    cg->GenEndFunc();
    
    cg->RemoveScope();
}

void FnDecl::Check(Hashtable<Decl *>* parentST) {
    Hashtable<Decl *>* symbolTable = parentST->MakeCopy();

    /* Verify return type validity */
    Type::ValidityChecker(symbolTable, returnType);

    /* Verify formals and variable declaration validity */
    for(int i = 0; i < formals->NumElements(); ++i) {
        const char* declName = formals->Nth(i)->GetName();
        Type::ValidityChecker(symbolTable, formals->Nth(i)->GetType());
        if(symbolTable->Lookup(declName) == NULL || symbolTable->Lookup(declName)->GetParent() != this) {
            symbolTable->Enter(declName, formals->Nth(i));
        } else {
            ReportError::DeclConflict(formals->Nth(i), symbolTable->Lookup(declName));
        }
    }

    /* Check statement block */
    if(body != NULL) {
        body->Check(symbolTable);
    }
    
    delete symbolTable;
}

bool FnDecl::CheckSignature(FnDecl *o_f, FnDecl *c_f) {
    /* We need to check for strict type adherence now */
    if(!Type::TypeEquivalence(o_f->GetReturnType(), c_f->GetReturnType(), true)) {
        return false;
    }

    if(o_f->GetFormals()->NumElements() != c_f->GetFormals()->NumElements()) {
        return false;
    }

    for(int j = 0; j < o_f->GetFormals()->NumElements(); j++) {
        if(!Type::TypeEquivalence(o_f->GetFormals()->Nth(j)->GetType(), c_f->GetFormals()->Nth(j)->GetType(), true)) {
            return false;
        }
    }
    
    return true;
}

void FnDecl::SetFunctionBody(Stmt *b) { 
    (body=b)->SetParent(this);
}
