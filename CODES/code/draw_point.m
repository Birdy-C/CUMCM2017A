%  ellipse & circle
t = linspace(0,2*pi,90);
% xi = 15*cos(t)/pixel_length+128;
% yi = 40*sin(t)/pixel_length+128;
% 
% xi2 = 4*cos(t)/pixel_length+45/pixel_length+128;
% yi2 = 4*sin(t)/pixel_length+128;
xi = 15*cos(t);
yi = 40*sin(t);

xi2 = 4*cos(t)+45;
yi2 = 4*sin(t);
%figure
hold on
% x0 = -8.3059/pixel_length+128;
% y0 = 6.9148/pixel_length+128;




x0 = -8.8059;
y0 = 6.9148;
plot(xi,yi);
hold on
plot(xi2,yi2);
xi2 = 4*cos(t)-45;
plot(xi2,yi2);
plot(x0,y0,'*r');
% hold on
% text(x0-5,-20,sprintf('%6.4f', y0+50));
% hold on
% text(-35,y0-3,sprintf('%6.4f', x0+50));
 axis([-60 60 -60 60])
hold on
% % x2 = 0.277429210100547
% % hold on;
% rectangle('Position',[-50,-50,100,100]);
% plot(-50:-8.3059,7.5048,'--k');
% tmp = -50:1.5:7.5048;
% plot(-8.3059,tmp,'k');
% axis off