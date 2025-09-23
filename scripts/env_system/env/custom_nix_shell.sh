#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: custom_nix_shell.sh
#
#         USAGE: ./scripts/env/custom_nix_shell.sh
#
#   DESCRIPTION: This script sets several environment variables related to Nix
#                and then launches a `nix-shell`. It seems to be a custom
#                shell setup script.
#
# ==============================================================================

export HOSTNAME=introspector
export HOME=/mnt/data1/nix
export NIX_CONF=mnt/data1/nix/time/2024/02/23/nix-config/
export NIX_PATH=/mnt/data1/nix/.nix-defexpr/channels/:hm-config=mnt/data1/nix/time/2024/02/23/nix-config/config/home.nix:home-manager=/mnt/data1/nix/time/2024/02/23/nix-config/home-manager:localconfig=/mnt/data1/nix/time/2024/02/23/nix-config/config/${HOSTNAME}.nix:nixpkgs=/mnt/data1/nix/time/2024/02/23/nix-config/nixpkgs:ssh-auth-sock=/mnt/data1/nix/.config/gnupg/S.gpg-agent.ssh:ssh-config-file=/mnt/data1/nix/.ssh/config
nix-shell