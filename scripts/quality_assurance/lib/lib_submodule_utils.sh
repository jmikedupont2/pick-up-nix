#!/usr/bin/env bash

# Function to get and filter submodule paths
# Usage: get_filtered_submodule_paths <filter_string>
get_filtered_submodule_paths() {
    local filter_string="$1"
    grep "^Entering '" "index/submodules_status.txt" | sed -n "s/^Entering '\(.*\)'$/\1/p" | grep "${filter_string}"
}
