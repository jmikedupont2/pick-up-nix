# Function to run nix build and log output
# Usage: run_nix_build_and_log <flake_dir> <flake_attr_path> <log_file>
run_nix_build_and_log() {
    local flake_dir="$1"
    local flake_attr_path="$2"
    local log_file="$3"

    echo "Building flake at '${flake_dir}' with attribute path '${flake_attr_path}'..." | tee -a "$log_file"
    nix build "${flake_dir}${flake_attr_path}" 2>&1 | tee -a "$log_file"
    echo "Finished building flake at '${flake_dir}' with attribute path '${flake_attr_path}'" | tee -a "$log_file"
}
