function [len] = ideal_result(theta, t)
% 计算 theta 和 t 对应的理想结果
theta = pi/2 - theta;
a = 40;
b = 15;
yround = 45;
R = 4;
%rd = abs(t);
len = 0;
rd = abs(-yround+t/cos(theta))/sqrt((tan(theta))^2+1);
if 1/a/a+(tan(theta))^2/b/b-t^2/(cos(theta)*cos(theta)*b*b*a*a) > 0 && rd >4
    len = abs(sqrt(1+(tan(theta))^2)*2*a*b*sqrt(a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2)/(a^2*(tan(theta))^2+b^2)/cos(theta));
elseif a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2 <= 0 && rd <=4
    %len = 2*sqrt(R^2-(t/cos(theta)-yround)^2/((tan(theta)^2)+1));                                                                                                                                  
elseif 1/a/a+(tan(theta))^2/b/b-t^2/(cos(theta)*cos(theta)*b*b*a*a) > 0 && rd <=4
    len = abs(sqrt(1+(tan(theta))^2)*2*a*b*sqrt(a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2)/(a^2*(tan(theta))^2+b^2)/cos(theta)) ;
%   len = len + 2*sqrt(R^2-(t/cos(theta)-yround)^2/((tan(theta)^2)+1));
else
    len = 0;
end
end

