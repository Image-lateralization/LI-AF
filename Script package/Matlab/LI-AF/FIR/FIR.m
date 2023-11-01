%WM
ts = randn(287,1);    % 287 TR
onset = [1 7 13 19];  % TR =2, there were 4 conditions
n_FIR = 6;

design=zeros(287,24);
Load=[3 5 1 3 1 1 7 3 5 7 5 5 3 5 3 7 1 7 1 5 3 1 7 7 1 5 7 1 7 5 3 7 1 7 1 7 1 5 3 3 5 3 3 3 7 5 1 5 ];
for i=1:48
    if Load(i)==1
        for m=(6*i-5)
             design(m,1)=1;
        end
        for m=(6*i-4)
             design(m,2)=1;          
        end
         for m=(6*i-3)
             design(m,3)=1;          
        end
        for m=(6*i-2)
            design(m,4)=1;          
        end
        for m=(6*i-1)
            design(m,5)=1;          
        end
        for m=(6*i)
             design(m,6)=1;          
        end
    end
    if Load(i)==3
        for m=(6*i-5)
             design(m,7)=1;
        end
        for m=(6*i-4)
             design(m,8)=1;          
        end
         for m=(6*i-3)
             design(m,9)=1;          
        end
        for m=(6*i-2)
            design(m,10)=1;          
        end
        for m=(6*i-1)
            design(m,11)=1;          
        end
        for m=(6*i)
             design(m,12)=1;          
        end
    end
    if Load(i)==5
        for m=(6*i-5)
             design(m,13)=1;
        end
        for m=(6*i-4)
             design(m,14)=1;          
        end
         for m=(6*i-3)
             design(m,15)=1;          
        end
        for m=(6*i-2)
            design(m,16)=1;          
        end
        for m=(6*i-1)
            design(m,17)=1;          
        end
        for m=(6*i)
             design(m,18)=1;          
        end
    end
    if Load(i)==7
        for m=(6*i-5)
             design(m,19)=1;
        end
        for m=(6*i-4)
             design(m,20)=1;          
        end
         for m=(6*i-3)
             design(m,21)=1;          
        end
        for m=(6*i-2)
            design(m,22)=1;          
        end
        for m=(6*i-1)
            design(m,23)=1;          
        end
        for m=(6*i)
             design(m,24)=1;          
        end
    end
end

design_new=design(1:287,:);

[B, BINT, R] = regress(ts, design_new);

plot(1:287, ts , '-r', 1:287, R, '--b');

plot(design_new);

sbj = importdata('H:\WM_data\HC\BOLDextract\Txtoutput4\HCsbj.txt'); 
for t=1:length(sbj)
    data=importdata(['H:\WM_data\HC\BOLDextract\Txtoutput4\HCBOLD\' sbj{t} '.txt']);
    times{t,1}=data;
end
Resi=cell(88,1);
for j=1:88
    for i=1:48
        [B, BINT, Resi{j,1}(:,i)] = regress(times{j,1}(:,i), design_new);
    end
end

pathD=['H:\WM_data\HC\BOLDextract\Txtoutput11\''WMDesign.mat'];
save(pathD,'design_new')



for t=1:length(sbj)
    path = strcat('H:\WM_data\HC\BOLDextract\Txtoutput11\HCBOLD\',sbj{t},'.txt');
    disp(path);
    dlmwrite(path,Resi{t,1},'delimiter',' ');

%     dlmrite(strcat('H:\WM_data\HC\BOLDextract\Txtoutput11\HCBOLD\',sbj{t},'.txt'),Resi{t,1},'delimiter',' ');
end

