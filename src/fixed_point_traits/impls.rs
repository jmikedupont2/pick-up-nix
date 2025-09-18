// src/fixed_point_traits/impls.rs

use crate::fixed_point_enum::KnowledgeConcept;
use crate::fixed_point_traits::FixedPointAnalysis;
use crate::fixed_point_traits::prime_2::IsDual;
use crate::fixed_point_traits::prime_3::IsTriadic;
use crate::fixed_point_traits::prime_5::IsFiveResonant;
use crate::fixed_point_traits::prime_7::IsSevenResonant;
use crate::fixed_point_traits::prime_11::IsElevenResonant;
use crate::fixed_point_traits::prime_13::IsThirteenResonant;
use crate::fixed_point_traits::prime_17::IsSeventeenResonant;
use crate::fixed_point_traits::prime_19::IsNineteenResonant;

// This file would contain the implementation of FixedPointAnalysis for KnowledgeConcept
// that leverages the prime-resonant traits.
// However, the FixedPointAnalysis trait is already implemented in mod.rs.
// So, this file will instead demonstrate how to *use* these traits for analysis.

impl KnowledgeConcept {
    /// Performs a comprehensive resonance analysis based on prime numbers.
    pub fn perform_resonance_analysis(&self) -> String {
        let mut analysis_results = vec![];

        if self.is_dual() {
            analysis_results.push("Resonates with 2 (Duality/Binary)".to_string());
        }
        if self.is_triadic() {
            analysis_results.push("Resonates with 3 (Triadic)".to_string());
        }
        if self.is_five_resonant() {
            analysis_results.push("Resonates with 5".to_string());
        }
        if self.is_seven_resonant() {
            analysis_results.push("Resonates with 7".to_string());
        }
        if self.is_eleven_resonant() {
            analysis_results.push("Resonates with 11".to_string());
        }
        if self.is_thirteen_resonant() {
            analysis_results.push("Resonates with 13".to_string());
        }
        if self.is_seventeen_resonant() {
            analysis_results.push("Resonates with 17".to_string());
        }
        if self.is_nineteen_resonant() {
            analysis_results.push("Resonates with 19".to_string());
        }

        if analysis_results.is_empty() {
            format!("{} does not explicitly resonate with any of the first 8 primes based on current criteria.", self.describe())
        } else {
            format!("{} resonates with: {}", self.describe(), analysis_results.join(", "))
        }
    }
}
