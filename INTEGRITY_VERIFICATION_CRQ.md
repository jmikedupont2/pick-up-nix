# Change Request: Component Integrity Verification

**CRQ ID:** CRQ-002
**Applicable Standards:** ISO 9001, ITILv4, C4 Model, GMP, Six Sigma

---

## 1.0 Change Description (ITIL)

This document proposes a **Standard Change** to implement a new service: **Component Integrity Verification**. This service will provide automated, cryptographic proof of integrity for all third-party source code repositories (submodules) vendored into this project.

## 2.0 Justification (Six Sigma)

To achieve a Six Sigma level of quality and security, the risk of unverified or altered third-party code must be eliminated. This change directly addresses this potential cause of defects by introducing a robust, automated verification process, thus improving the security and reproducibility of the entire system.

## 3.0 Proposed Change: The "Integrity Smart Contract"

We will model the integrity of each component as a "Smart Contract." This provides a clear, verifiable agreement about the state of the code.

### 3.1 The Contract Terms (GMP)
The "Integrity Smart Contract" is a set of rules that a repository instance must adhere to. The primary term is:

*   **Verifiable Integrity:** A repository's source code, when processed by the Nix hashing algorithm, MUST produce a specific, predetermined cryptographic hash (a NAR hash).

### 3.2 The Contract Instance
Each external repository added as a `git submodule` to this project is considered an **Instance** of this contract.

### 3.3 The Oracle / Auditor (ISO 9001)
The `nix flake check` command serves as the automated, impartial **Auditor** of the contract. When executed, it cryptographically verifies that the terms of the contract have been met for all instances. Any deviation is a **Non-conformance** and will cause the check to fail.

## 4.0 Implementation Details (C4 Model)

1.  **Component:** A new Nix function will be created. This function will take a repository path as input and produce a Nix derivation whose output is the NAR hash of that path. This is the core **Component** of the new service.
2.  **Process:**
    *   When a new submodule is added, it is registered in the `flake.nix`.
    *   Its hash derivation is added to the `flake.nix#checks` attribute set. This is the act of deploying the "smart contract".
    *   A badge is added to the main `README.md` for the submodule. The badge's URL will point to the `flake.nix` file itself, providing **Traceability** and public evidence of the integrity contract.

## 5.0 Validation Plan (ISO 9001)

This change will be considered **Validated** once:
1.  The integrity check is implemented for the first instance (`Escaped-RDFa/namespace`).
2.  The `nix flake check` command successfully executes and verifies the hash.
3.  The corresponding badge is added to the `README.md`.
