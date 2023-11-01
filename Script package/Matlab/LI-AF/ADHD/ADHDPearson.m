
pathD=['H:\WM_data\ADHD\BOLDextract\Txtoutput5\r_value_results\''Pearson.mat'];
sbj = importdata('H:\WM_data\RESTADHD\Txtoutput\RESTADHDsbj.txt');
SFC=cell(32,1);
for t=1:length(sbj)
    data=importdata(['H:\WM_data\ADHD\BOLDextract\Txtoutput4\PearsonFC\' sbj{t} '.mat']); 
    SFC{t,1}=data;
end

ALI_pre_L=zeros(32,24);
for i=1:32
    for j=1:24
        if j==1
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}(2:24,j)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(2:24,j)))  ;
        else
            ALI_pre_L(i,j)=dot(abs(SFC{i,1}([1:j-1,j+1:24],j)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([1:j-1,j+1:24],j)))  ;
        end
    end
end
ALI_pre_L(isnan(ALI_pre_L))=0;

ALI_pre_R=zeros(32,24);
for i=1:32
    for j=1:24
        if j==1
        
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}(26:48,j+24)),All_ALI(i,2:24))/sum(abs(SFC{i,1}(26:48,j+24)))  ;
        else
           
            ALI_pre_R(i,j)=dot(abs(SFC{i,1}([25:j+23,j+25:48],j+24)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(SFC{i,1}([25:j+23,j+25:48],j+24)));
        end
    end
end
ALI_pre_R(isnan(ALI_pre_R))=0;

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


allALI=[All_ALI_L,All_ALI_L];
ALI_pre=zeros(32,48);
for i=1:32
    for j=1:48
        if j == 1
           ALI_pre(i,j)=dot(abs(SFC{i,1}(2:48,1,1)),allALI(1,2:48))/sum(abs(SFC{i,1}(2:48,1,1)))  ;
        else
           ALI_pre(i,j)=dot(abs(SFC{i,1}([1:(j-1) (j+1):48],j)),allALI(i,[1:(j-1) (j+1):48]))/sum(abs(SFC{i,1}([1:(j-1) (j+1):48],j)));
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
for i=1:32
    for j=1:24
        if AA(i,j)>=1
            AA(i,j)=1;
        elseif AA(i,j)<=-1
            AA(i,j)=-1;
        end
    end
end
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
rr=zeros(32,1);
pp=zeros(32,1);
for i=1:32
    [rr(i,1),pp(i,1)]=corr(AA(i,:)',All_ALI_L(i,:)');
end
mean(rr)



save(pathD,'r_L','r_R','R6','R1','R2','R7','p_L','p_R','P6','P1','P2','P7','Ml','Mr','M','MM','All_ALI_L','ALI_pre_L','ALI_pre_R','AA','NT','N_pre_L','N_pre_R','A_pre'); 



