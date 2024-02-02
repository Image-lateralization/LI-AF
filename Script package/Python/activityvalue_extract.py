import numpy as np
import pandas as pd
import os
import shutil
root_path = "H:/WM_data/HC/BOLDextract/Txtoutput8"

for root,dirs,files in os.walk(root_path):
    for file in files:
        if 'Tstat' in file:
            print(file)

            file_path =  os.path.join(root, file)
            file_ = pd.read_csv(file_path, sep = ' ', names=['x','y','z','v'])


            file_.sort_values("v", inplace=True, ascending=False)


            file_ = file_[0:int(len(file_)*0.1)]
            print(len(file_))
            #print(file_("v"))
            print('1111111')
            sum=0
            for line in file_.itertuples():
                sum = sum + line[4]
            a = sum/len(file_)
            print(a)
            file_path = os.path.join(root, file.replace('Tstat', 'Tvalue'))
            new_file = open(file_path, 'w')
            new_file.write(str(a))
