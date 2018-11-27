#!/bin/bash

for f in model/proto/hmm_*; do
    # Create hmm0 directory if not exist
    if [ ! -d model/hmm0flat ];
    then
        mkdir model/hmm0flat
    fi

    # Train [0]
    if [ -f "$f" ]
    then
        LABEL=`echo $f | sed 's/model\/proto\/hmm_//'`
        HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H $f -f 0.01 $LABEL
        echo "HCompV -A -D -T 1 -S txt/trainlist.txt -M model/hmm0flat -H ${f} -l ${LABEL} -f 0.01 ${LABEL}"
    fi
done
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_sil -f 0.01 sil
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_satu -f 0.01 satu
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_dua -f 0.01 dua
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_lima -f 0.01 lima
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_enam -f 0.01 enam
# HCompV -A -D -T 1 -C config/config2.conf -S txt/trainlist.txt -M model/hmm0flat -H model/proto/hmm_nol -f 0.01 nol
