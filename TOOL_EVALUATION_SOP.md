# SOP: Third-Party Tool Evaluation & Integration

**Document ID:** PI-SOP-002, Rev 1.0
**Applicable Standards:** ISO 9001, ITILv4, C4 Model, GMP, Six Sigma, Agile

---

## 1.0 Purpose (ISO 9001)

To define a controlled, repeatable, and traceable process for searching, evaluating, and vendorizing third-party software components. This ensures new tools meet stringent quality requirements (**GMP**) before being integrated into the primary development environment, thus minimizing project risk and defects (**Six Sigma**).

## 2.0 Scope

This SOP applies to all new command-line tools and libraries being considered for use in the `nix-introspector` project. The procedure is initiated via the `evaluate` command.

## 3.0 The `evaluate` Command

The entire evaluation process is orchestrated by a new command added to our root `nix-introspector` tool.

*   **User Story (Agile):** As a Developer, I want to evaluate a new tool from a git repository so that I can test its functionality in a safe, isolated environment and record the results for my team.
*   **Invocation:** `cargo run -- evaluate <git-url-of-tool>`

## 4.0 Procedure (ITIL/GMP)

The `evaluate` command automates the following lifecycle, which represents a standard **Change (ITIL)** to the project's toolchain.

### 4.1 Step 1: Initiation (Change Request)

A Developer identifies a candidate tool (e.g., `github:nixos/statix`). The process is initiated by running:
`cargo run -- evaluate github:nixos/statix`

### 4.2 Step 2: Sandbox Provisioning (Nix)

The command automates the creation of an isolated experimental environment.
1.  A new directory is created: `experiments/<tool-name>/`.
2.  A new `flake.nix` is generated inside this directory.
3.  This flake defines a `devShell` that includes the tool being evaluated, using the provided URL as a flake input. This creates a perfect, ephemeral sandbox for the experiment, ensuring **Process Control (Six Sigma)**.

### 4.3 Step 3: Vendorization (Traceability)

For traceability and reference, the command adds the tool's repository as a git submodule under `vendor/external/<tool-name>`. This creates a permanent record of the exact version evaluated (**ISO 9001**).

### 4.4 Step 4: Test Case Preparation (GMP)

The command populates the experiment directory with a standardized set of test cases.
1.  A `test_cases/` subdirectory is created.
2.  Known "good" code samples are copied into it.
3.  Known "bad" code samples (e.g., our currently broken `home/*.nix` files) are also copied. This constitutes the material for the **Validation** process.

### 4.5 Step 5: Execution & Measurement (Six Sigma)

The Developer enters the sandboxed shell to perform the evaluation.
1.  `nix develop ./experiments/<tool-name>`
2.  The tool is run against the test cases (e.g., `statix check ./test_cases/bad_code.nix`).
3.  All output (stdout, stderr) and the exit code are captured. This is the **Measure** phase of DMAIC.

### 4.6 Step 6: Structured Reporting (ISO 9001)

The results must be documented in a structured report located at `experiments/<tool-name>/EVALUATION_REPORT.md`. The report must contain:
*   **Control Information:** Tool Name, Version, Git URL, Evaluation Date.
*   **Test Case:** A description of the test (e.g., "Linter check on file with known syntax error").
*   **Specification:** The expected outcome (e.g., "Linter should exit with a non-zero status and report a syntax error").
*   **Result:** The actual, captured outcome.
*   **Analysis (CAPA):** A description of any **Non-conformance**. If the tool failed, a **Corrective Action** might be to reject the tool. If it succeeded, the **Preventive Action** is its adoption.
*   **Decision:** A formal recommendation (Approve/Reject) for integrating the tool.

### 4.7 Step 7: Closure (ITIL)
Once the report is complete, the evaluation is considered finished, and the **Change Request** is closed. The experimental directory can be archived.
