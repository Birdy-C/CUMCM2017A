function [x, y] = rotxy(x0, y0, xc, yc, angle)

angle = angle/180*pi;
x = (x0-xc)*cos(angle) + (y0-yc)*sin(angle);
y = (y0-yc)*cos(angle) - (x0-xc)*sin(angle);
