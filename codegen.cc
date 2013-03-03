/* File: codegen.cc
 * ----------------
 * Implementation for the CodeGenerator class. The methods don't do anything
 * too fancy, mostly just create objects of the various Tac instruction
 * classes and append them to the list.
 */

#include "codegen.h"
#include <string.h>
#include "tac.h"
#include "mips.h"

CodeGenerator::CodeGenerator()
{
  code = new List<Instruction*>();
  varLocs = new List<Hashtable<Location *>*>();
}

void CodeGenerator::OptimizeIR()
{
    // Identify Basic Blocks
    // Instructions that signify the end of a basic block inclusive: IfZ, Goto, Return, 
    // Instrucitons that signify the end of a basic block exclusive: BeginFunc, EndFunc, Label, VTable
    
    List<Instruction*> *finalOpt = new List<Instruction*>();
    List<Instruction*> *currBB = new List<Instruction*>();
    bool endOfBasicBlock = false;
    Instruction* LastInstruction = NULL;

    for(int i = 0; i < code->NumElements()  ; ++i) {
        if(dynamic_cast<IfZ*>(code->Nth(i)) != NULL ||
           dynamic_cast<Goto*>(code->Nth(i)) != NULL ||
           dynamic_cast<Return*>(code->Nth(i)) != NULL) {
             currBB->Append(code->Nth(i));
             endOfBasicBlock = true;
        } else if (dynamic_cast<BeginFunc*>(code->Nth(i)) ||
                   dynamic_cast<EndFunc*>(code->Nth(i)) ||
                   dynamic_cast<Label*>(code->Nth(i)) ||
                   dynamic_cast<VTable*>(code->Nth(i))) {
             LastInstruction = code->Nth(i);
             endOfBasicBlock = true;
        } else {
            currBB->Append(code->Nth(i));
        }

        if(endOfBasicBlock) {
            Optimize_CSER(currBB);
            Optimize_CP(currBB);
            Optimize_LA(currBB);
            
            for (int i = 0; i < currBB->NumElements(); i++)
                finalOpt->Append(currBB->Nth(i));

            if(LastInstruction != NULL)
                finalOpt->Append(LastInstruction);

            LastInstruction = NULL;
            delete currBB;
            currBB = new List<Instruction*>();
            endOfBasicBlock = false;
        }
    }
    
    delete code;
    code = finalOpt;
}

typedef struct CSER_binOps {
    Location* dst;
    Location* op1;
    BinaryOp::OpCode opc;
    Location *op2;
} CSER_binOps;

void CodeGenerator::Optimize_CSER(List<Instruction*>* bb) {
    List<CSER_binOps*>* l = new List<CSER_binOps*>();

    for(int i = 0; i < bb->NumElements(); ++i) {
        if(Assign *ag = dynamic_cast<Assign*>(bb->Nth(i))) {
            for(int j = 0; j < l->NumElements(); ++j) {
                if((*(ag->dst) == *(l->Nth(j)->op1)) || 
                   ((l->Nth(j)->op2 != NULL) && *(ag->dst) == *(l->Nth(j)->op2)) || 
                   *(ag->dst) == *(l->Nth(j)->dst)) {
                    l->RemoveAt(j);
                    --j;
                    continue; 
                }
            }
            
            Location* newSrc = NULL;
            
            for(int j = 0; j < l->NumElements(); ++j) {
                if(l->Nth(j)->opc != BinaryOp::InvalidOpCode) continue;
                if(*(ag->src) == *(l->Nth(j)->dst)) {
                    bb->RemoveAt(i);
                    newSrc = l->Nth(j)->op1;
                    bb->InsertAt(new Assign(ag->dst, l->Nth(j)->op1), i);
                    break;
                }
            }
            
            if(newSrc == NULL) {
                CSER_binOps* tmp = new CSER_binOps();
                tmp->dst = ag->dst;
                tmp->op1 = ag->src;
                tmp->op2 = NULL;
                tmp->opc = BinaryOp::InvalidOpCode;
                l->Append(tmp);
            } else {
                CSER_binOps* tmp = new CSER_binOps();
                tmp->dst = ag->dst;
                tmp->op1 = newSrc;
                tmp->op2 = NULL;
                tmp->opc = BinaryOp::InvalidOpCode;
                l->Append(tmp);
            }
            
        } else if(BinaryOp *a = dynamic_cast<BinaryOp *>(bb->Nth(i))) {
            for(int j = 0; j < l->NumElements(); ++j) {
                if(*(a->GetDst()) == *(l->Nth(j)->op1) || 
                   ((l->Nth(j)->op2 != NULL) && *(a->GetDst()) == *(l->Nth(j)->op2)) || 
                   *(a->GetDst()) == *(l->Nth(j)->dst)) {
                    l->RemoveAt(j);
                    --j;
                    continue;
                }
            }
            
            Location* newSrc = NULL;
            
            for(int j = 0; j < l->NumElements(); ++j) {
                if(*(a->GetOp1()) == *(l->Nth(j)->op1) && 
                   l->Nth(j)->op2 != NULL && 
                   *(a->GetOp2()) == *(l->Nth(j)->op2) && 
                   (a->GetOpCode()) == (l->Nth(j)->opc)) {
                    bb->RemoveAt(i);
                    newSrc = l->Nth(j)->dst;
                    bb->InsertAt(new Assign(a->GetDst(), l->Nth(j)->dst) , i);
                    break;
                }
            }
            
            if(newSrc == NULL) {
                CSER_binOps* tmp = new CSER_binOps();
                tmp->dst = a->GetDst();
                tmp->op1 = a->GetOp1();
                tmp->op2 = a->GetOp2();
                tmp->opc = a->GetOpCode();
                l->Append(tmp);
            } else {
                CSER_binOps* tmp = new CSER_binOps();
                tmp->dst = a->GetDst();
                tmp->op1 = newSrc;
                tmp->op2 = NULL;
                tmp->opc = BinaryOp::InvalidOpCode;
                l->Append(tmp);
            }
        }
    }
    for(int j = 0; j < l->NumElements(); ++j) 
        delete l->Nth(j);
    delete l;
}

