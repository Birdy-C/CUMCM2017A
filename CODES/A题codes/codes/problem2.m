d = 0.2778;
nhalf = 512/2;
xc = -33.5*d;        yc = 20*d;        % rotation center on square pallet


phantom = load('5.dat');

phantom = [zeros(100,180); phantom; zeros(100,180)];

imagesc(phantom)

figure
img = iradon(phantom,[0:179]-90-150);



n = size(img,1);

[x, y] = meshgrid([-n/2:n/2]*d);%100/256

imagesc(x(1,:), y(:,1), img)

hold on

plot(yc,xc,'ok')

xp = [-50  50 50 -50 -50]';

yp = [-50 -50 50  50 -50]';
[xp, yp] = rotxy(xp, yp, -yc, -xc, 0); 

plot(xp,yp,'-w')

axis image