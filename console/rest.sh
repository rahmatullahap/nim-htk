HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_sil -L data/train/lab/ sil &&
HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_satu -L data/train/lab/ satu &&
HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_dua -L data/train/lab/ dua &&
HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_lima -L data/train/lab/ lima &&
HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_enam -L data/train/lab/ enam &&
HRest -A -D -T 1 -C config2.conf -S trainlist.txt -M model/hmm1 -H model/hmm0flat -H model/hmm0/hmm_nol -L data/train/lab/ nol 