typedef struct AssignStmt {
    Location* dst;
    Location* src;
} AssignStmt;

void CodeGenerator::Optimize_CP(List<Instruction*>* bb) {
    List<AssignStmt*>* l = new List<AssignStmt*>();

    for(int i = 0; i < bb->NumElements(); ++i) {
        Assign* ag    = dynamic_cast<Assign*>(bb->Nth(i));
        BinaryOp* bin = dynamic_cast<BinaryOp*>(bb->Nth(i));

        for(int j = 0; j < l->NumElements(); ++j) {
            if(ag != NULL) {
                if(*(l->Nth(j)->src) == *(ag->dst) || *(l->Nth(j)->dst) == *(ag->dst)) {
                    l->RemoveAt(j);
                    --j;
                    continue;
                }
            } else if (bin != NULL) {
                if(*(l->Nth(j)->src) == *(bin->GetDst()) || *(l->Nth(j)->dst) == *(bin->GetDst())) {
                    l->RemoveAt(j);
                    --j;
                    continue;
                }
            }
        }
        
        for(int j = 0; j < l->NumElements(); ++j) {
            if(ag != NULL) {
                if(*(ag->src) == *(l->Nth(j)->dst)) {
                    bb->RemoveAt(i);
                    bb->InsertAt(new Assign(ag->dst, l->Nth(j)->src), i);
                    break;
                }
            } else if (bin != NULL) {
                if(*(bin->GetOp1()) == *(l->Nth(j)->dst)) {
                    bb->RemoveAt(i);
                    bb->InsertAt(new BinaryOp(bin->GetOpCode(), bin->GetDst(), l->Nth(j)->src, bin->GetOp2()), i);
                    bin = dynamic_cast<BinaryOp*>(bb->Nth(i));
                    continue;
                } else if(*(bin->GetOp2()) == *(l->Nth(j)->dst)) {
                    bb->RemoveAt(i);
                    bb->InsertAt(new BinaryOp(bin->GetOpCode(), bin->GetDst(), bin->GetOp1(), l->Nth(j)->src), i);
                    bin = dynamic_cast<BinaryOp*>(bb->Nth(i));
                    continue;
                }
            } else if (PushParam* pp = dynamic_cast<PushParam*>(bb->Nth(i))) {
                if(*(pp->GetParam()) == *(l->Nth(j)->dst)) {
                    bb->RemoveAt(i);
                    bb->InsertAt(new PushParam(l->Nth(j)->src), i);
                    break;
                }
            }
        }
        
        ag = dynamic_cast<Assign*>(bb->Nth(i));
        if(ag != NULL) {
            AssignStmt* z = new AssignStmt();
            z->dst = ag->dst;
            z->src = ag->src;
            l->Append(z);
        }
    }
    
    for(int i = 0; i < l->NumElements(); ++i)
        delete l->Nth(i);
    delete l;
}

void CodeGenerator::Optimize_LA(List<Instruction*>* bb) {
    for(int i = bb->NumElements() - 1; i >= 0; --i) {
        
    }
}

char *CodeGenerator::NewLabel()
{
  static int nextLabelNum = 0;
  char temp[10];
  sprintf(temp, "_L%d", nextLabelNum++);
  return strdup(temp);
}

Location *CodeGenerator::GenGlobalVar(const char* name) {
  static int nextGlobalOffset;
  Location *result = new Location(gpRelative, nextGlobalOffset, name);
  nextGlobalOffset += 4;
  return result;
}

