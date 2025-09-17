# `git-wrapper`

`git-wrapper` is a Rust library designed to provide a simplified interface for reading and interacting with various Git objects (commits, trees, blobs, and tags) from a Git repository.

## Features

- **`GitItem` Enum**: Represents the different types of Git objects, encapsulating their specific data (e.g., commit ID and message, blob ID and size).
- **`Readable` Trait**: Provides a generic way to read Git objects from a repository given a repository path and an object ID (OID).

## Usage

The primary way to use `git-wrapper` is through the `GitItem::read_from_repo` function, which allows you to fetch a Git object by its ID and interpret it as one of the supported `GitItem` types.

```rust
use git_wrapper::GitItem;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let repo_path = "."; // Path to your Git repository
    let oid = "<your_git_object_id>"; // e.g., a commit hash

    let git_item = GitItem::read_from_repo(repo_path, oid)?;

    match git_item {
        GitItem::Commit(commit) => {
            println!("Commit ID: {}", commit.id);
            println!("Commit Message: {}", commit.message);
        }
        GitItem::Tree(tree) => {
            println!("Tree ID: {}", tree.id);
        }
        GitItem::Blob(blob) => {
            println!("Blob ID: {}", blob.id);
            println!("Blob Size: {}", blob.size);
        }
        GitItem::Tag(tag) => {
            println!("Tag ID: {}", tag.id);
            println!("Tag Target: {}", tag.target);
        }
    }

    Ok(())
}
```

## Development Setup (Nix Flake)

This project includes a Nix flake for a reproducible development environment. This ensures that all developers use the same toolchain and dependencies.

1.  **Navigate to the `git-wrapper` directory:**

    ```bash
    cd wrappers/git-wrapper
    ```

2.  **Enter the development shell:**

    ```bash
    nix develop
    ```

    This command will set up a shell with the correct Rust toolchain (as specified in `rust-toolchain.toml`) and other necessary build inputs.

3.  **Build the project:**

    Once inside the `nix develop` shell, you can build the `git-wrapper` crate using Cargo:

    ```bash
    cargo build
    ```

4.  **Run tests:**

    You can also run the tests for the crate:

    ```bash
    cargo test
    ```

## Project Structure

-   `src/lib.rs`: Contains the core logic of the `git-wrapper` library, including the `GitItem` enum and `Readable` trait implementation.
-   `flake.nix`: Defines the Nix flake for the development environment and package build.
-   `rust-toolchain.toml`: Specifies the Rust toolchain version to be used by the Nix flake.
