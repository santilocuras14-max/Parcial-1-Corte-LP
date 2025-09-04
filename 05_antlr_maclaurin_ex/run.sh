#!/usr/bin/env bash
set -euo pipefail
ANTLR_JAR="${ANTLR_JAR:-antlr-4.13.1-complete.jar}"
java -cp .:"$ANTLR_JAR" Main 'maclaurin(n=10, x=1.5);'
