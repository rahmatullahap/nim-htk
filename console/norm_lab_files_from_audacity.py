import os
import fileinput

directory = './data/train/lab/txt/'
for filename in os.listdir(directory):
    complete_filename = os.path.join(directory, filename)
    
    is_audacity_lab_file = False
    replace_line_array = []
    
    with open(complete_filename) as file:
        for line in file:
            # Lab file from audacity
            if '.' in line:
                line_array = []
                replace_line = ''
                if is_audacity_lab_file == False:
                    is_audacity_lab_file = True
                element = line.split()
                for e in element:
                    if '.' in e:
                        e = str(int(e.replace('.', ''))) + '0'
                
                    line_array.append(e)
                replace_line = ' '.join(line_array) + '\n'
                replace_line_array.append(replace_line)
                    
    if is_audacity_lab_file:
        with open(complete_filename, 'w') as outfile:
            for line in replace_line_array:
                outfile.write(line)
print("berhasil")
