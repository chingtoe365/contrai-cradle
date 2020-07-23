__doc__ = '''
Overall Assessment
'''
import os
from itertools import combinations, product
from functools import reduce

gramPossibilities=[1,2,3,4]
binaryOptions=['True', 'False']
gramCombiniationOptions=[
    z for z in reduce(
        lambda a,b: a+b, 
        [
            [
                y for y in combinations(gramPossibilities, x)
            ] for x in gramPossibilities
        ]
    )
]
models = [
    # "naive_bayes",
    "linear_svc",
    "logistic_regression",
    "sgdc",
    "svc"
]
if __name__ == '__main__':
    count = -1
    allParamCombinations = [
        p for p in product(*[
            binaryOptions, # stop word
            binaryOptions, # stemming
            binaryOptions, # multiple paragraphs
            binaryOptions, # semantic analytis
            binaryOptions, # literate ngram
            gramCombiniationOptions # gram combinations
        ])
    ]
    for params in allParamCombinations:
        count += 1
        if count < 114:
            continue
        # --- TRAINING ---
        if count > 114:
            os.system("""
                python /home/vagrant/sync/testfield/orchestration.py --action preprocess --remove-stop-words {} --do-stemming {} --multiple-paragraphs {} --semantic-analysis {} --ngram-literate {} --ngram {}
            """.format(
                params[0],
                params[1],
                params[2],
                params[3],
                params[4],
                ' '.join([str(z) for z in params[5]]),
            ))
        # READ training id
        tmpfile = open('/home/vagrant/sync/testfield/tmp.txt', 'r')
        training_id = tmpfile.read()
        tmpfile.close()
        # --- TESTING ---
        for model in models:
            if count == 114 and (model == "linear_svc" or model == "logistic_regression"):
                continue
            os.system("""
                python /home/vagrant/sync/testfield/orchestration.py --action train-test --training-id {} --model {}
            """.format(
                training_id,
                model
            ))