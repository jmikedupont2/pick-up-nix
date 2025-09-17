#!/usr/bin/env bash

export HOME=$(mktemp -d)
cargo build --release --target-dir $out/target
