import os
import numpy as np
import scipy.io
root_path = "H:/WM_data/ADHD/BOLDextract/Txtoutput3"
for root,dirs,files in os.walk(root_path):
    for dir in dirs:
        if 'sub' in dir:
            file_path = os.path.join(root, dir)
            print(file_path)
            list_ROI = []
            for i in range(1, 49):
                temp = open(file_path + '/ROI' + str(i) + '/' + dir + '_allvoxel_activate' + str(i) + '.txt', 'r')
                # list_ROI[i] = temp.read().split(' ')
                list_ROI.append(float(temp.read()))
                #print(list_ROI[i-1])
            print(list_ROI)
            # new_file = open(file_path + '/' + file_path.split('\\')[-1] + '.txt', 'w')
            # new_file.write(str(list_ROI))
            array_ROI = np.array(list_ROI)
            scipy.io.savemat(file_path + '.mat', {'roi': array_ROI})