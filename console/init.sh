HInit -A -D -T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_sil -l sil -L data/train/lab/ sil &&
HInit -A -D –T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_satu -l satu -L data/train/lab/ satu && 
HInit -A -D –T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_dua -l dua -L data/train/lab/ dua &&
HInit -A -D –T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_lima -l lima -L data/train/lab/ lima && 
HInit -A -D –T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_enam -l enam -L data/train/lab/ enam &&
HInit -A -D –T 1 -S trainlist.txt -M model/hmm0 -H model/proto/hmm_nol -l nol -L data/train/lab/ nol 

