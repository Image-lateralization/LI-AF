from scipy import stats
import numpy as np
import CombinedFCToolBox as cfc
import matplotlib.pyplot as plt
import h5py
from scipy.io import savemat
datadir = 'LANHC108BOLDdata'  # directory path for the datasets
source_path ='H:/WM_data/ADHD/BOLDextract/Txtoutput9/ADHDBOLD/'


#group_subject_id = ['sub-10159','sub-10171','sub-10189','sub-10206','sub-10225','sub-10227','sub-10228',
   #                 'sub-10235','sub-10249','sub-10271','sub-10273','sub-10274','sub-10290','sub-10292',
    #                'sub-10304','sub-10321','sub-10325','sub-10339','sub-10340','sub-10347','sub-10356',
  #                  'sub-10361','sub-10365','sub-10376','sub-10377','sub-10388','sub-10429','sub-10438',
  #                  'sub-10440','sub-10448','sub-10455','sub-10471','sub-10478','sub-10487','sub-10506',
  #                  'sub-10517','sub-10524','sub-10525','sub-10527','sub-10565','sub-10624','sub-10629',
  #                  'sub-10631','sub-10638','sub-10668','sub-10686','sub-10692','sub-10696','sub-10697',
   #                 'sub-10704','sub-10707','sub-10708','sub-10719','sub-10724','sub-10746','sub-10762',
  #                  'sub-10779','sub-10785','sub-10844','sub-10855','sub-10882','sub-10891','sub-10893',
  #                  'sub-10934','sub-10940','sub-10949','sub-10958','sub-10963','sub-10968','sub-10977',
  #                  'sub-10987','sub-11030','sub-11044','sub-11052','sub-11059','sub-11061','sub-11066',
   #                 'sub-11067','sub-11068','sub-11077','sub-11088','sub-11090','sub-11098','sub-11104',
  #                  'sub-11105','sub-11106','sub-11108','sub-11112','sub-11122','sub-11128','sub-11131',
    #                'sub-11142','sub-11143','sub-11149','sub-11156']
group_subject_id = ['sub-10159','sub-10171','sub-10189','sub-10206','sub-10225','sub-10227','sub-10228',
                    'sub-10235','sub-10249','sub-10273','sub-10274','sub-10292',
                    'sub-10304','sub-10325','sub-10339','sub-10340','sub-10347','sub-10356',
                    'sub-10365','sub-10376','sub-10377','sub-10388','sub-10438',
                    'sub-10440','sub-10448','sub-10455','sub-10471','sub-10478','sub-10487','sub-10506',
                    'sub-10517','sub-10525','sub-10527','sub-10565','sub-10624','sub-10629',
                    'sub-10631','sub-10638','sub-10668','sub-10686','sub-10692','sub-10696','sub-10697',
                    'sub-10704','sub-10707','sub-10708','sub-10719','sub-10724','sub-10746','sub-10762',
                    'sub-10779','sub-10785','sub-10844','sub-10855','sub-10882','sub-10891','sub-10893',
                    'sub-10934','sub-10940','sub-10949','sub-10958','sub-10963','sub-10968','sub-10977',
                    'sub-10987','sub-11030','sub-11044','sub-11052','sub-11059','sub-11061','sub-11066',
                    'sub-11068','sub-11077','sub-11088','sub-11090','sub-11098','sub-11104',
                    'sub-11105','sub-11106','sub-11108','sub-11112','sub-11122','sub-11128','sub-11131',
                    'sub-11142','sub-11143','sub-11149','sub-11156']

group_subject_id_SZ = ['sub-50005','sub-50007','sub-50008','sub-50010','sub-50013','sub-50014','sub-50016',
                       'sub-50020','sub-50021','sub-50022','sub-50023','sub-50027','sub-50032','sub-50034',
                       'sub-50035','sub-50036','sub-50038','sub-50043','sub-50047','sub-50048','sub-50049',
                       'sub-50050','sub-50052','sub-50054','sub-50055','sub-50056','sub-50059','sub-50061',
                       'sub-50066','sub-50067','sub-50069','sub-50075','sub-50076','sub-50077','sub-50081',
                       'sub-50083','sub-50085']
group_subject_id_BP = ['sub-60001','sub-60005','sub-60006','sub-60008','sub-60010','sub-60012','sub-60014',
                       'sub-60015','sub-60016','sub-60020','sub-60021','sub-60022','sub-60028','sub-60030',
                       'sub-60033','sub-60036','sub-60037','sub-60038','sub-60043','sub-60045','sub-60048',
                       'sub-60051','sub-60052','sub-60053','sub-60055','sub-60056','sub-60057','sub-60060',
                       'sub-60062','sub-60065','sub-60066','sub-60068','sub-60070','sub-60072','sub-60073',
                       'sub-60074','sub-60076','sub-60077','sub-60078','sub-60079','sub-60080','sub-60084',
                       'sub-60089',]
