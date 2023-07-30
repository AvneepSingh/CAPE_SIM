#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include <vector>
using namespace llvm;
namespace {
    struct MyLP: public LoopPass {
        static char ID;
        MyLP() : LoopPass(ID) {}
        bool runOnLoop(Loop *L,LPPassManager &LPM) override {
            Function *F = L->getHeader()->getParent();
            Module *M = F->getParent();
            BasicBlock *preheader = L->getLoopPreheader();
            BasicBlock *exit = L->getExitBlock();
            
            FunctionType *FuncType = FunctionType::get(Type::getVoidTy(M->getContext()),false);
            
            Function *Before = (Function*)(M->getOrInsertFunction("before",FuncType).getCallee());
            Function *After = (Function*)(M->getOrInsertFunction("after",FuncType).getCallee());
            
            IRBuilder<> BuilderB(preheader->getTerminator());
            //TerminatorInst *term = BB->getTerminator();
            IRBuilder<> BuilderA(exit->getFirstNonPHI());
            
            BuilderB.CreateCall(Before);
            BuilderA.CreateCall(After);
            
            return true;
        }
        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.addRequired<LoopInfoWrapperPass>();
            AU.setPreservesAll();
        }
    };
}

char MyLP::ID = 0;
static RegisterPass<MyLP> X("tsx", "tsx pass");

