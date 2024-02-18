#!/bin/bash 

# Checks if output.txt already exists and then removes it in order to avoid duplicates 
file="output.txt"

if [ -f "$file" ]; then
  rm "$file"
fi 

# Iterates over input URLs and assigns the corresponding GA Identifier 
for i in $(cat urls_to_check.txt); do 
  result=$(curl "$i" | perl -nle 'print $& if /id=G-[^"]+/')
  if [ -n "$result" ]; then 
    result="$i : $result"
  else
    result="$i : Aucun ID Google Analytics trouvé..."
  fi
  echo "$result" >> output.txt
done 
