
pathD=['H:\WM_data\HC\BOLDextract\Txtoutput11\r_value_results4\''Pearson.mat'];
sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt'); 
for t=1:length(sbj)
   
    data=importdata(['H:\WM_data\HC\BOLDextract\Txtoutput11\PearsonFC\' sbj{t} '.mat']);
    SFC{t,1}=data;
end

%
ALI_pre_L=zeros(88,24);
for i=1:88
    for j=1:24
        if j==1
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}(2:24,j)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(2:24,j)))  ;
        else
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}([1:j-1,j+1:24],j)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([1:j-1,j+1:24],j)))  ;
        end
    end
end
ALI_pre_L_2=zeros(88,24);
for i=1:88
    for j=1:24
        if j==1
            ALI_pre_L_2(i,j)=dot(abs(SFC{i,1}(2:24,j+24)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(2:24,j+24)))  ;
        else
            ALI_pre_L_2(i,j)=dot(abs(SFC{i,1}([1:j-1,j+1:24],j+24)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([1:j-1,j+1:24],j+24)))  ;
        end
    end
end

LL=(ALI_pre_L(:,1:24)+ALI_pre_L_2(:,1:24))/2;
LL(isnan(LL))=0;
icc_LL=zeros(24,1);
icc_LL_p=zeros(24,1);
for i=1:24
    [icc_LL(i,1), LB, UB, F, df1, df2, icc_LL_p(i,1)] = ICC([LL(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end

%
ALI_pre_R=zeros(88,24);
for i=1:88
    for j=1:24
        if j==1
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}(26:48,j+24)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(26:48,j+24)))  ;
        else
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}([25:j+23,j+25:48],j+24)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([25:j+23,j+25:48],j+24)));
        end
    end
end
ALI_pre_R_2=zeros(88,24);
for i=1:88
    for j=1:24
        if j==1
            ALI_pre_R_2(i,j)=dot(abs(SFC{i,1}(26:48,j)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(26:48,j)))  ;
        else
            ALI_pre_R_2(i,j)=dot(abs(SFC{i,1}([25:j+23,j+25:48],j)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([25:j+23,j+25:48],j)));
        end
    end
end
RR=(ALI_pre_R(:,1:24)+ALI_pre_R_2(:,1:24))/2;
RR(isnan(RR))=0;

