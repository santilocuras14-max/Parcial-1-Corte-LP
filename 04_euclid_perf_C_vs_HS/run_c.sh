#!/usr/bin/env bash
set -euo pipefail
gcc -O2 -Wall euclid.c -o euclid_c
./euclid_c "${1:-1000000}"
