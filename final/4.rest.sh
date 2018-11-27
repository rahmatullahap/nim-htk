#!/bin/bash

ITERATION=5
for i in $(seq 1 $ITERATION); do
    i_minus_1=$((i - 1))

    PREV_MODEL_FOLDER="model/hmm${i_minus_1}"
    # Create hmm0 directory if not exist
    MODEL_FOLDER="model/hmm${i}"
    if [ ! -d $MODEL_FOLDER ];
    then
        mkdir $MODEL_FOLDER
    fi

    for f in model/proto/hmm_*; do

        # Train [0]
        if [ -f "$f" ]
        then
            LABEL="${f/model\/proto\/hmm_/}"
            echo "HRest -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M  ${MODEL_FOLDER} -H ${PREV_MODEL_FOLDER}/hmm_${LABEL} -L data/train/lab ${LABEL}" 
            HRest -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M $MODEL_FOLDER -H "${PREV_MODEL_FOLDER}/hmm_${LABEL}" -L data/train/lab/ $LABEL
        fi
    done
done
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_sil -L data/train/lab/ sil
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_satu -L data/train/lab/ satu
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_dua -L data/train/lab/ dua
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_lima -L data/train/lab/ lima
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_enam -L data/train/lab/ enam
# HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_nol -L data/train/lab/ nol 

