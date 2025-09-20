# Nix Store Size Management Best Practices

## Date: 2025-09-19

## 1. Problem: Growing Nix Store Size

The Nix package manager, while powerful for reproducibility and immutability, can lead to a rapidly growing Nix store (`/nix/store`). This is due to:
*   **Multiple Derivations:** Each unique build configuration (even minor changes to inputs) results in a new derivation in the store.
*   **Duplicate Versions:** Different projects or flakes might inadvertently pull in slightly different versions of the same dependency, leading to multiple copies in the store.
*   **Garbage:** Unused or unreferenced derivations accumulate over time.

A large Nix store consumes significant disk space and can impact system performance.

## 2. Best Practices for Size Management

### 2.1. Regular Garbage Collection

**`nix-collect-garbage -d`**: This is the primary tool for freeing up space. It deletes all store paths that are not reachable from any registered garbage collector root.
*   `-d` (delete): Deletes the unreachable paths.
*   **Recommendation:** Run regularly, especially after major updates or when disk space is low.

### 2.2. Optimizing Flake Inputs and Avoiding Duplication

*   **Standardize `nixpkgs` Inputs:** Ensure all flakes and projects within the repository use the same `nixpkgs` input (e.g., `github:NixOS/nixpkgs/nixos-24.05`). This prevents multiple versions of core packages from being pulled in.
*   **Use `follows` for Internal Inputs:** For internal flake inputs (e.g., sub-flakes), use `follows` to ensure they track the same `nixpkgs` as the root flake.
    ```nix
    # Example in root flake.nix
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
      my-sub-flake.url = "./path/to/my-sub-flake";
      my-sub-flake.follows = "nixpkgs"; # Ensure it uses the same nixpkgs
    };
    ```
*   **Content-Addressable Store (CAS):** Nix's CAS ensures that if two derivations produce identical outputs, they will share the same store path. While this helps, it doesn't prevent different *inputs* from leading to different derivations, even if the final binaries are similar.

### 2.3. Building a Single Foundation

Structure your `flake.nix` files to build upon a common, stable foundation.
*   **Minimal Root Flake:** The top-level `flake.nix` should be as minimal as possible, primarily defining the core `nixpkgs` and a basic `devShell`.
*   **Modular Tools:** Each tool or component should define its own `flake.nix` that builds upon this common foundation, importing `nixpkgs` from the root flake.
*   **Explicit Dependencies:** Clearly define all dependencies in each `flake.nix` and `Cargo.toml` (for Rust projects).

### 2.4. `nix-store --optimise`

This command attempts to find identical files in the Nix store and replace them with hard links, thus deduplicating content and saving space.
*   **Recommendation:** Run periodically, especially after large builds or garbage collection. It can be time-consuming.
    ```bash
    nix-store --optimise
    ```

## 3. Monitoring Nix Store Size

Regularly monitor your Nix store size to identify potential issues early.
*   **`nix-store --du`**: Shows disk usage of store paths.
*   **`nix-store -q --size-closure /nix/store/...`**: Shows the size of the closure (all dependencies) of a specific path.
*   **`df -h /nix/store`**: Basic disk usage report for the Nix store mount point.

## 4. CRQ Association

This document is directly associated with CRQ-017: Nix-First Development and Immutable State Policy, as effective Nix store management is crucial for maintaining a stable and efficient development environment.
