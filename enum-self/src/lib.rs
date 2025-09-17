// This is the main library file for the `enum-self` crate.
// It re-exports all the modules that define the project structure enums.

pub mod project_items;
pub mod config;
pub mod documentation;
pub mod tools;
pub mod github;
pub mod nix_config;
pub mod packages;
pub mod submodule_flakes;
pub mod nixpacks;
pub mod memetic_code;
pub mod etc;
pub mod experiments;
pub mod file_analyzer;
pub mod home;
pub mod json_to_memes_extractor;
pub mod logs;
pub mod manifests;
pub mod new;
pub mod pick_up_nix_cli;
pub mod prompts;
pub mod qa;
pub mod source;
pub mod src_dir;
pub mod task;
pub mod tasks;
pub mod test_flake;
pub mod vendor;