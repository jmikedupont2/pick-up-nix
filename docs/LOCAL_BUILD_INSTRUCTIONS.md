## Local Build and Test Instructions

This document provides instructions on how to build and test the `pick-up-nix` project locally.

### 1. Prerequisites

*   **Nix Installation:** Ensure you have Nix installed on your system.
*   **Nix Flakes Enabled:** Make sure Nix flakes are enabled. You can enable them by adding `experimental-features = nix-command flakes` to your `nix.conf` file (usually located at `/etc/nix/nix.conf` or `~/.config/nix/nix.conf`).

### 2. Clone the Repository (if you haven't already)

```bash
git clone https://github.com/jmikedupont2/pick-up-nix.git
cd pick-up-nix
```

### 3. Run the Test Script

A script named `build_and_report.sh` is located in the project's root directory. This script automates the build process and generates a report.

To run it, navigate to the project root and execute:

```bash
bash ./build_and_report.sh
```

**What the script does:**

*   It will attempt to build the Android configuration (currently commented out in the script).
*   It will attempt to build the PC configuration (also currently commented out in the script).
*   It logs the output of these builds (including any errors) to a file named `qa_build_report.txt` in the project root.
*   The script itself will report "QA build process completed" and exit with a status of 0 if it runs without internal errors.

**To see the detailed build results, check the `qa_build_report.txt` file.**

### 4. Building Specific Configurations Directly (Advanced)

If you want to build the configurations directly without using the script, you can use the following `nix build` commands:

*   **Android Configuration (currently failing due to `nix-on-droid` issues):**

    ```bash
nix build .#nixOnDroidConfigurations.android.config.system.build.toplevel --system aarch64-linux --impure
    ```
    *Note: This command is expected to fail due to the "attribute not found" error, as discussed previously.*

*   **PC Configuration (currently failing due to incomplete NixOS configuration):**

    ```bash
nix build .#nixosConfigurations.desktop.config.system.build.toplevel
    ```
    *Note: This command is expected to fail due to missing `fileSystems` and `boot.loader.grub.devices` definitions, as discussed previously.*
