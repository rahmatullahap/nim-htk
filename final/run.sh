#!/bin/bash

echo "============ REMOVE MODELS ============" ;
rm -rf model/proto ;
rm -rf model/hmm* ;
rm -rf mmf/ ;
rm -rf output/ ;
mkdir mmf ;
mkdir output ;
echo "============ INITIALIZE ============" ;
python python/initialize.py ;
echo "============ BEGIN ANALYSIS ============" ;
sh 1.analysis.sh ;
echo "============ BEGIN HINIT ============" ;
sh 2.init.sh ;
echo "============ BEGIN HCOMPV ============" ;
sh 3.compv.sh ;
echo "============ BEGIN TRAINING ============" ;
sh 4.rest.sh ;
echo "============ REBUILD NETWORK ============" ;
sh 5.network.sh ;
echo "============ REBUILD HMMSDEF HMMLIST ============" ;
python python/build_hmmsdef_hmmlist.py ;
echo "============ EVALUATE ============" ;
sh evaluate.sh ;
