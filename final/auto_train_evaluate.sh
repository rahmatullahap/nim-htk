# Initializing parameters
NUM_OF_STATES=18
NUM_OF_ITERATION=10
VEC_SIZE=39
WINDOW_SIZE=500000
TARGET_RATE=200000

# Delete generated folder and files
echo "> RESET FOLDER AND FILES..."

if [ -f 'txt/targetlist.txt' ];
then
rm txt/targetlist.txt
fi

if [ -f 'txt/trainlist.txt' ];
then
rm txt/trainlist.txt
fi

rm -rf ./model/*

rm -rf ./output/*

rm ./mmf/hmmsdef.mmf

rm ./txt/hmmlist.txt

rm ./txt/testlist.txt

rm ./txt/testinglist.txt

# Initializing files
echo "> INITIALIZING FILES..."

python python/initialize.py $NUM_OF_STATES normal 2 $VEC_SIZE # <NUM OF STATES> <STATE COMPONENT TYPE: normal / gaussian> <NUM MIXES> <VEC SIZE> 

# Begin Analysis
echo "============ BEGIN ANALYSIS ============"

./1.analysis.sh

echo "============ BEGIN HINIT ============"
./2.init.sh

echo "============ BEGIN HCOMPV ============"
./3.compv.sh

echo "============ BEGIN TRAINING ============"
./4.rest.sh

echo "============ REBUILD NETWORK ============"
# ./5.network.sh

echo "============ REBUILD HMMSDEF HMMLIST ============"
# python python/build_hmmsdef_hmmlist.py

echo "============ EVALUATE ============"
# ./evaluate.sh

echo "============ SHOW OUTPUT ============"
# cat ./output/results.txt
