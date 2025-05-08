#!/usr/bin/env bash

directory="/Users/susmoy.das/transit-models/Port_Model_sample"
source_file="queries.txt"

n=21

# file_extension=".csl"
# for file in *$file_extension; do
#     if [[ -f "$file" ]]; then          
#         cat "$source_file" >> "$file"
#     fi
# done
# echo "Query files modification completed."

# for file in "$directory"/*.tra; do
#   for ((i=1; i<=n; i++)); do
#   BASENAME2=$(basename "$file" .tra)
#   IFS='_' read -r -a val <<< "$BASENAME2"
#   /Applications/Prism/bin/prism -importtrans $file ${BASENAME2}.csl -ctmc -prop ${i} -const t=0:0.5:300 -exportresults /Users/susmoy.das/transit-models/Port_Model_sample/${BASENAME2}_${i}_csv.txt:csv -javastack 1g 
#   done
# done
cat "$source_file" >> Port_Model_3_lanes_generic.csl
for ((i=1; i<=n; i++)); do
  /Applications/Prism/bin/prism -importtrans Port_Model_3_lanes_generic.tra Port_Model_3_lanes_generic.csl -ctmc -prop ${i} -const t=0:0.5:300 -exportresults /Users/susmoy.das/transit-models/Port_Model_sample/Port_Model_3_lanes_generic3_${i}_csv.txt:csv -javastack 1g 
  done
