clear all;
s=load('F.mat') 
R=s.untitled;
%直接反投影法
%size_pic = pow2(nextpow2(size(R,1)));%重构图像的大小
size_pic = 724;
P_1 = zeros(size_pic,size_pic);%用于存放重构后的图像
 
 
%滤波反投影法
%多少个角度
N=180;
%滤波
H=size(R,1);
h=zeros((H*2-1),1);
for i=0:H-1
    if i==0
        h(H-i)=1/4;
    elseif rem(i,2)==0
        h(H-i)=0;
        h(H+i)=0;
    else
        h(H-i)=-1/(i*pi)^2;
        h(H+i)=-1/(i*pi)^2;
    end
end
x=zeros(H,N);
for i=1:N
    s=R(:,i);
    xx=conv(s',h');
    x(:,i)=xx(H:2*H-1);
end
 
%反投影
P_3=zeros(size_pic,size_pic);
for i=1:size_pic
    for j=1:size_pic
        for k=1:180
            theta=deg2rad(k);
            %t是该点到直线的距离
            t=(j-size_pic/2-0.5)*cos(theta)+(size_pic/2+0.5-i)*sin(theta)+(H+1)/2;
            t1=floor(t);
            t2=floor(t+1); 
            P_3(i,j)=P_3(i,j)+(t2-t)*x(t1,k)+(t-t1)*x(t2,k);
        end
    end
end
P_3=pi/N*P_3;
figure;imshow(P_3,[]);title('滤波反投影法');