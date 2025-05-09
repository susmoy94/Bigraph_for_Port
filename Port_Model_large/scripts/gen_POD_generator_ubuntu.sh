#!/usr/bin/env bash
directory="/Bigraph_for_Port/Port_Model_large/bigraph_models"

for file in "$directory"/*.big; do
  BASENAME=$(basename "$file" .big)
  bigrapher full $file -M 1000000 -l ${BASENAME}.csl -p ${BASENAME}.tra -r ${BASENAME}.srew --solver=GBS &
done
