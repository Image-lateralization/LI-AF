sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt'); 
All_activate=zeros(88,48); 
for t=1:length(sbj)
    load(['H:\WM_data\HC\BOLDextract\Txtoutput11\HCActivate\' sbj{t} '.mat']);
    All_activate(t,:)=roi;    
end

realLI=zeros(88,24);
for j=1:88
    for i=1:24
        
        realLI(j,i)=(All_activate(j,i)-All_activate(j,i+24))/(All_activate(j,i)+All_activate(j,i+24));
    end
end

NT1=mean(realLI(:,1:10),2);
NT2=mean(realLI(:,11:15),2);
NT3=mean(realLI(:,16:18),2);
NT4=mean(realLI(:,19:22),2);
NT5=mean(realLI(:,23:24),2);
N_realLI=[NT1,NT2,NT3,NT4,NT5];  
NN1=mean(All_activate(:,1:10),2);
NN2=mean(All_activate(:,11:15),2);
NN3=mean(All_activate(:,16:18),2);
NN4=mean(All_activate(:,19:22),2);
NN5=mean(All_activate(:,23:24),2);
NN6=mean(All_activate(:,25:34),2);
NN7=mean(All_activate(:,35:39),2);
NN8=mean(All_activate(:,40:42),2);
NN9=mean(All_activate(:,43:46),2);
NN10=mean(All_activate(:,47:48),2);
NN_realactivate=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];

