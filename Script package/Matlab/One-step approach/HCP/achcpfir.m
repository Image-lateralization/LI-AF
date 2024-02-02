sbj = importdata('H:\HCPdata\LanguageCompute\Txtoutput\sbj.txt'); 
for t=1:length(sbj)
    data=importdata(['H:\HCPdata\LanguageCompute\Txtoutput9\HPCBOLD\' sbj{t} '.txt']);
    times{t,1}=data;
end
Resi=cell(100,1);
for j=1:100
    for i=1:52
        [B, BINT, Resi{j,1}(:,i)] = regress(times{j,1}(:,i), design_new);
    end
end


for t=1:length(sbj)
    path = strcat('H:\HCPdata\LanguageCompute\Txtoutput12\HPCBOLD\',sbj{t},'.txt');
    disp(path);
    dlmwrite(path,Resi{t,1},'delimiter',' ');
end