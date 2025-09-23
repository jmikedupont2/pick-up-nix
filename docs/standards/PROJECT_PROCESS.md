# Project Process & Quality Plan: Nix-Introspector Initiative

**Document ID:** PI-SOP-001, Rev 1.0
**Applicable Standards:** ISO 9001, ITILv4, C4 Model, GMP, Six Sigma, Extreme Programming, Agile

---

## 1.0 Standard Operating Procedure (SOP): `observe` Command

### 1.1 User Story (Agile)
As a Nix Developer, I want to run an `observe` command so that I can get a unified Abstract Syntax Tree (AST) representation of all source code in the project, enabling deeper analysis and transformation.

### 1.2 Process Definition (ISO 9001)
This SOP defines the validated procedure for the `observe` command, which is a critical **Component (C4)** of the Nix-Introspector **Service (ITIL)**. The procedure ensures a consistent, repeatable parsing process with a defect rate approaching **Six Sigma** levels. All steps are traceable and subject to quality audit.

### 1.3 System Context Diagram (C4)
This diagram shows the high-level context of the `observe` command's operation.

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml
Person(Developer, "Developer")
System(Introspector, "Nix Introspector", "Parses and analyzes Nix/Guix codebases")
SystemDb(SourceCode, "Code Repository", "Git repository with Nix files, Cargo files, etc.")
Rel(Developer, Introspector, "Runs 'observe' command")
Rel(Introspector, SourceCode, "Reads files from")
@enduml
```

### 1.4 Procedure Steps (GMP/ITIL)
1.  **Initiation:** The Developer initiates the process by executing `cargo run -- observe`. This constitutes a standard **Change Request (ITIL)** to the system state (from un-parsed to parsed).
2.  **Input Validation (Six Sigma):** The `observe` command shall first validate its inputs. The primary input is the project's root directory. The process **Control Plan** requires that the existence of the directory is confirmed before proceeding.
3.  **Execution (Extreme Programming):** The core logic, developed via **Test-Driven Development** and **Pair Programming**, recursively scans the directory for all recognized source files (`.nix`, `Cargo.toml`, etc.). The design is kept as **Simple** as possible.
4.  **Processing (GMP):** Each file is treated as a batch. The `rnix-parser` component **(C4)** processes the raw material (source text) into a finished good (AST). Each parsing operation is logged with full **Traceability**.
5.  **Output:** The command outputs a unified AST (in `sexpr` format) to `stdout`. This is the specified, validated output for this process.
6.  **Deviation Handling (ISO 9001):** Any file that fails to parse is a **Non-conformance**. The SOP dictates that the file path and parsing error are logged as an **Incident (ITIL)**, and a **Corrective and Preventive Action (CAPA)** is initiated to fix the source file or improve the parser.

---

## 2.0 Change & Quality Request (CRQ): Project Inception

### 2.1 Change Description (ITIL)
This CRQ authorizes the initiation of the Nix-Introspector project. This is a strategic change to introduce a new **Service** for managing Nix/Guix development, moving from a manual to an automated, introspective process.

### 2.2 Business Case (Agile)
We are building the Nix-Introspector to reduce the time and complexity of managing Nix configurations. This will increase developer **Velocity** and reduce errors. We will start with a **Minimum Viable Product (MVP)** consisting of the `observe` command and iterate based on **Customer Feedback**.

### 2.3 DMAIC Framework (Six Sigma)
*   **Define:** The problem is that managing Nix code is complex and error-prone. The **Customer** is the Nix/Guix developer.
*   **Measure:** We will measure the current process via metrics like time-to-debug and number of configuration errors.
*   **Analyze:** The root cause is a lack of introspection tools and the inherent complexity of the Nix language.
*   **Improve:** We will improve the process by developing the `nix-introspector` tool.
*   **Control:** We will control the improved process by integrating the tool into a CI pipeline, monitored by this quality plan.

### 2.4 Architectural Approach (C4)
The system will be designed as a single **Container** (a command-line application) named `nix-inspector`. This container will be composed of several **Components** (e.g., `NixParser`, `GuixTranslator`, `AstAggregator`). The architecture will be documented and reviewed iteratively. All components, including third-party vendorized tools, will undergo a rigorous nixification process to ensure reproducibility and traceability.

### 2.5 Quality & Compliance Statement (GMP/ISO 9001)
This project will be developed in accordance with GMP principles for software development. All code will be version-controlled, all changes will be documented in a change log, and all releases will be **Validated** against a predefined set of user acceptance tests. This document serves as the top-level **Quality Manual** for the project.
