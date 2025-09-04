#!/usr/bin/env bash
set -euo pipefail
ghc -O2 euclid.hs -o euclid_hs
./euclid_hs "${1:-1000000}"
