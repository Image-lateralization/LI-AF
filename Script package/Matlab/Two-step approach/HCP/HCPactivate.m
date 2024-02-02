sbj = importdata('H:\HCPdata\LanguageCompute\Txtoutput\sbj.txt');
All_activate=zeros(100,40);
for t=1:length(sbj)
   load(['H:\HCPdata\LanguageCompute\Txtoutput\HCActivate\' sbj{t} '.mat']);
   roi1=roi(:,[2 4 5 7:11 14 16:26 28 30 31 33:37 40 42:52]);
   All_activate(t,:)=roi1; 
end
realLI=zeros(100,20);
for j=1:100
    for i=1:20
     realLI(j,i)=(All_activate(j,i)-All_activate(j,i+20))/(All_activate(j,i)+All_activate(j,i+20));
    end
end

NT1=mean(realLI(:,1:5),2);
NT2=mean(realLI(:,6:11),2);
NT3=mean(realLI(:,12:14),2);
NT4=mean(realLI(:,15:17),2);
NT5=mean(realLI(:,18:20),2);
N_realLI=[NT1,NT2,NT3,NT4,NT5];  

NN1=mean(All_activate(:,1:5),2);
NN2=mean(All_activate(:,6:11),2);
NN3=mean(All_activate(:,12:14),2);
NN4=mean(All_activate(:,15:17),2);
NN5=mean(All_activate(:,18:20),2);
NN6=mean(All_activate(:,21:25),2);
NN7=mean(All_activate(:,26:31),2);
NN8=mean(All_activate(:,32:34),2);
NN9=mean(All_activate(:,35:37),2);
NN10=mean(All_activate(:,38:40),2);
NN_realactivate=[NN1,NN2,NN3,NN4,NN5,NN6,NN7,NN8,NN9,NN10];