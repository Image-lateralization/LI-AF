
function [mulFC_new]=randomed11(mulFC)
    mulFC_new=cell(100,1);
    for i=1:100
        temp = reshape(mulFC{i,1},1,[]);
        idx = randperm(length(temp));
        temp = temp(idx);
        [p,q] = size(mulFC{i,1});
        mulFC_new{i,1}=reshape(temp,p,q);
    end
end