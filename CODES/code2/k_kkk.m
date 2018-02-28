% clc
% clear
%% 

%使用 Kmeans 聚类对规则图案进行处理
% load('result.mat');
% load('cut1.mat');
result = I_sample;
I = reshape (result',1,[]);
img = reshape(result,256,256);

img2 = img .* result_cut_2;
I2 = reshape (img2',1,[]);
I2 = I2 .* (sum(sum(I))./(sum(sum(I2))));

[Idx1,C1,sumD1]=kmeans(I',2);
[Idx2,C2,sumD2]=kmeans(I2',2);


[Idx3,C3,sumD3]=kmeans(I3',5);
I3show = reshape(Idx3,256,256);
imagesc(img3);