# !/usr/bin/bash

for trainingId in {663..677}
do
    echo "CMD....:"
    echo "python orchestration.py --action train-test --training-id $trainingId --model xgboost"
    python orchestration.py --action train-test --training-id $trainingId --model xgboost
    # python orchestration.py --action train-test --training-id $trainingId --model xgboost
done