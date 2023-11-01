import matplotlib
from matplotlib import pylab as plt
import nibabel as nib
from nibabel.viewers import OrthoSlicer3D

from nilearn import image
import nilearn
from nilearn.datasets import MNI152_FILE_PATH
import nibabel as nib
from nilearn import plotting
import numpy as np
from sklearn import preprocessing

aal_atlas = nilearn.datasets.fetch_atlas_aal(version='SPM12', data_dir=None, url=None, resume=True, verbose=1)
ind = aal_atlas['indices']


indx = [int(i) for i in ind]
img = image.load_img('C:/Users/ZX/Desktop/ROI_MNI_V4.nii')

plotting.plot_img(img)


tt = np.loadtxt('H:/WM_data/HC/BOLDextract/Txtoutput11/graph/ADHDCo.txt')
from sklearn import preprocessing

X_scaled = tt

data = img.get_fdata()


# ROI_label =  range(1,17)
ROI_label = indx
mask = np.zeros(data.shape)
ind_tt = 0
for i in ROI_label:
#     print(i)
#     mask[data==i] = tt[ind_tt]
    mask[data==i] = X_scaled[ind_tt]

    ind_tt += 1
sum(sum(mask))
print(min(X_scaled))

area_name = 'zx'
# mask = mask.astype('uint8')
new_img = image.new_img_like(img, mask)
new_img.to_filename(area_name + 'ADHDCo.nii')

plotting.plot_img(new_img)
