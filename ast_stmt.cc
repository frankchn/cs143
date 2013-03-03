/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */

#include "ast.h"
#include "ast_stmt.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_expr.h"
#include "list.h"
#include "hashtable.h"
#include "errors.h"

Hashtable<Decl *>* __globalST;

Program::Program(List<Decl*> *d) {
    Assert(d != NULL);
    (decls=d)->SetParentAll(this);
}

void Program::Check() {
    Hashtable<Decl *>* symbolTable = new Hashtable<Decl *>();

    /* Insert and check for identifier consistency */
    for(int i = 0; i < decls->NumElements(); i++) {
        const char* declName = decls->Nth(i)->GetName();

        /* Checks whether the id exists and if it does, if the id is at the same level */
        if(symbolTable->Lookup(declName) == NULL || symbolTable->Lookup(declName)->GetParent() != this) {
            symbolTable->Enter(declName, decls->Nth(i));
        } else {
            ReportError::DeclConflict(decls->Nth(i), symbolTable->Lookup(declName));
        }
    }

    __globalST = symbolTable->MakeCopy();

    /* Recursively check subcomponents */
    for(int i = 0; i < decls->NumElements(); i++) {
        decls->Nth(i)->Check(symbolTable);
    }
}

void Program::Emit() {
    CodeGenerator* cg = new CodeGenerator();
    Hashtable<Location *>* next = new Hashtable<Location *>(); 
    cg->varLocs->Append(next);
    
    for(int i = 0; i < decls->NumElements(); i++) {
        if(dynamic_cast<VarDecl *>(decls->Nth(i)) != NULL)
            decls->Nth(i)->Emit(cg);
    }
    
    for(int i = 0; i < decls->NumElements(); i++) {
        if(dynamic_cast<VarDecl *>(decls->Nth(i)) == NULL)
            decls->Nth(i)->Emit(cg);
    }

    if(__globalST->Lookup("main") == NULL) {
        ReportError::NoMainFound();
    } else {
        #ifdef DCC_OPTIMIZATION
        cg->OptimizeIR();
        #endif
        cg->DoFinalCodeGen();
    }
}



StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
    Assert(d != NULL && s != NULL);
    (decls=d)->SetParentAll(this);
    (stmts=s)->SetParentAll(this);
}

Type* StmtBlock::Check(Hashtable<Decl*>* parentST) { 
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy();

    /* Check declaration validity */
    for(int i = 0; i < decls->NumElements(); i++) {
        const char* declName = decls->Nth(i)->GetName();
        Type::ValidityChecker(parentST, decls->Nth(i)->GetType());
        /* Checks whether the id exists and if it does, if the id is at the same level */
        if(symbolTable->Lookup(declName) == NULL || symbolTable->Lookup(declName)->GetParent() != this) {
            symbolTable->Enter(declName, decls->Nth(i));
        } else {
            ReportError::DeclConflict(decls->Nth(i), symbolTable->Lookup(declName));
        }
    }
    
    for(int i = 0; i < stmts->NumElements(); i++) {
        stmts->Nth(i)->Check(symbolTable);
    }

    delete symbolTable;
    return NULL;
}

Location* StmtBlock::Emit(CodeGenerator *cg) {
    cg->NewScope();

    for(int i = 0; i < decls->NumElements(); i++) {
        decls->Nth(i)->Emit(cg);
    }
    
    for(int i = 0; i < stmts->NumElements(); i++) {
        stmts->Nth(i)->Emit(cg);
    }

    cg->RemoveScope();
    return NULL;
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
    Assert(t != NULL && b != NULL);
    (test=t)->SetParent(this); 
    (body=b)->SetParent(this);
}

Type* ConditionalStmt::Check(Hashtable<Decl*>* parentST) {
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy(); 

    Type* t = test->Check(symbolTable);
    if(!Type::TypeEquivalence(t, Type::boolType, true)) ReportError::TestNotBoolean(test);
    body->Check(symbolTable);

    delete symbolTable;
    return NULL;
}

Location* ConditionalStmt::Emit(CodeGenerator *cg) {
    return NULL;
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
    Assert(i != NULL && t != NULL && s != NULL && b != NULL);
    (init=i)->SetParent(this);
    (step=s)->SetParent(this);
}

Type* ForStmt::Check(Hashtable<Decl*>* parentST) { 
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy();

    init->Check(symbolTable);
    Type* t = test->Check(symbolTable);
    if(!Type::TypeEquivalence(t, Type::boolType, true)) ReportError::TestNotBoolean(test);
    step->Check(symbolTable);
    body->Check(symbolTable);

    delete symbolTable;
    return NULL;
}