icc_RR=zeros(24,1);
icc_RR_p=zeros(24,1);
for i=1:24
    [icc_RR(i,1), LB, UB, F, df1, df2, icc_RR_p(i,1)] = ICC([RR(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end

r_L=zeros(1,24);
p_L=zeros(1,24);
for i=1:24
    [r_L(1,i),p_L(1,i)]=corr(ALI_pre_L(:,i),All_ALI_L(:,i));
end

r_R=zeros(1,24);
p_R=zeros(1,24);
for i=1:24
    [r_R(1,i),p_R(1,i)]=corr(ALI_pre_R(:,i),All_ALI_L(:,i));
end
N1=mean(ALI_pre_L(:,1:10),2);
N2=mean(ALI_pre_L(:,11:15),2);
N3=mean(ALI_pre_L(:,16:18),2);
N4=mean(ALI_pre_L(:,19:22),2);
N5=mean(ALI_pre_L(:,23:24),2);
N_pre_L=[N1,N2,N3,N4,N5];
NN1=mean(All_ALI_L(:,1:10),2);
NN2=mean(All_ALI_L(:,11:15),2);
NN3=mean(All_ALI_L(:,16:18),2);
NN4=mean(All_ALI_L(:,19:22),2);
NN5=mean(All_ALI_L(:,23:24),2);
N_real_L=[NN1,NN2,NN3,NN4,NN5];
R1=zeros(1,5);
P1=zeros(1,5);
for i=1:5
    [R1(1,i),P1(1,i)]=corr(N_pre_L(:,i),N_real_L(:,i));
end

NN1=mean(ALI_pre_R(:,1:10),2);
NN2=mean(ALI_pre_R(:,11:15),2);
NN3=mean(ALI_pre_R(:,16:18),2);
NN4=mean(ALI_pre_R(:,19:22),2);
NN5=mean(ALI_pre_R(:,23:24),2);
N_pre_R=[NN1,NN2,NN3,NN4,NN5];
NNN1=mean(All_ALI_L(:,1:10),2);
NNN2=mean(All_ALI_L(:,11:15),2);
NNN3=mean(All_ALI_L(:,16:18),2);
NNN4=mean(All_ALI_L(:,19:22),2);
NNN5=mean(All_ALI_L(:,23:24),2);
N_real_R=[NNN1,NNN2,NNN3,NNN4,NNN5];
R2=zeros(1,5);
P2=zeros(1,5);
for i=1:5
    [R2(1,i),P2(1,i)]=corr(N_pre_R(:,i),N_real_L(:,i));
end

%
allALI=[All_ALI_L,All_ALI_L];
ALI_pre=zeros(88,48);
for i=1:88
    for j=1:48
        if j == 1
          ALI_pre(i,j)=dot(abs(SFC{i,1}([2:24 26:48],1)),allALI(1,[2:24 26:48]))/sum(abs(SFC{i,1}([2:24 26:48],1))); 
        elseif j<=24
           ALI_pre(i,j)=dot(abs(SFC{i,1}([1:(j-1) (j+1):(j+23) (j+25):48],j)),allALI(i,[1:(j-1) (j+1):(j+23) (j+25):48]))/sum(abs(SFC{i,1}([1:(j-1) (j+1):(j+23) (j+25):48],j)));
        else 
           ALI_pre(i,j)=dot(abs(SFC{i,1}([1:(j-25) (j-23):(j-1) (j+1):48],j)),allALI(i,[1:(j-25) (j-23):(j-1) (j+1):48]))/sum(abs(SFC{i,1}([1:(j-25) (j-23):(j-1) (j+1):48],j)));
        end
    end
end
ALI_pre(isnan(ALI_pre))=0;
All_ALI=[All_ALI_L,All_ALI_L];
R=zeros(1,48);
P=zeros(1,48);
for i=1:48
    [R(1,i),P(1,i)]=corr(ALI_pre(:,i),All_ALI(:,i));
end
NN1=mean(ALI_pre(:,1:10),2);
NN2=mean(ALI_pre(:,11:15),2);
NN3=mean(ALI_pre(:,16:18),2);
NN4=mean(ALI_pre(:,19:22),2);
NN5=mean(ALI_pre(:,23:24),2);
NN6=mean(ALI_pre(:,25:34),2);
NN7=mean(ALI_pre(:,35:39),2);
NN8=mean(ALI_pre(:,40:42),2);
NN9=mean(ALI_pre(:,43:46),2);
NN10=mean(ALI_pre(:,47:48),2);
NN_pre=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];
NNN1=mean(allALI(:,1:10),2);
NNN2=mean(allALI(:,11:15),2);
NNN3=mean(allALI(:,16:18),2);
NNN4=mean(allALI(:,19:22),2);
NNN5=mean(allALI(:,23:24),2);
NNN6=mean(allALI(:,25:34),2);
NNN7=mean(allALI(:,35:39),2);
NNN8=mean(allALI(:,40:42),2);
NNN9=mean(allALI(:,43:46),2);
NNN10=mean(allALI(:,47:48),2);
NN_real=[NNN1,NNN2,NNN3,NNN4,NNN5,NNN6,NNN7,NNN8,NNN9,NNN10];
R3=zeros(1,10);
P3=zeros(1,10);
for i=1:10
    [R3(1,i),P3(1,i)]=corr(NN_pre(:,i),NN_real(:,i));
end
AA=(ALI_pre(:,1:24)+ALI_pre(:,25:48))/2;
R6=zeros(24,1);
P6=zeros(24,1);
for i=1:24
    [R6(i,1),P6(i,1)]=corr(AA(:,i),All_ALI_L(:,i));
    
end
A1=mean(AA(:,1:10),2);
A2=mean(AA(:,11:15),2);
A3=mean(AA(:,16:18),2);
A4=mean(AA(:,19:22),2);
A5=mean(AA(:,23:24),2);
A_pre=[A1,A2,A3,A4,A5];
R7=zeros(5,1);
P7=zeros(5,1);
for i=1:5
    [R7(i,1),P7(i,1)]=corr(A_pre(:,i),N_real_L(:,i));
    
end
mAll_ALI_L=mean(All_ALI_L)';
ZAll_ALI_L=zscore(mAll_ALI_L);
mAA=mean(AA)';
[C,D]=corr(mAll_ALI_L,mAA);

[M]=LIpattern(mAA);
[Mr]=LIpattern(mean(ALI_pre_R)');
[Ml]=LIpattern(mean(ALI_pre_L)');
[MM]=LIpattern(mean(All_ALI_L)');

rr=zeros(88,1);
pp=zeros(88,1);
for i=1:88
    [rr(i,1),pp(i,1)]=corr(AA(i,:)',All_ALI_L(i,:)');
end
mean(rr)

%
r1=zeros(88,1);
p1=zeros(88,1);
for i=1:88
    [r1(i,1),p1(i,1)]=corr(ALI_pre_L(i,:)',All_ALI_L(i,:)');
end

r2=zeros(88,1);
p2=zeros(88,1);
for i=1:88
    [r2(i,1),p2(i,1)]=corr(ALI_pre_R(i,:)',All_ALI_L(i,:)');
end
r3=zeros(88,1);
p3=zeros(88,1);
for i=1:88
    [r3(i,1),p3(i,1)]=corr(AA(i,:)',All_ALI_L(i,:)');
end
[r4,p4]=corr(mean(AA)',mean(All_ALI_L)');
[r5,p5]=corr(mean(ALI_pre_L)',mean(All_ALI_L)');
[r6,p6]=corr(mean(ALI_pre_R)',mean(All_ALI_L)');


icc_Pe=zeros(24,1);
icc_Pe_p=zeros(24,1);
for i=1:24
    [icc_Pe(i,1), LB, UB, F, df1, df2, icc_Pe_p(i,1)] = ICC([AA(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
icc_Pe_N=zeros(5,1);
icc_Pe_N_p=zeros(5,1);
for i=1:5
    [icc_Pe_N(i,1), LB, UB, F, df1, df2, icc_Pe_N_p(i,1)] = ICC([A_pre(:,i),NT(:,i)], 'A-1',0.05,0);
end
icc_Pe_r_L=zeros(24,1);
icc_Pe_r_L_p=zeros(24,1);
for i=1:24
    [icc_Pe_r_L(i,1), LB, UB, F, df1, df2, icc_Pe_r_L_p(i,1)] = ICC([ALI_pre_L(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
icc_Pe_r_R=zeros(24,1);
icc_Pe_r_R_p=zeros(24,1);
for i=1:24
    [icc_Pe_r_R(i,1), LB, UB, F, df1, df2, icc_Pe_r_R_p(i,1)] = ICC([ALI_pre_R(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
Pe_R6=R6;
Pe_R7=R7;

save(pathD,'r_L','r_R','R6','R1','R2','R7','p_L','p_R','P6','P1','P2','P7','Ml','Mr','M','All_ALI_L','ALI_pre_L','ALI_pre_R','AA','NT','N_pre_L','N_pre_R','A_pre','SFC','icc_Pe','icc_Pe_p','icc_Pe_N','icc_Pe_N_p'); 

