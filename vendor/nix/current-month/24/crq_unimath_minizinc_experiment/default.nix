# default.nix
let
  # Concept values (from unimath_crq_data.dzn)
  unimath_concept = 101;
  math_expr_concept = 103;
  nix_pkg_concept = 107;
  semantic_hash_concept = 109;
  hypergraph_concept = 113;
  hypersphere_concept = 127;
  llm_concept = 131;

  # A large prime for divisibility check
  large_prime = 17;

  # Calculate CRQ number as a sum of concept values
  calculated_crq_number = unimath_concept + math_expr_concept + nix_pkg_concept +
                          semantic_hash_concept + hypergraph_concept +
                          hypersphere_concept + llm_concept;

  # Check divisibility
  is_divisible = (calculated_crq_number % large_prime) == 0;

in
# Output the calculated CRQ number and divisibility status
if is_divisible
then "Calculated CRQ Number: ${toString calculated_crq_number} (Divisible by ${toString large_prime})"
else "Calculated CRQ Number: ${toString calculated_crq_number} (NOT Divisible by ${toString large_prime})"