Location* ForStmt::Emit(CodeGenerator *cg) {
    init->Emit(cg);
    char* loopStartL = cg->NewLabel();
    char* loopEndL = exitLabel = cg->NewLabel();
    
    cg->GenLabel(loopStartL);
    Location* testL = test->Emit(cg);
    cg->GenIfZ(testL, loopEndL);
    
    body->Emit(cg);
    step->Emit(cg);
    cg->GenGoto(loopStartL);
    
    cg->GenLabel(loopEndL);
    return NULL;
}

Type* WhileStmt::Check(Hashtable<Decl*>* parentST) {  
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy(); 

    Type* t = test->Check(symbolTable);
    if(!Type::TypeEquivalence(t, Type::boolType, true)) ReportError::TestNotBoolean(test);
    body->Check(symbolTable);

    delete symbolTable;
    return NULL;
}

Location* WhileStmt::Emit(CodeGenerator *cg) {
    char* loopStartL = cg->NewLabel();
    char* loopEndL = exitLabel = cg->NewLabel();
    
    cg->GenLabel(loopStartL);
    Location* testL = test->Emit(cg);
    cg->GenIfZ(testL, loopEndL);
    
    body->Emit(cg);
    cg->GenGoto(loopStartL);
    
    cg->GenLabel(loopEndL);
    return NULL;
}

Type* BreakStmt::Check(Hashtable<Decl*>* parentST) {
    
    Node* p = this;
    while((p = p->GetParent()) != NULL)
        if(dynamic_cast<WhileStmt *>(p) != NULL || 
           dynamic_cast<ForStmt *>(p) != NULL || 
           dynamic_cast<Case *>(p) != NULL ||
           dynamic_cast<Default *>(p) != NULL)
            return NULL;

    ReportError::BreakOutsideLoop(this);
    return NULL;
}

Location* BreakStmt::Emit(CodeGenerator *cg) {
    Node* p = this;
    while((p = p->GetParent()) != NULL)
        if(dynamic_cast<WhileStmt *>(p) != NULL || 
           dynamic_cast<ForStmt *>(p) != NULL || 
           dynamic_cast<Case *>(p) != NULL ||
           dynamic_cast<Default *>(p) != NULL) {
             cg->GenGoto(dynamic_cast<Stmt *>(p)->exitLabel);
             break;
        }
    return NULL;
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}

Type* IfStmt::Check(Hashtable<Decl*>* parentST) { 
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy(); 
    
    Type* t = test->Check(symbolTable);
    if(!Type::TypeEquivalence(t, Type::boolType, true)) ReportError::TestNotBoolean(test);
    
    body->Check(symbolTable);
    if(elseBody != NULL) 
        elseBody->Check(symbolTable);

    delete symbolTable;
    return NULL;
}

Location* IfStmt::Emit(CodeGenerator *cg) {
    Location* testL = test->Emit(cg);
    char* nextLabel = cg->NewLabel();
    
    if(elseBody != NULL) {
        char* elseLabel = cg->NewLabel();
        cg->GenIfZ(testL, elseLabel);
        body->Emit(cg);
        cg->GenGoto(nextLabel);
        cg->GenLabel(elseLabel);
        elseBody->Emit(cg);
    } else {
        cg->GenIfZ(testL, nextLabel);
        body->Emit(cg);
    }

    cg->GenLabel(nextLabel);
    return NULL;
}

ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}

Type* ReturnStmt::Check(Hashtable<Decl*>* parentST) {
    Hashtable<Decl*>* symbolTable = parentST->MakeCopy();

    Node* p = this;
    while((p = p->GetParent()) != NULL)
        if(dynamic_cast<FnDecl *>(p) != NULL)
            break;

    FnDecl* fn = dynamic_cast<FnDecl *>(p);
    Type* t = expr->Check(symbolTable);
    
    if(t == Type::voidType) noReturn = true; else noReturn = false;

    if(!Type::TypeEquivalence(t, fn->GetReturnType(), false, symbolTable))
        ReportError::ReturnMismatch(this, t, fn->GetReturnType());

    delete symbolTable;
    return NULL;
}

Location* ReturnStmt::Emit(CodeGenerator *cg) {
    if(noReturn) {
        cg->GenReturn();
    } else {
        Location* l = expr->Emit(cg);
        cg->GenReturn(l);
    }
    return NULL;
}

PrintStmt::PrintStmt(List<Expr*> *a) {    
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
}

