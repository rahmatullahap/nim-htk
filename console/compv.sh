HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_sil -f 0.01 sil
HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_satu -f 0.01 satu
HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_dua -f 0.01 dua
HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_lima -f 0.01 lima
HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_enam -f 0.01 enam
HCompv -A -D –T 1 -S trainlist.txt -M model/hmm0flat -H model/proto/hmm_nol -f 0.01 nol