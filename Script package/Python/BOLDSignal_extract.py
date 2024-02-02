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

            # sort
            file_.sort_values("v", inplace=True, ascending=False)


            #extract the top 10% voxel data
            file_ = file_[0:int(len(file_)*0.1)]



            file_path = os.path.join(root, file.replace('Tstat','errts'))
            file_errts = pd.read_csv(file_path, sep=' ')
            print('xxxxxxxxxxxx')

            obj = []
            for line in file_.itertuples():
                # print(line[1])
                for line_errts in file_errts.itertuples():
                    # Pandas(Index=0, x=20, y=58, z=25, v=1.896336)
                    if line[1] == line_errts[1] and line[2] == line_errts[2] and line[3] == line_errts[3]:
                        obj.append(line_errts)
            ave = []
            # print(obj[0]) # Pandas(Index=359, _1=19, _2=43, _3=40, _4=0.030833, _5=0.044032,......
            # print(len(obj[0]))
            for i in range(1,288):
                sum = 0
                times = 0
                for item in range(len(obj)):
                    sum = sum + obj[item][3+i]
                    times = times + 1
                ave.append(sum/times)
            #print(ave)

            file_path = os.path.join(root, file.replace('Tstat', 'result'))
            new_file = open(file_path,'w')
            str_result = [str(i) for i in ave]
            new_file.write(str(str_result).replace('\'','').replace('[','').replace(']','').replace(',',''))


            #Extract the activation value of the corresponding position
            file_path1 = os.path.join(root, file.replace('Tstat', 'Activate'))
            file_Activate = pd.read_csv(file_path1, sep=' ')
            print('xxxxxxxxxxxx')
            obj1 = []
            for line in file_.itertuples():
                # print(line[1])
                for line_Activate in file_Activate.itertuples():
                    # Pandas(Index=0, x=20, y=58, z=25, v=1.896336)
                    if line[1] == line_Activate[1] and line[2] == line_Activate[2] and line[3] == line_Activate[3]:
                        obj1.append(line_Activate)
            #print(obj1)
            #print(obj1[0])
            print(len(obj1))
            #print(obj1[0][4])
            ave1 = []
            time1 = 0
            sum1 = 0
            for item1 in range(len(obj1)):
                sum1 = sum1 + obj1[item1][4]
                time1 = time1 + 1
            ave1.append(sum1/time1)
            print(ave1)

            file_path2 = os.path.join(root, file.replace('Tstat', 'Coef'))
            new_file1 = open(file_path2, 'w')
            new_file1.write(str(ave1).replace('[', '').replace(']', ''))