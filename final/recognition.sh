# HVite -A -D -C -T config2.conf 1 -H hmmsdef.mmf -i reco.mlf -w net.slf dict.txt hmmlist.txt test/12615050_insan_1.mfcc
python python/build_hmmsdef_hmmlist.py
HVite -A -D -T 1 -C config/directin.conf -g -H mmf/hmmsdef.mmf -i output/reco.mlf -w output/net.slf txt/dict.txt txt/hmmlist.txt data/test/23511089_1_rahmat.mfcc
