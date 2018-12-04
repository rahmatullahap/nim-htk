#!/bin/bash

ITERATION=4
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
            LABEL=`echo $f | sed 's/model\/proto\/hmm_//'`
            echo "HRest -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M  ${MODEL_FOLDER} -H ${PREV_MODEL_FOLDER}/hmm_${LABEL} -L data/train/lab ${LABEL}" 
            HRest -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M $MODEL_FOLDER -H "${PREV_MODEL_FOLDER}/hmm_${LABEL}" -H model/hmm0flat/vFloors -L data/train/lab/ $LABEL
        fi
    done
done


