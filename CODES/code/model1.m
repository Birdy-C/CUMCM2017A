%%
%此代码对于之前进行初步确定的模型进行进一步搜索，增加模型的精度
%传入参数 theta_0 pos_0 为 1*180 的向量，确定搜索起始点
%传入参数 theta_step pos_step 为 1*n 的矩阵，表示搜索范围和步长

%deltvalue 为监视器之间的距离
%depth 为512*180的矩阵，是每个监视器对应X光经过被吸收物体的长度

%输出参数 warning_flag 表示 最小值在边界处取到的数量。如果该值过大，说明搜索起始点精度不高，需要重新确定搜索起点或者扩大搜索范围
%输出参数 theta pos 为模型的解


%%
%初始化
record = [];
theta_0 = [];
pos_0 = [];
miu = pi/180;
% for i = 1:180
%     theta_0 = [theta_0, miu*i - deg2rad(26.5778 - 146.18836)];
%     pos_0 = [pos_0,-0.4+18.10*cos(miu*i)-36.18*sin(miu*i)];
% end
theta_0 = theta;
pos_0 = pos;
warning_flag = [];
theta_step = 0;
pos_step = 0;
%theta 用度数
%
deg1 = deg2rad(1);

% 小的样本用于监视
% theta_step = -1:0.5:1;
% pos_step =  -2:0.5:2;

%测试数据
% theta_step = -2:0.05:0;
% pos_step =  -2:0.05:2;

theta_step = theta_step * deg1;

% theta = zeros(1,180);
% pos = zeros(1,180);
result_check = zeros(length(theta_step),length(pos_step));

mark = [];
%%
%逐步搜索
for index = 1:180
    vari_mark = inf;
    for theta_index = 1:length(theta_step)
        theta_temp = theta_0(index) + theta_step(theta_index);
        for pos_index = 1:length(pos_step)            
            pos_temp = pos_0(index) + pos_step(pos_index);
            %统计二维情况
            result_check(theta_index,pos_index) =pos_temp;
            %计算理想值和实际值之间的距离
            [vari_temp,n] = cout_vari(theta_temp,pos_temp,depth(:,index)');
            %result_check = [result_check;n];
%             vari_temp = cout_vari(theta_temp,pos_temp,depth(:,index)');
            record = [record, vari_temp];
            mark = [mark,n'];
            % 如果得到更接近的拟合
            if vari_temp < vari_mark
                vari_mark = vari_temp;
                theta_mark = theta_temp;
                pos_mark = pos_temp;
            end            
        end
    end
    %如果是边界
%     if  (theta_mark - theta_0(index)) == theta_step(1)|| (theta_mark - theta_0(index)) == theta_step(length(theta_step))||...
%             (pos_mark - pos_0(index)) == pos_step(1)|| (pos_mark - pos_0(index)) == pos_step(length(pos_step))
%         warning_flag = [warning_flag,i];
%     end
%     theta(index) = theta_mark;
%     pos(index) = pos_mark;
%     
end

% %%
% disp('不合理点数量')
% length(warning_flag)
% 
% figure(1)
% plot(theta_0,'r');
% hold on;
% plot(theta,'b');
% hold on;
% figure(2)
% plot(pos_0,'r');
% hold on;
% plot(pos,'b');
% save('theta','theta');
% 
% save('postion','pos');
% record = reshape(record,length(pos_step),length(theta_step));
% theta_step  = theta_step+ theta_0(1);
% pos_step  = pos_step+ pos_0(1);
% [xa,ya] = meshgrid(theta_step,pos_step);
% mesh(xa,ya,record);
% hold on;
% xlabel('theta')
% ylabel('椭圆中心位置')
% zlabel('和实际位置之间的距离')