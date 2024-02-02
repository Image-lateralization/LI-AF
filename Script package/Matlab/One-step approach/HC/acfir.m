sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt'); 
for t=1:length(sbj)
    data=importdata(['H:\WM_data\HC\BOLDextract\Txtoutput9\HCBOLD\' sbj{t} '.txt']);
    times{t,1}=data;
end
Resi=cell(88,1);
for j=1:88
    for i=1:48
        [B, BINT, Resi{j,1}(:,i)] = regress(times{j,1}(:,i), design_new);
    end
end

for t=1:length(sbj)
    path = strcat('H:\WM_data\HC\BOLDextract\Txtoutput12\HCBOLD\',sbj{t},'.txt');
    disp(path);
    dlmwrite(path,Resi{t,1},'delimiter',' ');
end