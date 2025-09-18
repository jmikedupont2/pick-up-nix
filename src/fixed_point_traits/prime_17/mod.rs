// src/fixed_point_traits/prime_17/mod.rs

use crate::fixed_point_enum::KnowledgeConcept;

/// A trait for concepts that resonate with the number 17.
pub trait IsSeventeenResonant {
    /// Checks if the concept exhibits properties related to 17, such as being distinct or irreducible.
    fn is_seventeen_resonant(&self) -> bool;
}

impl IsSeventeenResonant for KnowledgeConcept {
    fn is_seventeen_resonant(&self) -> bool {
        match self {
            // Example: A fundamental, irreducible concept
            KnowledgeConcept::Concept => true,
            // Example: A unique property or characteristic
            KnowledgeConcept::Property => true,
            _ => false,
        }
    }
}
