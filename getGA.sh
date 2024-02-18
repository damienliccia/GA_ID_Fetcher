#!/bin/bash 

# Checks if output.csv already exists and then removes it in order to avoid duplicates 
file="output.csv"

if [ -f "$file" ]; then
  rm "$file"
fi 

# Iterates over input URLs and assigns the corresponding GA Identifier 
for i in $(cat urls_to_check.txt); do 
  gaid=$(curl -s "$i" | perl -nle 'print $& if /id=G-[^"]+/' | sed 's/^.*=//')
  domain=$(echo "$i" | sed 's/^.*www\.//' | sed 's/.$//')
  
  echo "Processing $domain"
  # Get registrar via whois call 
  registrar_raw=$(whois "$domain")

  if echo "$registrar_raw" | grep -iq 'registrar whois server'; then
    registrar=$(echo "$registrar_raw" | grep -i 'registrar whois server' | sed 's/^.*Registrar WHOIS Server: whois\.*//' | head -n 1 | tr -d '[:space:]')
  else 
    registrar=$(echo "$registrar_raw" | grep -i 'registrar' | sed 's/^.*://' | head -n 1 | tr -d '[:space:]')
  fi


  if [ -n "$gaid" ]; then 
    output="$domain, $gaid, $registrar"
  else
    output="$domain, No GA-Id found, $registrar"
  fi  
  echo "$output" >> output.csv
done 
