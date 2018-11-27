import os
import fileinput

# BUILD TARGET LIST
print ('> BUILD TESTING LIST...')

sig_directory = './data/test/sig/'
mfcc_directory = './data/test/mfcc/'

targetlist_lines = []
trainlist_lines = []

for filename in os.listdir(sig_directory):
    if filename.endswith('.sig'):
        filename_without_ext = filename.replace('.sig','')
        
        mfcc_filename = mfcc_directory.lstrip('./') + filename_without_ext + '.mfcc'
        sig_filename = sig_directory.lstrip('./') + filename
        
        targetlist_line = sig_filename + ' ' + mfcc_filename + '\n'
        targetlist_lines.append(targetlist_line)
        
        trainlist_line = mfcc_filename + '\n'
        trainlist_lines.append(trainlist_line)

targetlist_filename = './txt/testinglist.txt'
with open(targetlist_filename, 'w') as outfile:
    for line in targetlist_lines:
        outfile.write(line)
