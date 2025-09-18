// src/fixed_point_traits/prime_2/mod.rs

use crate::fixed_point_enum::KnowledgeConcept;

/// A trait for concepts that exhibit a duality or binary nature.
pub trait IsDual {
    /// Checks if the concept can be meaningfully split into two opposing or complementary parts.
    fn is_dual(&self) -> bool;
}

impl IsDual for KnowledgeConcept {
    fn is_dual(&self) -> bool {
        match self {
            KnowledgeConcept::System { .. } => true, // System can be seen as hardware/software duality
            KnowledgeConcept::Computation { .. } => true, // Input/Output duality
            KnowledgeConcept::Information { .. } => true, // Data/Meaning duality
            KnowledgeConcept::Algorithm { .. } => true, // Problem/Solution duality
            KnowledgeConcept::Data { .. } => true, // Raw/Processed duality
            KnowledgeConcept::FixedPoint { .. } => true, // Convergent/Divergent duality
            KnowledgeConcept::SelfReference { .. } => true, // Self/Other duality
            KnowledgeConcept::Hardware => true, // Hardware/Software duality
            KnowledgeConcept::Software => true, // Hardware/Software duality
            KnowledgeConcept::Input => true, // Input/Output
            KnowledgeConcept::Output => true, // Input/Output
            KnowledgeConcept::True => true, // True/False
            KnowledgeConcept::False => true, // True/False
            KnowledgeConcept::BinaryInstructions => true, // 0/1
            KnowledgeConcept::Mutex => true, // Locked/Unlocked
            KnowledgeConcept::Semaphores => true, // Binary semaphores
            KnowledgeConcept::Thread => true, // Active/Inactive
            KnowledgeConcept::Process => true, // Running/Stopped
            KnowledgeConcept::Equations => true, // Left/Right side of equality
            KnowledgeConcept::Variables => true, // Defined/Undefined
            KnowledgeConcept::Constants => true, // Constant/Variable
            KnowledgeConcept::DeadCodeElimination => true, // Dead/Live code
            KnowledgeConcept::ConstantFolding => true, // Compile-time/Runtime
            KnowledgeConcept::LoopOptimizations => true, // Optimized/Unoptimized
            KnowledgeConcept::RegisterAllocation => true, // Allocated/Unallocated
            KnowledgeConcept::LexicalAnalysis => true, // Characters/Tokens
            KnowledgeConcept::SemanticAnalysis => true, // Syntax/Semantics
            KnowledgeConcept::CodeGeneration => true, // Source/Target
            KnowledgeConcept::ControlFlow => true, // Conditional branches (if/else)
            KnowledgeConcept::ChurchTuringThesis => true, // Computable/Uncomputable
            KnowledgeConcept::IntermediateRepresentation => true, // High-level/Low-level
            KnowledgeConcept::ConcurrencyIssues => true, // Correct/Incorrect results
            KnowledgeConcept::MathematicalModel => true, // Abstract/Real-world
            KnowledgeConcept::Computability => true, // Solvable/Unsolvable
            KnowledgeConcept::DeclarativeProgramming => true, // What/How
            KnowledgeConcept::MachineCode => true, // Binary/Human-readable
            _ => false,
        }
    }
}
