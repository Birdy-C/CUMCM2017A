%计算deltx（探测器单元间的距离）
xmatrix = b; %b是附件2的数据矩阵
h_vec = [];
for i = 1:180
    h = sum(xmatrix(:,i));
    h_vec = [h_vec h];
end
Havr = sum(h_vec)/1.7768/180;
Sreal = pi*40*15 + pi*4*4;
deltxvalue = Sreal/Havr;

    
    
    
