HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_sil -l sil -L data/train/lab/ sil
HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_satu -l satu -L data/train/lab/ satu
HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_dua -l dua -L data/train/lab/ dua
HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_lima -l lima -L data/train/lab/ lima
HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_enam -l enam -L data/train/lab/ enam
HRest -A -D -T 1 -S trainlist.txt -M model/hmm1 -H model/hmm0flat/vFloors -H model/hmm0/hmm_nol -l nol -L data/train/lab/ nol &&