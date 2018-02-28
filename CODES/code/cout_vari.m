function [ output_args ,result ] = cout_vari( theta,pos,depth )
%cout_vari 计算theta和pos对应的向量与理想值之间的欧式距离
% depth 1*512 的向量
% result 用于检验
result = [];
deltx_value = 0.277429210100547;%间距
% deltx_value = deltx_value*cos()
%kValue = 1.776812774001533;
t = - pos *deltx_value - deltx_value * 513/2;
for index = 1:512
    t = t + deltx_value;
    result = [result,ideal_result(theta, t)];
end
output_args = pdist2(result,depth);
%被注释掉的检查函数们
%plot(result);
%hold on;
%plot(depth);
end

