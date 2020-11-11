# !/usr/bin/bash

# CONTRACT_DIR="/home/vagrant/sync/testfield/contracts"
multipleParagraphs='True'
semanticAnalysis='True'
ngram='4'
model=(

)
# convert docx to odt
for entry in ${CONTRACT_DIR}/*
do
  echo "Processing..."
  python python orchestration.py --action preprocess --remove-stop-words $removeStopwords --do-stemming $doStemming --multiple-paragraphs $multipleParagraphs --semantic-analysis $semanticAnalysis --ngram $ngram --ngram-literate $ngramLiterate
  echo "Training...."
  trainId=$(cat /home/vagrant/sync/testfield/tmp.txt)
  python orchestration.py --action train-test --training-id $trainId --model $model
  echo "Testing...."
  # f="$(basename -- $entry)"
  # docname="${f%.*}"
  # #echo "$docname"
  # unoconv -d document --format=odt $entry
  # unoconv -d document --format=rtf ${CONTRACT_DIR}"/"${docname}".odt"
  # echo "FILE ${docname} processed!"
done

