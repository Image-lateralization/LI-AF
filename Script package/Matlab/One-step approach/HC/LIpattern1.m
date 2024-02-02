function [M]=LIpattern1(mAA)
M=zeros(116,1);
for i=1:116
    if (i==1 || i==2)
        M(i,1)=mAA(1,1);
    elseif (i==3 || i==4)
        M(i,1)=mAA(2,1);
    elseif (i==5 || i==6)
        M(i,1)=mAA(3,1);
    elseif (i==7 || i==8)
        M(i,1)=mAA(4,1);
    elseif (i==13 || i==14)
        M(i,1)=mAA(5,1);   
    elseif (i==15 || i==16)
        M(i,1)=mAA(6,1);
    elseif (i==19 || i==20)
        M(i,1)=mAA(7,1);  
    elseif (i==33 || i==34)
        M(i,1)=mAA(8,1);   
    elseif (i==35 || i==36)
        M(i,1)=mAA(9,1);   
    elseif (i==37 || i==38)
        M(i,1)=mAA(10,1);
    elseif (i==41 || i==42)
        M(i,1)=mAA(11,1);
    elseif (i==55 || i==56)
        M(i,1)=mAA(12,1);
    elseif (i==79 || i==80)
        M(i,1)=mAA(13,1); 
    elseif (i==81 || i==82)
        M(i,1)=mAA(14,1); 
    elseif (i==83 || i==84)
        M(i,1)=mAA(15,1);
    elseif (i==85 || i==86)
        M(i,1)=mAA(16,1);
    elseif (i==89 || i==90)
        M(i,1)=mAA(17,1);
    elseif (i==61 || i==62)
        M(i,1)=mAA(18,1);
    elseif (i==65 || i==66)
        M(i,1)=mAA(19,1);
    elseif (i==67 || i==68)
        M(i,1)=mAA(20,1);
    elseif (i==29 || i==30)
        M(i,1)=mAA(21,1);
    elseif (i==77|| i==78)
        M(i,1)=mAA(22,1);
    elseif (i==73|| i==74)
        M(i,1)=mAA(23,1);
    elseif (i==91|| i==92)
        M(i,1)=mAA(24,1);
    elseif (i==93|| i==94)
        M(i,1)=mAA(25,1);
    elseif (i==105|| i==106)
        M(i,1)=mAA(26,1);
    end
end
end