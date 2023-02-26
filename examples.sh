#!/usr/bin/env bash
# Used to generate the bors.toml file
set -euo pipefail

cd "$(dirname "$0")"

# Get the system tuple for later
system=$(nix eval --raw --impure --expr 'builtins.currentSystem')

# Generate the bors.toml from the config
nix build ".#checks.$system.testExamples.passthru.examples"

# Copy
rm -f ./examples/* || true
cp --no-preserve=mode ./result/* ./examples
