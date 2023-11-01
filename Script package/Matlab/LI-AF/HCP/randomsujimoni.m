r_L=zeros(20,10000);
p_L=zeros(20,10000);
r_R=zeros(20,10000);
p_R=zeros(20,10000);
R1=zeros(5,10000);
P1=zeros(5,10000);
R2=zeros(5,10000);
P2=zeros(5,10000);
R3=zeros(10,10000);
P3=zeros(10,10000);
R=zeros(40,10000);
P=zeros(40,10000);
R6=zeros(20,10000);
P6=zeros(20,10000);
R7=zeros(5,10000);
P7=zeros(5,10000);
ALI_pre_L=cell(10000,1);
ALI_pre_R=cell(10000,1);
N_pre_L=cell(10000,1);
N_pre_R=cell(10000,1);
ALI_pre=cell(10000,1);
NN_pre=cell(10000,1);
AA=cell(10000,1);
A_pre=cell(10000,1);

for r=1:10000
    r
    %[mulFC_new]=randomed11(mulFC);
    [mulFC_new]=randomed11(SFC);
    %[mulFC_new]=randomed11(partialFC);
    %[mulFC_new]=randomed11(CombinedFC);
    %[mulFC_new]=randomed11(GrangerFC);
    
    
    
    for i=1:100
        for j=1:20
            if j==1
                ALI_pre_L{r,1}(i,j)=dot(abs(mulFC_new{i,1}(2:20,j)),All_ALI(i,2:20))/sum(abs(mulFC_new{i,1}(2:20,j)));
            else
                ALI_pre_L{r,1}(i,j)=dot(abs(mulFC_new{i,1}([1:j-1,j+1:20],j)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(mulFC_new{i,1}([1:j-1,j+1:20],j)))  ;
            end
        end
    end
     ALI_pre_L{r,1}(isnan(ALI_pre_L{r,1}))=0;
   
    for i=1:100
        for j=1:20
            if j==1
                
                ALI_pre_R{r,1}(i,j)=dot(abs(mulFC_new{i,1}(22:40,j+20)),All_ALI(i,2:20))/sum(abs(mulFC_new{i,1}(22:40,j+20)));
            else
              
                ALI_pre_R{r,1}(i,j)=dot(abs(mulFC_new{i,1}([21:j+19,j+21:40],j+20)),All_ALI(i,[1:j-1,j+1:20]))/sum(abs(mulFC_new{i,1}([21:j+19,j+21:40],j+20)));
            end
        end
    end
  ALI_pre_R{r,1}(isnan(ALI_pre_R{r,1}))=0;
  
    for i=1:20
        [r_L(i,r), LB, UB, F, df1, df2, p] = ICC([ALI_pre_L{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end
    

    for i=1:20
        [r_R(i,r), LB, UB, F, df1, df2, p] = ICC([ALI_pre_R{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end
    N1=mean(ALI_pre_L{r,1}(:,1:5),2);
    N2=mean(ALI_pre_L{r,1}(:,6:11),2);
    N3=mean(ALI_pre_L{r,1}(:,12:14),2);
    N4=mean(ALI_pre_L{r,1}(:,15:17),2);
    N5=mean(ALI_pre_L{r,1}(:,18:20),2);
    N_pre_L{r,1}=[N1,N2,N3,N4,N5];
    NN1=mean(All_ALI_L(:,1:5),2);
    NN2=mean(All_ALI_L(:,6:11),2);
    NN3=mean(All_ALI_L(:,12:14),2);
    NN4=mean(All_ALI_L(:,15:17),2);
    NN5=mean(All_ALI_L(:,18:20),2);
    N_real_L=[NN1,NN2,NN3,NN4,NN5];
   
  
     for i=1:5
        [R1(i,r), LB, UB, F, df1, df2, p] = ICC([N_pre_L{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end

    NN1=mean(ALI_pre_R{r,1}(:,1:5),2);
    NN2=mean(ALI_pre_R{r,1}(:,6:11),2);
    NN3=mean(ALI_pre_R{r,1}(:,12:14),2);
    NN4=mean(ALI_pre_R{r,1}(:,15:17),2);
    NN5=mean(ALI_pre_R{r,1}(:,18:20),2);
    N_pre_R{r,1}=[NN1,NN2,NN3,NN4,NN5];
    NNN1=mean(All_ALI_L(:,1:5),2);
    NNN2=mean(All_ALI_L(:,6:11),2);
    NNN3=mean(All_ALI_L(:,12:14),2);
    NNN4=mean(All_ALI_L(:,15:17),2);
    NNN5=mean(All_ALI_L(:,18:20),2);
    N_real_R=[NNN1,NNN2,NNN3,NNN4,NNN5];
    
   
    for i=1:5
        [R2(i,r), LB, UB, F, df1, df2, p] = ICC([N_pre_R{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end


    allALI=[All_ALI_L,All_ALI_L];
  
    for i=1:100
        for j=1:40
            if j == 1
                ALI_pre{r,1}(i,j)=dot(abs(mulFC_new{i,1}(2:40,1,1)),allALI(1,2:40))/sum(abs(mulFC_new{i,1}(2:40,1,1)))  ;
            else
                ALI_pre{r,1}(i,j)=dot(abs(mulFC_new{i,1}([1:(j-1) (j+1):40],j)),allALI(i,[1:(j-1) (j+1):40]))/sum(abs(mulFC_new{i,1}([1:(j-1) (j+1):40],j)));
            end
        end
    end
    ALI_pre{r,1}(isnan(ALI_pre{r,1}))=0;
    All_ALI=[All_ALI_L,All_ALI_L];
     
    for i=1:40
        [R(i,r),P(i,r)]=corr(ALI_pre{r,1}(:,i),All_ALI(:,i));
    end
    
    NN1=mean(ALI_pre{r,1}(:,1:5),2);
    NN2=mean(ALI_pre{r,1}(:,6:11),2);
    NN3=mean(ALI_pre{r,1}(:,12:14),2);
    NN4=mean(ALI_pre{r,1}(:,15:17),2);
    NN5=mean(ALI_pre{r,1}(:,18:20),2);
    NN6=mean(ALI_pre{r,1}(:,21:25),2);
    NN7=mean(ALI_pre{r,1}(:,26:31),2);
    NN8=mean(ALI_pre{r,1}(:,32:34),2);
    NN9=mean(ALI_pre{r,1}(:,35:37),2);
    NN10=mean(ALI_pre{r,1}(:,38:40),2);
    NN_pre{r,1}=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];
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
    
    for i=1:10
        [R3(i,r),P3(i,r)]=corr(NN_pre{r,1}(:,i),NN_real(:,i));
    end
    
    AA{r,1}=(ALI_pre{r,1}(:,1:20)+ALI_pre{r,1}(:,21:40))/2;
    
   
    for i=1:20
        [R6(i,r), LB, UB, F, df1, df2, p] = ICC([AA{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end
    A1=mean(AA{r,1}(:,1:5),2);
    A2=mean(AA{r,1}(:,6:11),2);
    A3=mean(AA{r,1}(:,12:14),2);
    A4=mean(AA{r,1}(:,15:17),2);
    A5=mean(AA{r,1}(:,18:20),2);
    A_pre{r,1}=[A1,A2,A3,A4,A5];
    
  
    for i=1:5
        [R7(i,r), LB, UB, F, df1, df2, p] = ICC([A_pre{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end


end
pathD=['H:\HCPdata\LanguageCompute\Txoutput2\moni_results\''suijimoniPearson.mat'];
%pathD=['H:\HCPdata\LanguageCompute\Txoutput2\moni_results\''suijimoniCombinedFC.mat'];
%pathD=['H:\HCPdata\LanguageCompute\Txoutput2\moni_results\''suijimonipartialFC.mat'];
%pathD=['H:\HCPdata\LanguageCompute\Txoutput2\moni_results\''suijimonimulFC.mat'];


save(pathD,'r_L','r_R','R6','R1','R2','R7');

C1=mean(r_L);
hist(C1,20);
title('Left');

C2=mean(r_R);
hist(C2,20);
title('Right');

L1=0.3646;
C3=mean(R6);
hist(C3,20);
title('Prediction by Pearson');
%title('Prediction by MulReg');
%title('Prediction by Partial');
%title('Prediction by Combined');

hold on
plot([L1 L1],[0,1800],'r-');

C4=mean(R1);
hist(C4,20);
title('left');

C5=mean(R2);
hist(C5,20);
title('Right');

C6=mean(R7);
hist(C6,20);
title('Whole');



mALI_pre_L=zeros(100,20);
for i=1:10000
    mALI_pre_L=ALI_pre_L{i,1}+mALI_pre_L;
end
mmALI_pre_L=mALI_pre_L/10000;

mALI_pre_R=zeros(100,20);
for i=1:10000
    mALI_pre_R=ALI_pre_R{i,1}+mALI_pre_R;
end
mmALI_pre_R=mALI_pre_R/10000;

mAA=zeros(100,20);
for i=1:10000
    mAA=AA{i,1}+mAA;
end
mmAA=mAA/10000;
imagesc(mmALI_pre_L);
imagesc(mmALI_pre_R);
imagesc(mmAA);
imagesc(All_ALI_L);