Type* PrintStmt::Check(Hashtable<Decl*>* parentST) {
    for(int i = 0; i < args->NumElements(); ++i) {
        Type* t = args->Nth(i)->Check(parentST);
        if(!Type::TypeEquivalence(t, Type::stringType, true) && 
           !Type::TypeEquivalence(t, Type::boolType, true) &&
           !Type::TypeEquivalence(t, Type::intType, true)) {
            ReportError::PrintArgMismatch(args->Nth(i), i + 1, t);
        }
        args->Nth(i)->cachedType = t;
    }
    return NULL;
}

Location* PrintStmt::Emit(CodeGenerator *cg) {
    for(int i = 0; i < args->NumElements(); ++i) {
        Type* t = args->Nth(i)->cachedType;
        Location* l = args->Nth(i)->Emit(cg);
        if(Type::TypeEquivalence(t, Type::stringType, true)) {
            cg->GenBuiltInCall(PrintString, l, NULL);
        } else if (Type::TypeEquivalence(t, Type::boolType, true)) {
            cg->GenBuiltInCall(PrintBool, l, NULL);
        } else if (Type::TypeEquivalence(t, Type::intType, true)) {
            cg->GenBuiltInCall(PrintInt, l, NULL);
        }
    }
    return NULL;
}

SwitchStmt::SwitchStmt(Expr* exp, List<Case*>* cases, Default* def) {
    Assert(exp != NULL && cases != NULL);
    e = exp;
    c = cases;
    d = def;
    e->SetParent(this);
    c->SetParentAll(this);
    if(d != NULL) d->SetParent(this);
}

Type* SwitchStmt::Check(Hashtable<Decl*>* parentST) {
    Type *t_e = e->Check(parentST);
    if(!Type::TypeEquivalence(t_e, Type::intType, true)) 
        ReportError::ArgMismatch(e, 1, t_e, Type::intType);
    for(int i = 0; i < c->NumElements(); ++i) {
        c->Nth(i)->Check(parentST);
    }
    if(d != NULL)
        d->Check(parentST);
    return NULL;
}

Location* SwitchStmt::Emit(CodeGenerator *cg) {
    Location* exprL = e->Emit(cg);
    Location* zeroL = cg->GenLoadConstant(0);
    char* endLabel = cg->NewLabel();
    char* defaultLabel = cg->NewLabel();
    
    for(int i = 0; i < c->NumElements(); i++) {
        Location* myL = c->Nth(i)->GetExpr()->Emit(cg);
        c->Nth(i)->excLabel = cg->NewLabel();
        cg->GenIfZ(cg->GenBinaryOp("==", cg->GenBinaryOp("==", exprL, myL), zeroL), c->Nth(i)->excLabel);
    }
    
    if(d != NULL) {
        cg->GenGoto(defaultLabel);
    } else {
        cg->GenGoto(endLabel);
    }
    
    for(int i = 0; i < c->NumElements(); i++) {
        cg->GenLabel(c->Nth(i)->excLabel);
        c->Nth(i)->exitLabel = endLabel;
        c->Nth(i)->Emit(cg);
    }
    
    if(d != NULL) {
        cg->GenLabel(defaultLabel);
        d->Emit(cg);
    }
    
    cg->GenLabel(endLabel);
    
    return NULL;
}

Case::Case(Expr* expr, List<Stmt*>* statements) {
    Assert(expr != NULL && statements != NULL);
    e = expr;
    s = statements;
    s->SetParentAll(this);
}

Type* Case::Check(Hashtable<Decl*>* parentST) { 
    Type* z = e->Check(parentST);
    if(!Type::TypeEquivalence(z, Type::intType, true)) {
	ReportError::ArgMismatch(e, 0, z, Type::intType);
    }
    for(int i = 0; i < s->NumElements(); i++) {
        s->Nth(i)->Check(parentST);
    }
    return NULL;
}

Location* Case::Emit(CodeGenerator *cg) {
    for(int i = 0; i < s->NumElements(); i++) {
        s->Nth(i)->Emit(cg);
    }
    return NULL;
}

Default::Default(List<Stmt*>* statements) {
    Assert(statements != NULL);
    s = statements;
    s->SetParentAll(this);
}

Type* Default::Check(Hashtable<Decl*>* parentST) { 
    for(int i = 0; i < s->NumElements(); i++) {
        s->Nth(i)->Check(parentST);
    }
    return NULL;
}

Location* Default::Emit(CodeGenerator *cg) {
    for(int i = 0; i < s->NumElements(); i++) {
        s->Nth(i)->Emit(cg);
    }
    return NULL;
}


