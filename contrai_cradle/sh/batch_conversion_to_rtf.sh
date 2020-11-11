# !/usr/bin/bash

CONTRACT_DIR="/home/vagrant/sync/testfield/contracts"

# convert docx to odt
for entry in ${CONTRACT_DIR}/*
do
  echo "File path is: $entry"
  f="$(basename -- $entry)"
  docname="${f%.*}"
  #echo "$docname"
  unoconv -d document --format=odt $entry
  unoconv -d document --format=rtf ${CONTRACT_DIR}"/"${docname}".odt"
  echo "FILE ${docname} processed!"
done

