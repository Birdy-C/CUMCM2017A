clc
clear all
I=imread('xian.bmp');
figure
imshow(I);
title('原始图像');
I1=rgb2gray(I);                %将彩色图像转化灰度图像
threshold=graythresh(I1);        %计算将灰度图像转化为二值图像所需的门限
BW=im2bw(I1, threshold);       %将灰度图像转化为二值图像
figure
imshow(BW);
title('二值图像');
dim=size(BW);
col=round(dim(2)/2)-90;         %计算起始点列坐标
row=find(BW(:,col),1);          %计算起始点行坐标
connectivity=8;
num_points=180;
contour=bwtraceboundary(BW,[row,col],'N',connectivity,num_points);
%提取边界
figure
imshow(I1);
hold on;
plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
title('边界跟踪图像');