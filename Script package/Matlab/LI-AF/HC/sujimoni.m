r_L=zeros(24,10000);
p_L=zeros(24,10000);
r_R=zeros(24,10000);
p_R=zeros(24,10000);
R1=zeros(5,10000);
P1=zeros(5,10000);
R2=zeros(5,10000);
P2=zeros(5,10000);
R3=zeros(10,10000);
P3=zeros(10,10000);
R=zeros(48,10000);
P=zeros(48,10000);
R6=zeros(24,10000);
P6=zeros(24,10000);
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
    %[mulFC_new]=randomed111(mulFC);
    [mulFC_new]=randomed111(SFC);
    %[mulFC_new]=randomed111(partialFC);
    %[mulFC_new]=randomed111(CombinedFC);


    %ALI_pre_L=zeros(88,24);
    for i=1:88
        for j=1:24
            if j==1
                ALI_pre_L{r,1}(i,j)=dot(abs(mulFC_new{i,1}(2:24,j)),All_ALI(i,2:24))/sum(abs(mulFC_new{i,1}(2:24,j)))  ;
            else
                ALI_pre_L{r,1}(i,j)=dot(abs(mulFC_new{i,1}([1:j-1,j+1:24],j)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(mulFC_new{i,1}([1:j-1,j+1:24],j)));
            end
        end
    end
   ALI_pre_L{r,1}(isnan(ALI_pre_L{r,1}))=0;

    %ALI_pre_R=zeros(88,24);
    for i=1:88
        for j=1:24
            if j==1
              
                ALI_pre_R{r,1}(i,j)=dot(abs(mulFC_new{i,1}(26:48,j+24)),All_ALI(i,2:24))/sum(abs(mulFC_new{i,1}(26:48,j+24)))  ;
            else
              
                ALI_pre_R{r,1}(i,j)=dot(abs(mulFC_new{i,1}([25:j+23,j+25:48],j+24)),All_ALI(i,[1:j-1,j+1:24]))/sum(abs(mulFC_new{i,1}([25:j+23,j+25:48],j+24)));
            end
        end
    end
    ALI_pre_R{r,1}(isnan(ALI_pre_R{r,1}))=0;
  
    for i=1:24
        [r_L(i,r), LB, UB, F, df1, df2, p] = ICC([ALI_pre_L{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end

    for i=1:24
        [r_R(i,r), LB, UB, F, df1, df2, p] = ICC([ALI_pre_R{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end
    
    N1=mean(ALI_pre_L{r,1}(:,1:10),2);
    N2=mean(ALI_pre_L{r,1}(:,11:15),2);
    N3=mean(ALI_pre_L{r,1}(:,16:18),2);
    N4=mean(ALI_pre_L{r,1}(:,19:22),2);
    N5=mean(ALI_pre_L{r,1}(:,23:24),2);
    N_pre_L{r,1}=[N1,N2,N3,N4,N5];
    NN1=mean(All_ALI_L(:,1:10),2);
    NN2=mean(All_ALI_L(:,11:15),2);
    NN3=mean(All_ALI_L(:,16:18),2);
    NN4=mean(All_ALI_L(:,19:22),2);
    NN5=mean(All_ALI_L(:,23:24),2);
    N_real_L=[NN1,NN2,NN3,NN4,NN5];
   
    
    for i=1:5
        [R1(i,r), LB, UB, F, df1, df2, p] = ICC([N_pre_L{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end
    NN1=mean(ALI_pre_R{r,1}(:,1:10),2);
    NN2=mean(ALI_pre_R{r,1}(:,11:15),2);
    NN3=mean(ALI_pre_R{r,1}(:,16:18),2);
    NN4=mean(ALI_pre_R{r,1}(:,19:22),2);
    NN5=mean(ALI_pre_R{r,1}(:,23:24),2);
    N_pre_R{r,1}=[NN1,NN2,NN3,NN4,NN5];
    NNN1=mean(All_ALI_L(:,1:10),2);
    NNN2=mean(All_ALI_L(:,11:15),2);
    NNN3=mean(All_ALI_L(:,16:18),2);
    NNN4=mean(All_ALI_L(:,19:22),2);
    NNN5=mean(All_ALI_L(:,23:24),2);
    N_real_R=[NNN1,NNN2,NNN3,NNN4,NNN5];
    
  
    for i=1:5
        [R2(i,r), LB, UB, F, df1, df2, p] = ICC([N_pre_R{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end

   
    allALI=[All_ALI_L,All_ALI_L];
    %ALI_pre=zeros(88,48);
    for i=1:88
        for j=1:48
            if j == 1
                ALI_pre{r,1}(i,j)=dot(abs(mulFC_new{i,1}(2:48,1,1)),allALI(1,2:48))/sum(abs(mulFC_new{i,1}(2:48,1,1)))  ;
            else
                ALI_pre{r,1}(i,j)=dot(abs(mulFC_new{i,1}([1:(j-1) (j+1):48],j)),allALI(i,[1:(j-1) (j+1):48]))/sum(abs(mulFC_new{i,1}([1:(j-1) (j+1):48],j)));
            end
        end
    end  
    ALI_pre{r,1}(isnan(ALI_pre{r,1}))=0;
    All_ALI=[All_ALI_L,All_ALI_L];
    
    for i=1:48
        [R(i,r),P(i,r)]=corr(ALI_pre{r,1}(:,i),All_ALI(:,i));
    end
    NN1=mean(ALI_pre{r,1}(:,1:10),2);
    NN2=mean(ALI_pre{r,1}(:,11:15),2);
    NN3=mean(ALI_pre{r,1}(:,16:18),2);
    NN4=mean(ALI_pre{r,1}(:,19:22),2);
    NN5=mean(ALI_pre{r,1}(:,23:24),2);
    NN6=mean(ALI_pre{r,1}(:,25:34),2);
    NN7=mean(ALI_pre{r,1}(:,35:39),2);
    NN8=mean(ALI_pre{r,1}(:,40:42),2);
    NN9=mean(ALI_pre{r,1}(:,43:46),2);
    NN10=mean(ALI_pre{r,1}(:,47:48),2);
    NN_pre{r,1}=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];
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
    
    for i=1:10
        [R3(i,r),P3(i,r)]=corr(NN_pre{r,1}(:,i),NN_real(:,i));
    end
    
    AA{r,1}=(ALI_pre{r,1}(:,1:24)+ALI_pre{r,1}(:,25:48))/2;
    
    %for i=1:24
     %   [R6(i,r),P6(i,r)]=corr(AA{r,1}(:,i),All_ALI_L(:,i));
    
    %end
    for i=1:24
        [R6(i,r), LB, UB, F, df1, df2, p] = ICC([AA{r,1}(:,i),All_ALI_L(:,i)], 'A-1',0.05,0);
    end
    
    A1=mean(AA{r,1}(:,1:10),2);
    A2=mean(AA{r,1}(:,11:15),2);
    A3=mean(AA{r,1}(:,16:18),2);
    A4=mean(AA{r,1}(:,19:22),2);
    A5=mean(AA{r,1}(:,23:24),2);
    A_pre{r,1}=[A1,A2,A3,A4,A5];
    
    %for i=1:5
     %   [R7(i,r),P7(i,r)]=corr(A_pre{r,1}(:,i),N_real_L(:,i));
    
    %end
    for i=1:5
        [R7(i,r), LB, UB, F, df1, df2, p] = ICC([A_pre{r,1}(:,i),N_real_L(:,i)], 'A-1',0.05,0);
    end

end
pathD=['H:\WM_data\HC\BOLDextract\Txtoutput5\moni_results\''suijimoniPearson.mat'];
%pathD=['H:\WM_data\HC\BOLDextract\Txtoutput5\moni_results\''suijimoniCombinedFC.mat'];
%pathD=['H:\WM_data\HC\BOLDextract\Txtoutput5\moni_results\''suijimonipartialFC.mat'];
%pathD=['H:\WM_data\HC\BOLDextract\Txtoutput5\moni_results\''suijimonimulFC.mat'];


save(pathD,'r_L','r_R','R6','R1','R2','R7');

C1=mean(r_L);
hist(C1,20);
title('Left');

C2=mean(r_R);
hist(C2,20);
title('Right');

L1=0.365;
C3=mean(R6);
hist(C3,20);
title('Prediction by Pearson');
%title('Prediction by MulReg');
%title('Prediction by Partial');
%title('Prediction by Combined');

hold on
plot([L1 L1],[0,2000],'r-');



C4=mean(R1);
hist(C4,20);
title('left');

C5=mean(R2);
hist(C5,20);
title('Right');

C6=mean(R7);
hist(C6,20);
title('Whole');



mALI_pre_L=zeros(88,24);
for i=1:10000
    mALI_pre_L=ALI_pre_L{i,1}+mALI_pre_L;
end
mmALI_pre_L=mALI_pre_L/10000;

mALI_pre_R=zeros(88,24);
for i=1:10000
    mALI_pre_R=ALI_pre_R{i,1}+mALI_pre_R;
end
mmALI_pre_R=mALI_pre_R/10000;

mAA=zeros(88,24);
for i=1:10000
    mAA=AA{i,1}+mAA;
end
mmAA=mAA/10000;
imagesc(mmALI_pre_L);
imagesc(mmALI_pre_R);
imagesc(mmAA);
imagesc(All_ALI_L);

