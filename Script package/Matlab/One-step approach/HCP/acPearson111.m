pathD=['H:\HCPdata\LanguageCompute\Txtoutput12\r_value_results2\''Pearson.mat'];
sbj = importdata('H:\HCPdata\LanguageCompute\Txtoutput\sbj.txt'); 
SFC=cell(100,1);
for t=1:length(sbj)
    t
    data=importdata(['H:\HCPdata\LanguageCompute\Txtoutput12\PearsonFC\' sbj{t} '.mat']);
    data1=data([2 4 5 7:11 14 16:26 28 30 31 33:37 40 42:52],[2 4 5 7:11 14 16:26 28 30 31 33:37 40 42:52]);
    SFC{t,1}=data1;
end

ALI_pre_L=zeros(100,20);
for i=1:100
    for j=1:20
        if j==1
         
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}(2:20,j)),All_ALI(i,2:20))/sum(abs(SFC{i,1}(2:20,j)))  ;
        else
           
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}([1:j-1,j+1:20],j)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(SFC{i,1}([1:j-1,j+1:20],j)))  ;
        end
    end
end
ALI_pre_L(isnan(ALI_pre_L))=0;
ALI_pre_L_2=zeros(100,20);
for i=1:100
    for j=1:20
        if j==1
         
            ALI_pre_L_2(i,j)=dot(abs(SFC{i,1}(2:20,j+20)),All_ALI(i,2:20))/sum(abs(SFC{i,1}(2:20,j+20)))  ;
        else
          
            ALI_pre_L_2(i,j)=dot(abs(SFC{i,1}([1:j-1,j+1:20],j+20)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(SFC{i,1}([1:j-1,j+1:20],j+20)))  ;
        end
    end
end
ALI_pre_L_2(isnan(ALI_pre_L_2))=0;

LL=(ALI_pre_L(:,1:20)+ALI_pre_L_2(:,1:20))/2;
LL(isnan(LL))=0;

icc_LL=zeros(20,1);
icc_LL_p=zeros(20,1);
for i=1:20
    [icc_LL(i,1), LB, UB, F, df1, df2, icc_LL_p(i,1)] = ICC([LL(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end


ALI_pre_R=zeros(100,20);
for i=1:100
    for j=1:20
        if j==1
      
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}(22:40,j+20)),All_ALI(i,2:20))/sum(abs(SFC{i,1}(22:40,j+20)))  ;
        else
   
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}([21:j+19,j+21:40],j+20)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(SFC{i,1}([21:j+19,j+21:40],j+20)));
        end
    end
