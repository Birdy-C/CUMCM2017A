%% mask_search.m
% 该函数用来确定某个图案的凸包
% 由于离散之后光线通过具体哪些点的定义可能不同，所以这个方法可能会对抹去某些细节

init_matrix = depth2;
%% 采样
% 为了配合matlab的内置函数定义 先进行一次插值后取出每个宽度像素的值（就是把间距由deltX变为间距）
% 该步骤与model2相同,由于对问题的精度和速度要求不同这里不进行再一次的插值
sample_length = pixel_length/deltx_value;
% sample = interp1(1:512,init_matrix,sample_point,'linear');
sample = init_matrix;
size_sample = size(sample);


%% 求解
% 结果的大小
size_result = 400;
size_pic = size_sample(1);
pic_result = ones(size_result,size_result);
  m = [];

for i=1:size_result
    for j=1:size_result
% for i=125
%     for j=125
        % 求出该点到直线的角度和距离
        flag = 0;
        length = sqrt((i - (1+size_result)/2)^2 + (j - (1+size_result)/2)^2);
               
        theta2 = atan((i - (1+size_result)/2)/(j - (1+size_result)/2));
        if j >(1+size_result)/2
            theta2 = theta2 +pi;
        end
%         m = [m,theta2];

          for k=1:5:180
%           for k=170
            theta_now = theta(k);
            
            %求该点在直线上投影的位置
%             t=length * cos(theta2 + theta_now) - pos_pix(k);            
            t=length * cos(theta2 + theta_now - pi/2)*sample_length;
%              m = [m,t];


            % 对于就近两个点进行判断
            flag1 = 0;
            for t1 = floor(size_pic/2 + t):floor(size_pic/2+t+1) 
                if (t1 > size_pic) || (t1 < 1)            % 如果该点在区域外
                    flag = 1;
                    break;
                end
                if sample(t1,k) > 0
                    flag1 = flag1 + 1;
                end
            end
            if flag1 == 0
                flag = 1;
                break;
            end
         end
         if flag ==1
            pic_result(size_result+1-i,size_result+1-j) = 0;
        end
    end
end
imshow(pic_result);
hold on;



%%
%裁剪
result_cut = pic_result(round(centerX - 256/2):round(centerX + 255/2),round(centerY - 256/2):round(centerY + 255/2));
figure
imshow(result_cut)
