pathD=['H:\WM_data\HC\BOLDextract\Txtoutput11\r_value_results2\''mulregressionFC.mat'];
sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt'); 
mulFC=cell(88,1);
for t=1:length(sbj)
    data=importdata(['H:\WM_data\HC\BOLDextract\Txtoutput11\mulregressionFC\' sbj{t} '.mat']); 
    mulFC{t,1}=data;
end
Activate_pre=zeros(88,48);
for i=1:88
    for j=1:48
        if j == 1
           Activate_pre(i,j)=dot(mulFC{i,1}(2:48,1,1),All_activate(1,2:48)) ;
        else
           Activate_pre(i,j)=dot(mulFC{i,1}([1:(j-1) (j+1):48],j),All_activate(i,[1:(j-1) (j+1):48]));
        end
    end
end

preLI=zeros(88,24);
for j=1:88
    for i=1:24
        preLI(j,i)=(Activate_pre(j,i)-Activate_pre(j,i+24))/(Activate_pre(j,i)+Activate_pre(j,i+24));
    end
end
for m=1:88
    for n=1:24
        if isnan(preLI(m,n))
            preLI(m,n)=0;
        end
    end
end
r=zeros(24,1);
p=zeros(24,1);
for m=1:24
    [r(m,1),p(m,1)]=corr(realLI(:,m),preLI(:,m));
end

r_A=zeros(48,1);
p_A=zeros(48,1);
for n=1:48
    [r_A(n,1),p_A(n,1)]=corr(All_activate(:,n),Activate_pre(:,n));
end

NNN1=mean(Activate_pre(:,1:10),2);
NNN2=mean(Activate_pre(:,11:15),2);
NNN3=mean(Activate_pre(:,16:18),2);
NNN4=mean(Activate_pre(:,19:22),2);
NNN5=mean(Activate_pre(:,23:24),2);
NNN6=mean(Activate_pre(:,25:34),2);
NNN7=mean(Activate_pre(:,35:39),2);
NNN8=mean(Activate_pre(:,40:42),2);
NNN9=mean(Activate_pre(:,43:46),2);
NNN10=mean(Activate_pre(:,47:48),2);
NN_preactivate=[NNN1,NNN2,NNN3,NNN4,NNN5,NNN6,NNN7,NNN8,NNN9,NNN10];

r_A_N=zeros(10,1);
p_A_N=zeros(10,1);
for a=1:10
    [r_A_N(a,1),p_A_N(a,1)]=corr(NN_preactivate(:,a),NN_realactivate(:,a));
end


N1=mean(preLI(:,1:10),2);
N2=mean(preLI(:,11:15),2);
N3=mean(preLI(:,16:18),2);
N4=mean(preLI(:,19:22),2);
N5=mean(preLI(:,23:24),2);
N_preLI=[N1,N2,N3,N4,N5];

r_N=zeros(5,1);
p_N=zeros(5,1);
for q=1:5
    [r_N(q,1),p_N(q,1)]=corr(N_realLI(:,q),N_preLI(:,q));
end

icc_Mu=zeros(24,1);
icc_Mu_p=zeros(24,1);
for i=1:24
    [icc_Mu(i,1), LB, UB, F, df1, df2, icc_Mu_p(i,1)] = ICC([preLI(:,i),realLI(:,i)], 'A-1',0.05,0);
end
icc_Mu_N=zeros(5,1);
icc_Mu_N_p=zeros(5,1);
for i=1:5
    [icc_Mu_N(i,1), LB, UB, F, df1, df2, icc_Mu_N_p(i,1)] = ICC([N_preLI(:,i),N_realLI(:,i)], 'A-1',0.05,0);
end

save(pathD,'r_A','p_A','r_A_N','p_A_N','r','p','r_N','p_N','icc_Mu','icc_Mu_p','icc_Mu_N','icc_Mu_N_p','All_activate','Activate_pre','NN_preactivate','NN_realactivate','realLI','preLI','N_realLI','N_preLI','mulFC');


