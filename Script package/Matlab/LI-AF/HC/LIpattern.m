function [M]=LIpattern(mAA)
M=zeros(116,1);
for i=1:116
    if (i==1 || i==2)
        M(i,1)=mAA(1,1);
    elseif (i==3 || i==4)
        M(i,1)=mAA(4,1);
    elseif (i==5 || i==6)
        M(i,1)=mAA(9,1);
    elseif (i==7 || i==8)
        M(i,1)=mAA(10,1);
    elseif (i==9 || i==10)
        M(i,1)=mAA(5,1);   
    elseif (i==11 || i==12)
        M(i,1)=mAA(6,1);
    elseif (i==13 || i==14)
        M(i,1)=mAA(7,1);  
    elseif (i==15 || i==16)
        M(i,1)=mAA(8,1);   
    elseif (i==19 || i==20)
        M(i,1)=mAA(8,1);   
    elseif (i==33 || i==34)
        M(i,1)=mAA(2,1);
    elseif (i==59 || i==60)
        M(i,1)=mAA(11,1);
    elseif (i==61 || i==62)
        M(i,1)=mAA(12,1);
    elseif (i==65 || i==66)
        M(i,1)=mAA(13,1); 
    elseif (i==63 || i==64)
        M(i,1)=mAA(15,1); 
    elseif (i==67 || i==68)
        M(i,1)=mAA(14,1);
    elseif (i==49 || i==50)
        M(i,1)=mAA(16,1);
    elseif (i==51 || i==52)
        M(i,1)=mAA(17,1);
    elseif (i==53 || i==54)
        M(i,1)=mAA(18,1);
    elseif (i==29 || i==30)
        M(i,1)=mAA(19,1);
    elseif (i==73 || i==74)
        M(i,1)=mAA(20,1);
    elseif (i==71 || i==72)
        M(i,1)=mAA(21,1);
    elseif (i==77|| i==78)
        M(i,1)=mAA(22,1);
    elseif (i==85|| i==86)
        M(i,1)=mAA(23,1);
     elseif (i==83|| i==84)
        M(i,1)=mAA(24,1);
    end
end
end