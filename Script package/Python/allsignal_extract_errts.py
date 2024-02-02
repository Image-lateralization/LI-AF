import numpy as np
import pandas as pd
import os
import shutil
root_path = "H:/WM_data/ADHD/BOLDextract/Txtoutput3"
for root,dirs,files in os.walk(root_path):
    for file in files:
        # print(file)

        if 'errts' in file:
            print(file)

            file_path =  os.path.join(root, file)
            print(file_path)
            file_errts = pd.read_csv(file_path, sep=' ')
            file_errts = np.array(file_errts)
            print(file_errts[0][0])
            ave=[]
            for i in range(0,287):

                sum = 0
                times = 0
                for item in range(len(file_errts)):
                    sum = sum + file_errts[item][3+i]
                    times = times + 1
                ave.append(sum/times)
            file_path = os.path.join(root, file.replace('errts', 'all_signal'))
            new_file = open(file_path, 'w')
            str_result = [str(i) for i in ave]
            new_file.write(str(str_result).replace('\'', '').replace('[', '').replace(']', '').replace(',', ''))


