#!/bin/bash

for f in model/proto/hmm_*; do
    # Create hmm0 directory if not exist
    if [ ! -d model/hmm0 ];
    then
        mkdir model/hmm0
    fi

    # Train [0]
    if [ -f "$f" ]
    then
        LABEL="${f/model\/proto\/hmm_/}"
        echo $LABEL
        HInit -A -D -T 1 -S trainlist.txt -M model/hmm0 -H $f -l $LABEL -L data/train/lab/ $LABEL
    fi
done


