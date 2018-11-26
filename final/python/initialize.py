import os
import fileinput

unique_labels = []

# GET UNIQUE LABELS
print ('> GET UNIQUE LABELS...')

directory = './data/train/lab/'

for filename in os.listdir(directory):
    
    if filename.endswith('.lab'):
        complete_filename = os.path.join(directory, filename)
        
        with open(complete_filename) as file:
            for line in file:
                line_element = line.split()
                if len(line_element) == 3:
                    
                    if line_element[2] not in unique_labels:
                        unique_labels.append(line_element[2])
print ('UNIQUE LABELS:', unique_labels)
                        
# BUILD TARGET LIST
print ('> BUILD TARGET LIST...')

sig_directory = './data/train/sig/'
mfcc_directory = './data/train/mfcc/'

targetlist_lines = []
trainlist_lines = []

for filename in os.listdir(sig_directory):
    if filename.endswith('.sig'):
        filename_without_ext = filename.rstrip('.sig')
        
        mfcc_filename = mfcc_directory.lstrip('./') + filename_without_ext + '.mfcc'
        sig_filename = sig_directory.lstrip('./') + filename
        
        targetlist_line = sig_filename + ' ' + mfcc_filename + '\n'
        targetlist_lines.append(targetlist_line)
        
        trainlist_line = mfcc_filename + '\n'
        trainlist_lines.append(trainlist_line)

targetlist_filename = './txt/targetlist.txt'
with open(targetlist_filename, 'w') as outfile:
    for line in targetlist_lines:
        outfile.write(line)

# BUILD TRAIN LIST
print ('> BUILD TRAIN LIST...')

trainlist_filename = './txt/trainlist.txt'
with open(trainlist_filename, 'w') as outfile:
    for line in trainlist_lines:
        outfile.write(line)
        
# BUILD MODEL PROTO
print ('> BUILD MODEL PROTO...')
proto_directory = './model/proto/'

modelexist = os.path.isdir("model")
if modelexist is not True:
	os.mkdir("model")

protoexist = os.path.isdir("model/proto")
if protoexist is not True:
	os.mkdir("model/proto")


default_proto_content = """
~o <VecSize> 39 <MFCC_0_D_A>
~h "${label_name}"
<BeginHMM>
	<NumStates> 6
	<State> 2
		<Mean> 39
		0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
		<Variance> 39
		1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
	<State> 3
		<Mean> 39
		0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
		<Variance> 39
		1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
	<State> 4
		<Mean> 39
		0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
		<Variance> 39
		1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
	<State> 5
		<Mean> 39
		0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
		<Variance> 39
		1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
	<TransP> 6
		0.0 0.5 0.5 0.0 0.0 0.0
		0.0 0.4 0.3 0.3 0.0 0.0
		0.0 0.0 0.4 0.3 0.3 0.0
		0.0 0.0 0.0 0.4 0.3 0.3
		0.0 0.0 0.0 0.0 0.5 0.5
		0.0 0.0 0.0 0.0 0.0 0.0
<EndHMM>
"""

for label in unique_labels:
    proto_filename = proto_directory + 'hmm_' + label
    
    proto_content = default_proto_content.replace('${label_name}', label)
    proto_content_lines = proto_content.split('\n')
    
    with open(proto_filename, 'w') as outfile:
        for line in proto_content_lines[1:]:
            outfile.write(line + '\n')
    

mfccexist = os.path.isdir("data/train/mfcc")
if mfccexist is not True:
	os.mkdir("data/train/mfcc")