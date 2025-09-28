# CRQ-036: Dynamic Prime Flakes

## 1. Problem Statement

The project requires a mechanism to dynamically generate Nix packages based on a programmatic input, specifically to demonstrate the power of Nix's dynamic derivation capabilities. This will serve as a foundational example for more complex dynamic package generation scenarios in the future, such as generating packages for various versions of a library or different configurations of a tool.

## 2. Proposed Solution

Create a new directory `dynamic_prime_flakes` containing a `flake.nix` file. This `flake.nix` will leverage Nix's functional programming features to dynamically generate a set of packages. Each package will correspond to a prime number (e.g., `prime-2`, `prime-3`, `prime-5`, etc.) and will contain a `prime_number.txt` file with the respective prime number as its content.

This approach will:
*   Showcase dynamic package generation using `lib.genAttrs`.
*   Demonstrate the creation of simple derivations using `pkgs.writeTextFile`.
*   Provide a clear, self-contained example of a Nix flake that generates multiple related packages programmatically.

## 3. Scope

**In-Scope:**
*   Creation of the `dynamic_prime_flakes` directory.
*   Creation of a `flake.nix` file within `dynamic_prime_flakes` that dynamically generates packages for a predefined list of prime numbers.
*   Each generated package will produce a `prime_number.txt` file containing the prime number.
*   Integration of this example into the project's documentation (e.g., a tutorial or example section).

**Out-of-Scope:**
*   Implementing a prime number generation algorithm within Nix (the list of primes will be hardcoded for simplicity).
*   Extensive error handling or complex dependency management for these prime packages.
*   Integration of these packages into the main project's `flake.nix` beyond a simple reference for demonstration.

## 4. Technical Details

The `flake.nix` will utilize the `nixpkgs` library and `flake-utils` for common boilerplate. The core logic will involve:

*   Defining an `outputs` function that takes `self` and `nixpkgs` as arguments.
*   Using `nixpkgs.lib.genAttrs` to iterate over a list of prime numbers.
*   For each prime number, a new package will be defined using `pkgs.writeTextFile`. This function will create a derivation that outputs a file (e.g., `prime_number.txt`) with the prime number as its content.
*   The resulting packages will be exposed under `self.packages.${system}`.

Example snippet (conceptual):

```nix
{
  description = "A flake that dynamically generates prime number packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        primes = [ 2 3 5 7 11 13 17 19 23 29 ]; # Hardcoded list of primes
        primePackages = pkgs.lib.genAttrs primes (prime:
          pkgs.writeTextFile {
            name = "prime-${prime}";
            text = "${prime}";
            destination = "/prime_number.txt";
          }
        );
      in
      {
        packages = primePackages;
      }
    );
}
```

## 5. Testing

To verify the successful implementation, the following steps will be performed:

1.  Navigate to the `dynamic_prime_flakes` directory.
2.  Build a specific prime package: `nix build .#prime-7` (or any other prime from the list).
3.  Verify the content of the generated file: `cat result/prime_number.txt`. The output should be `7`.
4.  List all available packages to ensure dynamic generation is working: `nix flake show .`

## 6. Rollback Plan

In case of issues or if the dynamic prime flakes are no longer required, the rollback plan is as follows:

1.  Delete the `dynamic_prime_flakes` directory and all its contents.
2.  Remove any references to `dynamic_prime_flakes` from other `flake.nix` files or documentation.
3.  Run `git clean -fdx` in the project root to ensure all untracked files and directories are removed.
