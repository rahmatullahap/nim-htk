python python/testing.py
HVite -A -D -T 1 -C config/directin.conf -g -S txt/testlist.txt -H mmf/hmmsdef.mmf -i output/rec.mlf -w output/net.slf txt/dict.txt txt/hmmlist.txt
HResults -A -D -T 1 -C config/directin.conf -L data/test/lab/ txt/hmmlist.txt output/rec.mlf > output/results.txt
