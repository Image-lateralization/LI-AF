sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt');
All_ALI_L=zeros(88,24);
for t=1:length(sbj)
    load(['H:\WM_data\HC\BOLDextract\Txtoutput11\HCActivate\' sbj{t} '.mat']);
    ALI_L=zeros(1,24);
    
    for i=1:24
        ALI_L(i)=(roi(1,i)-roi(1,i+24))/(roi(1,i)+roi(1,i+24));
    end
    All_ALI_L(t,:)=ALI_L;
    
end
All_ALI=[All_ALI_L,All_ALI_L];


NT1=mean(All_ALI_L(:,1:10),2);
NT2=mean(All_ALI_L(:,11:15),2);
NT3=mean(All_ALI_L(:,16:18),2);
NT4=mean(All_ALI_L(:,19:22),2);
NT5=mean(All_ALI_L(:,23:24),2);
NT=[NT1,NT2,NT3,NT4,NT5];


mNT=mean(NT)';
mAll_ALI=mean(All_ALI)';


