#!/usr/bin/env bash
directory="/Users/susmoy.das/transit-models/Port_Model_sample"

for file in "$directory"/*.big; do
  BASENAME=$(basename "$file" .big)
  bigrapher full $file -M 1000000 -l ${BASENAME}.csl -p ${BASENAME}.tra -r ${BASENAME}.srew --solver=GBS &
done