Location *CodeGenerator::GenTempVar()
{
  static int nextTempNum;
  char temp[10];
  sprintf(temp, "_tmp%d", nextTempNum++);
  Location *result = GetNewLocationOnStack(temp);

  Assert(result != NULL);
  return result;
}

Location *CodeGenerator::GetNewLocationOnStack(const char* name) {
  Location* result = new Location(fpRelative, (this->currentStackSize) * (-4) + OffsetToFirstLocal, name);
  this->currentStackSize++;
  return result;
}

 
Location *CodeGenerator::GenLoadConstant(int value)
{
  Location *result = GenTempVar();
  code->Append(new LoadConstant(result, value));
  return result;
}

Location *CodeGenerator::GenLoadConstant(const char *s)
{
  Location *result = GenTempVar();
  code->Append(new LoadStringConstant(result, s));
  return result;
} 

Location *CodeGenerator::GenLoadLabel(const char *label)
{
  Location *result = GenTempVar();
  code->Append(new LoadLabel(result, label));
  return result;
} 


void CodeGenerator::GenAssign(Location *dst, Location *src)
{
  code->Append(new Assign(dst, src));
}


Location *CodeGenerator::GenLoad(Location *ref, int offset)
{
  Location *result = GenTempVar();
  code->Append(new Load(result, ref, offset));
  return result;
}

void CodeGenerator::GenStore(Location *dst, Location *src, int offset)
{
  code->Append(new Store(dst, src, offset));
}


Location *CodeGenerator::GenBinaryOp(const char *opName, Location *op1, Location *op2)
{
  Location *result = GenTempVar();
  code->Append(new BinaryOp(BinaryOp::OpCodeForName(opName), result, op1, op2));
  return result;
}


void CodeGenerator::GenLabel(const char *label)
{
  code->Append(new Label(label));
}

void CodeGenerator::GenIfZ(Location *test, const char *label)
{
  code->Append(new IfZ(test, label));
}

void CodeGenerator::GenGoto(const char *label)
{
  code->Append(new Goto(label));
}

void CodeGenerator::GenReturn(Location *val)
{
  code->Append(new Return(val));
}


BeginFunc *CodeGenerator::GenBeginFunc()
{
  BeginFunc *result = new BeginFunc;
  this->currentStackSize = 0;
  code->Append(result);
  return result;
}

void CodeGenerator::GenEndFunc()
{
  code->Append(new EndFunc());
}

void CodeGenerator::GenPushParam(Location *param)
{
  code->Append(new PushParam(param));
}

void CodeGenerator::GenPopParams(int numBytesOfParams)
{
  Assert(numBytesOfParams >= 0 && numBytesOfParams % VarSize == 0); // sanity check
  if (numBytesOfParams > 0)
    code->Append(new PopParams(numBytesOfParams));
}

Location *CodeGenerator::GenLCall(const char *label, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new LCall(label, result));
  return result;
}

Location *CodeGenerator::GenACall(Location *fnAddr, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new ACall(fnAddr, result));
  return result;
}
 
 
static struct _builtin {
  const char *label;
  int numArgs;
  bool hasReturn;
} builtins[] =
 {{"_Alloc", 1, true},
  {"_ReadLine", 0, true},
  {"_ReadInteger", 0, true},
  {"_StringEqual", 2, true},
  {"_PrintInt", 1, false},
  {"_PrintString", 1, false},
  {"_PrintBool", 1, false},
  {"_Halt", 0, false}};

Location *CodeGenerator::GenBuiltInCall(BuiltIn bn,Location *arg1, Location *arg2)
{
  Assert(bn >= 0 && bn < NumBuiltIns);
  struct _builtin *b = &builtins[bn];
  Location *result = NULL;

  if (b->hasReturn) result = GenTempVar();
                // verify appropriate number of non-NULL arguments given
  Assert((b->numArgs == 0 && !arg1 && !arg2)
	|| (b->numArgs == 1 && arg1 && !arg2)
	|| (b->numArgs == 2 && arg1 && arg2));
  if (arg2) code->Append(new PushParam(arg2));
  if (arg1) code->Append(new PushParam(arg1));
  code->Append(new LCall(b->label, result));
  GenPopParams(VarSize*b->numArgs);
  return result;
}


void CodeGenerator::GenVTable(const char *className, List<const char *> *methodLabels)
{
  code->Append(new VTable(className, methodLabels));
}


void CodeGenerator::DoFinalCodeGen()
{
  if (IsDebugOn("tac")) { // if debug don't translate to mips, just print Tac
    for (int i = 0; i < code->NumElements(); i++)
	code->Nth(i)->Print();
   }  else {
     Mips mips;
     mips.EmitPreamble();
     for (int i = 0; i < code->NumElements(); i++)
	 code->Nth(i)->Emit(&mips);
  }
}


