// src/fixed_point_traits/prime_13/mod.rs

use crate::fixed_point_enum::KnowledgeConcept;

/// A trait for concepts that resonate with the number 13.
pub trait IsThirteenResonant {
    /// Checks if the concept exhibits properties related to 13, such as breaking patterns or challenging norms.
    fn is_thirteen_resonant(&self) -> bool;
}

impl IsThirteenResonant for KnowledgeConcept {
    fn is_thirteen_resonant(&self) -> bool {
        match self {
            // Example: A paradigm shift
            KnowledgeConcept::Paradigm { .. } => true,
            // Example: A theory that challenges established understanding
            KnowledgeConcept::Theory { .. } => true,
            _ => false,
        }
    }
}
