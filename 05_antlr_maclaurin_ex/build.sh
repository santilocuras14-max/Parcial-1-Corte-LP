#!/usr/bin/env bash
set -euo pipefail

ANTLR_JAR="${ANTLR_JAR:-antlr-4.13.1-complete.jar}"

if [ ! -f "$ANTLR_JAR" ]; then
  echo "No se encontró $ANTLR_JAR. Descárgalo y exporta ANTLR_JAR."
  exit 1
fi

java -jar "$ANTLR_JAR" -Dlanguage=Java ExMaclaurin.g4
javac -cp .:"$ANTLR_JAR" *.java
echo "Build OK"
