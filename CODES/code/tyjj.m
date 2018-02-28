function [len] = tyjj(theta, t)
a = 40;
b = 15;
yround = 45;
R = 4;
rd = abs(-yround+t/cos(theta))/sqrt((tan(theta))^2+1);
if a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2 > 0 && rd >4
    len = sqrt(1+(tan(theta))^2)*2*a*b*sqrt(a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2)/(a^2*(tan(theta))^2+b^2)/cos(theta);
elseif a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2 <= 0 && rd <=4
    len = 2*sqrt(R^2-(t/cos(theta)-h)^2/((tan(theta)^2)+1);
elseif a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2 > 0 && rd <=4
    len = sqrt(1+(tan(theta))^2)*2*a*b*sqrt(a^2*(sin(theta))^2+b^2*(cos(theta))^2-t^2)/(a^2*(tan(theta))^2+b^2)/cos(theta) + 2*sqrt(R^2-(t/cos(theta)-h)^2/((tan(theta)^2)+1);
else
    len = 0;
end



