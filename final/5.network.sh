HParse -A -D -T -C config/config2.conf 1 txt/grammar.txt output/net.slf &&
HSGen -A -D -C config/config2.conf -n 1000000 -s output/net.slf txt/dict.txt
