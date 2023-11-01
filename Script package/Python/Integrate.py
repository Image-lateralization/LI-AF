import os
root_path = "H:/WM_data/ADHD/BOLDextract/Txtoutput3"
for root,dirs,files in os.walk(root_path):
    for dir in dirs:
        # print(dir)
        if 'sub' in dir:
            file_path = os.path.join(root, dir)
            print(file_path)
            list_ROI = []
            for i in range(1, 49):
            #for i in range(1, 109):
                temp = open(file_path + '/ROI' + str(i) + '/' + dir + '_all_signal' + str(i) + '.txt', 'r')
                # list_ROI[i] = temp.read().split(' ')
                list_ROI.append(temp.read().split(' '))
                print(list_ROI[i-1])

            new_file = open(file_path + '/' +file_path.split('\\')[-1]+'.txt', 'w')
            for i in range(len(list_ROI[0])):
                for j in range(len(list_ROI)):
                    new_file.write(list_ROI[j][i] + ' ')
                    # new_file.write(list_ROI[j] + ' ' + list_ROI2[i] + ' ' + list_ROI3[i] + '\n')
                new_file.write('\n')
            print("The new file path is in", new_file)

