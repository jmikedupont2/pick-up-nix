# CRQ-XXX: Unimath - Universal Mathematical Expression Representation and Packaging in Nix

## 1. Problem Statement

The current Nix ecosystem lacks a standardized and granular approach to representing, manipulating, and packaging mathematical concepts and expressions. Integrating diverse mathematical libraries and ensuring consistent, reproducible mathematical computations within Nix builds is challenging. There is no clear mechanism to semantically identify and reuse fundamental mathematical entities (e.g., numbers, symbols, operations, theorems) as distinct Nix packages, leading to redundancy and hindering advanced mathematical reasoning within the build system.

## 2. Proposed Solution

Introduce "Unimath," a project aimed at establishing a universal framework for representing mathematical expressions and concepts within Nix. Unimath will leverage principles of semantic hashing and dynamic derivations to:

- Define a canonical representation for mathematical entities (numbers, variables, operators, functions, theorems).
- Convert these entities into semantically hashed Nix packages, enabling fine-grained reuse and traceability.
- Provide tools for parsing, manipulating, and evaluating mathematical expressions within the Nix build system.
- Facilitate the integration of various mathematical libraries and tools (e.g., LaTeX, SymPy, WolframAlpha) by providing a unified Nix-based interface.

## 3. Scope

- Define a formal ontology or schema for mathematical expressions and concepts.
- Develop a parser for common mathematical notation (e.g., LaTeX-like syntax, symbolic expressions) into an internal, canonical representation.
- Implement semantic hashing for mathematical entities, ensuring uniqueness and determinism.
- Create Nix packages for individual mathematical entities and expressions.
- Develop a Nix-based evaluation engine for mathematical expressions.
- Provide bindings or interfaces for integrating external mathematical software.
- Create a CLI for interacting with the Unimath system.

## 4. Technical Details

- **Representation:** Explore existing standards for mathematical representation (e.g., MathML, OpenMath, SymPy's internal representation) and adapt them for a Nix-centric approach.
- **Paths and Hypergraphs:** Each path in Unimath will connect two or more points (mathematical entities) within a hypergraph structure, conceptualized as existing on the surface of a hypersphere, enabling complex relational modeling.
- **Parsing:** Develop parsers for mathematical input, potentially using tools like ANTLR or existing language-specific parsers.
- **Semantic Hashing:** Extend the concepts from `nix-dynamic-pkg-expr-introspector` to mathematical entities, ensuring that semantically equivalent expressions produce the same hash.
- **Nix Package Generation:** Generate derivations for mathematical entities, potentially including their definitions, properties, and evaluation rules.
- **Evaluation Engine:** Implement a secure and reproducible mathematical evaluation engine within Nix, possibly by wrapping existing tools or developing a custom interpreter for a subset of mathematical operations.
- **Integration:** Develop Nix functions and derivations to interface with external mathematical libraries (e.g., Python's SymPy, Haskell's Math libraries).

## 5. Testing Strategy

- **Unit Tests:** Comprehensive tests for parsing, representation, semantic hashing, and Nix package generation of mathematical entities.
- **Property-Based Testing:** Use property-based testing to ensure the correctness of mathematical transformations and evaluations.
- **Integration Tests:** Verify the seamless integration with external mathematical libraries and tools.
- **Reproducibility Tests:** Ensure that mathematical computations are reproducible across different Nix environments.

## 6. Rollback Plan

Unimath will be developed as an independent project. In case of issues, it can be isolated and removed without impacting other core project functionalities. Its integration points will be designed to be optional and easily reversible.

## 7. Dependencies

- `nix-dynamic-pkg-expr-introspector` (potential dependency for semantic hashing infrastructure)
- Nix package manager
- Relevant mathematical libraries (e.g., SymPy, LaTeX, potentially Haskell math libraries)

## 8. Future Considerations

- Develop a graphical user interface (GUI) for visual mathematical expression manipulation.
- Explore applications in formal verification and theorem proving within Nix.
- Integrate with scientific computing workflows and data analysis pipelines.
- Extend to support symbolic differentiation, integration, and equation solving.
- Each mathematical package expression generated will also serve as a lattice query generator for Large Language Models (LLMs).
- Develop a system for semantic mathematical concept discovery and retrieval by converting mathematical text and expressions into emoji strings, and then using cosine similarity to match these emoji strings to find relevant mathematical concepts or code snippets.
