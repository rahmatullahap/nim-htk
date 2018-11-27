import os
import fileinput
import re

model_directory = './model/'
model_index_array = []
for filename in os.listdir(model_directory):
    if 'hmm' in filename:
        model_index = filename.replace('hmm', '')
        model_index = re.sub("[^0-9]", "", model_index)
        if model_index not in model_index_array:
            model_index_array.append(int(model_index))

last_model = 'hmm' + str(max(model_index_array))

hmmsdef_content = []
hmmlist_content = []

for filename in os.listdir(model_directory + last_model):
    if 'hmm_' in filename:
        print(filename)
        file_path = model_directory + last_model + '/' + filename
        get_header = len(hmmsdef_content) > 0
        
        hmmlist_label = filename.replace('hmm_', '')
        hmmlist_content.append(hmmlist_label + '\n')
        
        with open(file_path) as file:
            i = 0
            for line in file:

                if i > 2:
                    hmmsdef_content.append(line)
                else:
                    if not get_header:
                        hmmsdef_content.append(line)
                
                i += 1

hmmsdef_filename = './mmf/hmmsdef.mmf'                
with open(hmmsdef_filename, 'w') as outfile:
    for line in hmmsdef_content:
        outfile.write(line)
        
hmmlist_filename = './txt/hmmlist.txt'                
with open(hmmlist_filename, 'w') as outfile:
    for line in hmmlist_content:
        outfile.write(line)
