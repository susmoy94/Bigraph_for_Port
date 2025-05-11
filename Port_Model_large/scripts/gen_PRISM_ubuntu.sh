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
  prism -importtrans $file -importlabels ${BASENAME2}.lab -ctmc  queries.props -prop ${i} -const t=0:3:300 -exportresults /users/staff/susmoy/Port_Model_Bounded_2/${BASENAME2}_${i}_csv.txt:csv -maxiters 500000
  done
done

