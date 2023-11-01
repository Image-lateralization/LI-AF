%Language

%% ====== desing matrix define =======
% story 4, math 4,   316/(4+4) = 39.5 â‰? 40(TR)
design=zeros(320,40*2);  % 316 = 320 - 4  TR = 0.72,  40*0.72 = 28.8s
Story = [0 2 4 6];
Math = [1 3 5 7];

for s = 0:2:6
    for i = 1:40
            design(s*40+i,i) = 1;
        end
    
end


for m = 1:2:7
    for i = 1:40
            design(m*40+i,i+40) = 1;
    end
 
end
design_new=design(1:316,:);

%% ====== regress by design_new =======


%[B, BINT, R] = regress(ts, design_new);

%plot(1:316, ts , '-r', 1:316, R, '--b');

%plot(design_new);

sbj = importdata('H:\HCPdata\LanguageCompute\Txtoutput\sbj.txt'); 
for t=1:length(sbj)
    data=importdata(['H:\HCPdata\LanguageCompute\Txtoutput\HCBOLD\' sbj{t} '.txt']);
    times{t,1}=data;
end
Resi=cell(100,1);
for j=1:100
    for i=1:52
        [B, BINT, Resi{j,1}(:,i)] = regress(times{j,1}(:,i), design_new);
    end
end
for t=1:length(sbj)
    path = strcat('H:\HCPdata\LanguageCompute\Txtoutput11\HCBOLD\',sbj{t},'.txt');
    disp(path);
    dlmwrite(path,Resi{t,1},'delimiter',' ');

%     dlmrite(strcat('H:\WM_data\HC\BOLDextract\Txtoutput11\HCBOLD\',sbj{t},'.txt'),Resi{t,1},'delimiter',' ');
end
pathD=['H:\HCPdata\LanguageCompute\Txtoutput11\''LanguageDesign.mat'];
save(pathD,'design_new')

