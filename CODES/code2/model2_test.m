%% 模型二
% model2_test.m
% 本代码目的是借助模型一 对反投影相关的各种滤波和插值算法进行评价
% theta为在model1中求出的角度值 是 1*180 的矩阵
% depth 为 512*180 的矩阵
init_matrix = depth;

%% 求解

% 为了配合matlab的内置函数定义 先进行一次插值后取出每个宽度像素的值（就是把间距由deltX变为间距）
% 采样点
sample_length = pixel_length/deltx_value/2;
sample_point = 1:sample_length:512;
sample = interp1(1:512,init_matrix,sample_point,'linear');
size_sample = size(sample);

% 扩大求解范围
% t = floor((sqrt(2)-1)*size_sample(1)/2);
 t = 90;
sample = [zeros(t,size_sample(2)); sample; zeros(t,size_sample(2))];
% I0 = iradon(sample, theta_deg);
I0 = iradon(sample, theta_deg,'none','none',deltx_value);
% I0 = iradon(sample, theta_deg,'spline','none',deltx_value);
% I0 = relvbo(sample, theta_deg,'pchip','zhishu',deltx_value,1500,0.21,0.5,0.5);
size_I0 = size(I0);
%旋转中心的位置(I的中点是旋转中心)
% y0 = 8.3059;
% x0 = 7.5048;
y0 = 9;
x0 = 6;
centerX = round(x0*2/pixel_length + (1+size_I0(1))/2);
centerY = round(y0*2/pixel_length + (1+size_I0(2))/2);
% plot(centerX,centerY,'or');
% rectangle('Position',[centerX-256,centerX+255,512,512]) 
% 以椭圆中心为中心取出512个点即为所需
n = 512;
%n = 256;
I = I0(centerX-n/2+1:2:centerX+n/2-1,centerY-n/2+1:2:centerY+n/2-1);
%之前算的多增加的2t个空白的射线源造成 - 求解区域比原来大，所以每个射线的影响减少
%因此做出修正
I = I .*((512+2*t)/512);
imshow(I,[]);
hold on
plot(centerX,centerY,'or');

%% 评价
% 这里使用归一化均方判据


I_sample = I*4;%这个是因为 用了双倍的取样点 
result = reshape (I_sample',1,[]);
% figure(2);
% %残差图
% input = reshape (pic',1,[]); % pic model1的形状
% imshow(I_sample-pic,[]);
% 
% 
% delt1 = sum((input - result).^2);
% delt2 = sum((input - mean(input)).^2);
% 
% if delt2 ~= 0
%     %求距离
%     distance = sqrt(delt1/delt2);
% end
% distance

%% 分类
t1 = [];
% for i = 2:7
%    [Idx,C,sumD]=kmeans(result',i);
%    t1 = [t1,sum(sumD)];
% end 

 [Idx,C,sumD]=kmeans(result',2);
%  class = reshape(Idx,256,256);
%  class = class';
%  % 求差
%  temp = (2-class) - pic;
%  imshow(abs(temp));
%  