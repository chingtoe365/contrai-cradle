__doc__ = '''
Overall Assessment
771 onwards on testbed

1192 best LInear SVC
829 best logi


LATEST
from 3769 assess new labelled data
'''
import os
from itertools import combinations, product
from functools import reduce

input_format = 'csv' # rtf
tagging_method = 'current_label_as_label' # heading_as_label
gramPossibilities=[1,2,3,4,]
# cvFoldNumbers=list(range(2,25+1))
maxIter=[50,100,500,750,1000,2000,]
# cvFoldNumbers=list(range(10,25+1))
cvFoldNumbers=[20, ]
binaryOptions=['True', 'False']
# C=[0.001,0.01,0.1,1,5,10,100]
C=[0.1, ]
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
# gramCombiniationOptions = [
# [2,]
# [3,]
# [4,]
# [2,3,]
# [2,4,]
# [3,4,]
# [2,3,4,]
# ]
models = [
    # "naive_bayes",
    "linear_svc",
    "logistic_regression",
    # "sgdc",
    # "svc"
]
if __name__ == '__main__':
    count = -1
    allParamCombinations = [
        p for p in product(*[
            binaryOptions, # ['False', ], # stop word
            binaryOptions, # ['True', ], # stemming
            ['False', ],# ['True', ], # multiple paragraphs
            binaryOptions, #['False', ], # semantic analytis
            binaryOptions, # ['False', ], # literate ngram
            gramCombiniationOptions#[[1,2,3,4], ], # gram combinations
        ])
    ]
    for params in allParamCombinations:
        count += 1
        # if count < 114:
        #     continue
        # --- TRAINING ---
        # if count > 114:
        os.system("""
            python {}/orchestration.py --action preprocess --input-file-format {} --tag-obtaining-method {} --remove-stop-words {} --do-stemming {} --multiple-paragraphs {} --semantic-analysis {} --ngram-literate {} --ngram {}
        """.format(
            os.getcwd(),
            input_format,
            tagging_method,
            params[0],
            params[1],
            params[2],
            params[3],
            params[4],
            ' '.join([str(z) for z in params[5]]),
        ))
        # READ training id
        tmpfile = open(
            os.path.join(
                os.getcwd(),
                'tmp.txt'
            ), 'r'
        )
        training_id = tmpfile.read()
        # training_id = 1255
        tmpfile.close()
        # --- TESTING ---
        trainParamCombinations = [
            p for p in product(*[
                models, # models
                cvFoldNumbers, # CV fold numbers
                C, # regularization param
                maxIter # maximum iteration
            ])
        ]
        # for train_params in trainParamCombinations:
            # if count == 114 and (model == "linear_svc" or model == "logistic_regression"):
            #     continue
            # os.system("""
            #     python {}/orchestration.py --action train-test --cv-fold-number {} --training-id {} --model {} --C {} --max-iter {} --note {}
            # """.format(
            #     os.getcwd(),
            #     train_params[1],
            #     training_id,
            #     train_params[0],
            #     train_params[2],
            #     train_params[3],
            #     'C={} max_iter={}'.format(
            #         train_params[2],
            #         train_params[3]
            #     )
            # ))  
        for model in models:
            os.system("""
                python {}/orchestration.py --action train-test --training-id {} --model {}
            """.format(
                os.getcwd(),
                training_id,
                model
            ))