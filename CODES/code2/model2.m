%% 模型二
% 反投影
% theta为在model1中求出的角度值 是 1*180 的矩阵
% depth2 为 512*180 的矩阵


%depth2 = [zeros(100,180); depth2; zeros(100,180)];
%imagesc(phantom)
% figure
thera_deg = rad2deg(theta);
figure(2),  I = iradon(depth2, thera_deg,'none','shepp-logan',deltx_value);
 %I = iradon(depth2, thera_deg);
 imshow(I,[]);