group_subject_id_ADHD = ['sub-70004','sub-70007','sub-70010','sub-70015','sub-70017','sub-70020','sub-70021',
                         'sub-70022','sub-70029','sub-70033','sub-70034','sub-70037','sub-70040','sub-70046',
                         'sub-70049','sub-70051','sub-70052','sub-70055','sub-70057','sub-70058','sub-70060',
                         'sub-70061','sub-70065','sub-70068','sub-70074','sub-70075','sub-70076', 'sub-70077',
                         'sub-70079','sub-70080','sub-70081','sub-70083']


group_language_id = ['sub-100307','sub-100408','sub-101107','sub-101309','sub-101915','sub-103111','sub-103414','sub-103818',
                     'sub-105014','sub-105115','sub-106016','sub-108828','sub-110411','sub-111312','sub-111716','sub-113619',
                     'sub-113922','sub-114419','sub-115320','sub-116524','sub-117122','sub-118528','sub-118730','sub-118932',
                     'sub-120111','sub-122317','sub-122620','sub-123117','sub-123925','sub-124422','sub-125525','sub-126325',
                     'sub-127630','sub-127933','sub-128127','sub-129028','sub-130013','sub-130316','sub-131722','sub-133019',
                     'sub-133928','sub-135225','sub-135932','sub-136833','sub-138534','sub-139637','sub-140925','sub-144832',
                     'sub-146432','sub-147737','sub-148335','sub-148840','sub-149337','sub-149539','sub-149741','sub-151223',
                     'sub-151526','sub-151627','sub-153025','sub-154734','sub-156637','sub-159340','sub-160123','sub-160830',
                     'sub-161731','sub-162733','sub-163129','sub-163331','sub-176542','sub-178950','sub-188347','sub-189450',
                     'sub-190031','sub-192540','sub-196750','sub-198451','sub-199655','sub-201111','sub-208226','sub-211417',
                     'sub-211720','sub-212318','sub-214423','sub-221319','sub-239944','sub-245333','sub-280739','sub-298051',
                     'sub-366446','sub-397760','sub-414229','sub-499566','sub-654754','sub-751348','sub-756055','sub-792564',
                     'sub-856766','sub-857263','sub-899885','sub-991267']

group_Mcfc_subj = []

for subject in group_subject_id_ADHD :

    rest_data = np.loadtxt(source_path+subject+'.txt')

    Mcfc_subj = cfc.combinedFC(dataset = rest_data,
            methodCondAsso = 'partialCorrelation', #method used to compute conditional associations
            methodParcorr='inverseCovariance',     #if Partial Correlation, choose "inversecovariance" or "regression"
            alphaCondAsso = 0.01,                  #alpha cutoff for conditional association
            methodAsso = 'correlation',            #method used to compute bivariate associations
            alphaAsso = 0.01,                      #alpha curtoff for bivariate association
            equivalenceTestAsso = False,           #True for equivalence test, False for non-significance criterion
            lower_bound = -0.2,                    #lower bound for equivalence test
            upper_bound = +0.2                     #upper bound for equivalence test
            )

    group_Mcfc_subj.append(Mcfc_subj)
    #file_name = subject + '.mat'
    #savemat('H:/WM_data/ADHD/BOLDextract/Txtoutput9/CombinedFC/'+file_name, {'a': Mcfc_subj})

    Mcfc_subj1 = cfc.partialCorrelationSig(rest_data, alpha=0.01, method='inverseCovariance')

    #file_name = subject + '.mat'
    #savemat('H:/WM_data/ADHD/BOLDextract/Txtoutput9/partialFC/'+file_name, {'a': Mcfc_subj1})

    Mcfc_subj2 = cfc.multipleRegressionSig(rest_data, alpha=0.01, sigTest=True)

    #file_name = subject + '.mat'
    #savemat('H:/WM_data/ADHD/BOLDextract/Txtoutput9/mulregressionFC/'+file_name, {'a': Mcfc_subj2})

    Mcfc_subj3 = cfc.correlationSig(rest_data, alpha = 0.01, lower_bound = -0.1, upper_bound = +0.1, equivalenceTest = False)

    file_name = subject + '.mat'
    savemat('H:/WM_data/ADHD/BOLDextract/Txtoutput9/PearsonFC/'+file_name, {'a': Mcfc_subj3})

#print(group_Mcfc_subj)

#file_name = subject+'.mat'
#savemat(file_name, {'a':group_Mcfc_subj})


