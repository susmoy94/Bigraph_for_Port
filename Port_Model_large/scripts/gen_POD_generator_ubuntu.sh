#!/usr/bin/env bash
directory="/Bigraph_for_Port/Port_Model_large/bigraph_models"

for file in "$directory"/*.big; do
  BASENAME=$(basename "$file" .big)
  bigrapher full $file -M 200000 -l ${BASENAME}.csl -p ${BASENAME}.tra --solver=GBS &
done
