#!/usr/bin/env bash

directory="/Bigraph_for_Port/Port_Model_large/prism_files"
source_file="queries.txt"

n=40

# file_extension=".csl"
# for file in *$file_extension; do
#     if [[ -f "$file" ]]; then          
#         cat "$source_file" >> "$file"
#     fi
# done
# echo "Query files modification completed."

for file in "$directory"/*.tra; do
  for ((i=1; i<=n; i++)); do
  BASENAME2=$(basename "$file" .tra)
  IFS='_' read -r -a val <<< "$BASENAME2"
  prism -importtrans $file ${BASENAME2}.csl -ctmc -prop ${i} -const t=0:0.5:300 -exportresults /Bigraph_for_Port/Port_Model_large/analysis/${BASENAME2}_${i}_csv.txt:csv
  done
done