end
ALI_pre_R(isnan(ALI_pre_R))=0;
ALI_pre_R_2=zeros(100,20);
for i=1:100
    for j=1:20
        if j==1
      
            ALI_pre_R_2(i,j)=dot(abs(SFC{i,1}(22:40,j)),All_ALI(i,2:20))/sum(abs(SFC{i,1}(22:40,j)))  ;
        else
   
            ALI_pre_R_2(i,j)=dot(abs(SFC{i,1}([21:j+19,j+21:40],j)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(SFC{i,1}([21:j+19,j+21:40],j)));
        end
    end
end
ALI_pre_R_2(isnan(ALI_pre_R_2))=0;

RR=(ALI_pre_R(:,1:20)+ALI_pre_R_2(:,1:20))/2;
RR(isnan(RR))=0;

icc_RR=zeros(20,1);
icc_RR_p=zeros(20,1);
for i=1:20
    [icc_RR(i,1), LB, UB, F, df1, df2, icc_RR_p(i,1)] = ICC([RR(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end

r_L=zeros(1,20);
p_L=zeros(1,20);
for i=1:20
    [r_L(1,i),p_L(1,i)]=corr(ALI_pre_L(:,i),All_ALI_L(:,i));
end

r_R=zeros(1,20);
p_R=zeros(1,20);
for i=1:20
    [r_R(1,i),p_R(1,i)]=corr(ALI_pre_R(:,i),All_ALI_L(:,i));
end
N1=mean(ALI_pre_L(:,1:5),2);
N2=mean(ALI_pre_L(:,6:11),2);
N3=mean(ALI_pre_L(:,12:14),2);
N4=mean(ALI_pre_L(:,15:17),2);
N5=mean(ALI_pre_L(:,18:20),2);
N_pre_L=[N1,N2,N3,N4,N5];
NN1=mean(All_ALI_L(:,1:5),2);
NN2=mean(All_ALI_L(:,6:11),2);
NN3=mean(All_ALI_L(:,12:14),2);
NN4=mean(All_ALI_L(:,15:17),2);
NN5=mean(All_ALI_L(:,18:20),2);
N_real_L=[NN1,NN2,NN3,NN4,NN5];
R1=zeros(1,5);
P1=zeros(1,5);
for i=1:5
    [R1(1,i),P1(1,i)]=corr(N_pre_L(:,i),N_real_L(:,i));
end

NN1=mean(ALI_pre_R(:,1:5),2);
NN2=mean(ALI_pre_R(:,6:11),2);
NN3=mean(ALI_pre_R(:,12:14),2);
NN4=mean(ALI_pre_R(:,15:17),2);
NN5=mean(ALI_pre_R(:,18:20),2);
N_pre_R=[NN1,NN2,NN3,NN4,NN5];
NNN1=mean(All_ALI_L(:,1:5),2);
NNN2=mean(All_ALI_L(:,6:11),2);
NNN3=mean(All_ALI_L(:,12:14),2);
NNN4=mean(All_ALI_L(:,15:17),2);
NNN5=mean(All_ALI_L(:,18:20),2);
N_real_R=[NNN1,NNN2,NNN3,NNN4,NNN5];
R2=zeros(1,5);
P2=zeros(1,5);
for i=1:5
    [R2(1,i),P2(1,i)]=corr(N_pre_R(:,i),N_real_L(:,i));
end

allALI=[All_ALI_L,All_ALI_L];
ALI_pre=zeros(100,40);
for i=1:100
    for j=1:40
        if j == 1
           
          ALI_pre(i,j)=dot(abs(SFC{i,1}([2:20 22:40],1)),allALI(1,[2:20 22:40]))/sum(abs(SFC{i,1}([2:20 22:40],1))); 
        elseif j<=20
 
           ALI_pre(i,j)=dot(abs(SFC{i,1}([1:(j-1) (j+1):(j+19) (j+21):40],j)),allALI(i,[1:(j-1) (j+1):(j+19) (j+21):40]))/sum(abs(SFC{i,1}([1:(j-1) (j+1):(j+19) (j+21):40],j)));
        else 
           ALI_pre(i,j)=dot(abs(SFC{i,1}([1:(j-21) (j-19):(j-1) (j+1):40],j)),allALI(i,[1:(j-21) (j-19):(j-1) (j+1):40]))/sum(abs(SFC{i,1}([1:(j-21) (j-19):(j-1) (j+1):40],j)));
        end
    end
end

ALI_pre(isnan(ALI_pre))=0;
All_ALI=[All_ALI_L,All_ALI_L];

R=zeros(1,40);
P=zeros(1,40);
for i=1:40
    [R(1,i),P(1,i)]=corr(ALI_pre(:,i),All_ALI(:,i));
end
NN1=mean(ALI_pre(:,1:5),2);
NN2=mean(ALI_pre(:,6:11),2);
NN3=mean(ALI_pre(:,12:14),2);
NN4=mean(ALI_pre(:,15:17),2);
NN5=mean(ALI_pre(:,18:20),2);
NN6=mean(ALI_pre(:,21:25),2);
NN7=mean(ALI_pre(:,26:31),2);
NN8=mean(ALI_pre(:,32:34),2);
NN9=mean(ALI_pre(:,35:37),2);
NN10=mean(ALI_pre(:,38:40),2);
NN_pre=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];
NNN1=mean(allALI(:,1:5),2);
NNN2=mean(allALI(:,6:11),2);
NNN3=mean(allALI(:,12:14),2);
NNN4=mean(allALI(:,15:17),2);
NNN5=mean(allALI(:,18:20),2);
NNN6=mean(allALI(:,21:25),2);
NNN7=mean(allALI(:,26:31),2);
NNN8=mean(allALI(:,32:34),2);
NNN9=mean(allALI(:,35:37),2);
NNN10=mean(allALI(:,38:40),2);
NN_real=[NNN1,NNN2,NNN3,NNN4,NNN5,NNN6,NNN7,NNN8,NNN9,NNN10];
R3=zeros(1,10);
P3=zeros(1,10);
for i=1:10
    [R3(1,i),P3(1,i)]=corr(NN_pre(:,i),NN_real(:,i));
end

AA=(ALI_pre(:,1:20)+ALI_pre(:,21:40))/2;
R6=zeros(20,1);
P6=zeros(20,1);
for i=1:20
    [R6(i,1),P6(i,1)]=corr(AA(:,i),All_ALI_L(:,i));
    
end
A1=mean(AA(:,1:5),2);
A2=mean(AA(:,6:11),2);
A3=mean(AA(:,12:14),2);
A4=mean(AA(:,15:17),2);
A5=mean(AA(:,18:20),2);
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

LIpattern2(mAA);
[M]=LIpattern2(mAA);
[Mr]=LIpattern2(mean(ALI_pre_R)');
[Ml]=LIpattern2(mean(ALI_pre_L)');

rr=zeros(100,1);
pp=zeros(100,1);
for i=1:100
    [rr(i,1),pp(i,1)]=corr(AA(i,:)',All_ALI_L(i,:)');
end
mean(rr)


icc_Pe=zeros(20,1);
icc_Pe_p=zeros(20,1);
for i=1:20
    [icc_Pe(i,1), LB, UB, F, df1, df2, icc_Pe_p(i,1)] = ICC([AA(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
icc_Pe_N=zeros(5,1);
icc_Pe_N_p=zeros(5,1);
for i=1:5
    [icc_Pe_N(i,1), LB, UB, F, df1, df2, icc_Pe_N_p(i,1)] = ICC([A_pre(:,i),NT(:,i)], 'A-1',0.05,0);
end
icc_Pe_r_L=zeros(20,1);
icc_Pe_r_L_p=zeros(20,1);
for i=1:20
    [icc_Pe_r_L(i,1), LB, UB, F, df1, df2, icc_Pe_r_L_p(i,1)] = ICC([ALI_pre_L(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
icc_Pe_r_R=zeros(20,1);
icc_Pe_r_R_p=zeros(20,1);
for i=1:20
    [icc_Pe_r_R(i,1), LB, UB, F, df1, df2, icc_Pe_r_R_p(i,1)] = ICC([ALI_pre_R(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
end
save(pathD,'r_L','r_R','R6','R1','R2','R7','p_L','p_R','P6','P1','P2','P7','Ml','Mr','M','All_ALI_L','ALI_pre_L','ALI_pre_R','AA','NT','N_pre_L','N_pre_R','A_pre','SFC','icc_Pe','icc_Pe_p','icc_Pe_N','icc_Pe_N_p'); 

Pe_R6=R6;
Pe_R7=R7;