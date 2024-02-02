
sbj = importdata('H:\HCPdata\LanguageCompute\Txtoutput\sbj.txt'); 
All_ALI_L=zeros(100,20);
for t=1:length(sbj)
    load(['H:\HCPdata\LanguageCompute\Txtoutput11\HCActivate\' sbj{t} '.mat']);
    roi1=roi(:,[2 4 5 7:11 14 16:26 28 30 31 33:37 40 42:52]);
    ALI_L=zeros(1,20);
    for i=1:20
        ALI_L(i)=(roi1(1,i)-roi1(1,i+20))/(roi1(1,i)+roi1(1,i+20));
    end
    All_ALI_L(t,:)=ALI_L;
    
end

All_ALI=[All_ALI_L,All_ALI_L];

NT1=mean(All_ALI_L(:,1:5),2);  
NT2=mean(All_ALI_L(:,6:11),2);  
NT3=mean(All_ALI_L(:,12:14),2);  
NT4=mean(All_ALI_L(:,15:17),2);  
NT5=mean(All_ALI_L(:,18:20),2);  
NT=[NT1,NT2,NT3,NT4,NT5];
mAll_ALI_L=mean(All_ALI_L);





