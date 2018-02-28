clear
d = 0.2778; 
nhalf = 512/2;
xc = -33.5*d;        yc = 20*d;        % rotation center on square pallet

% square pallet
xpo = 50 * [-1  1  1 -1 -1]';          
ypo = 50 * [-1 -1  1  1 -1]';
hb = fill(xpo-xc, ypo-yc, [0.6,0.6,0.6]);
hold on

%  ellipse & circle
t = linspace(0,2*pi,90);
x1o = 15*cos(t);     y1o = 40*sin(t);
x2o =  4*cos(t)+45;  y2o =  4*sin(t); 
h1 = fill(x1o-xc, y1o-yc,'r');
h2 = fill(x2o-xc, y2o-yc,'r');

% arrows
quiver(150*ones(1,10), linspace(-nhalf,nhalf,10)*d, ...
      -300*ones(1,10), zeros(1,10), 0,'b')
  
% Cartesian coordinates of pixel on CT system
[x,y] = meshgrid([-400.5:400.5]*d,[-400.5:400.5]*d); 
plot(0,0,'bx')                         % rotation center on CT system

% Cartesian coordinates of pixel on square pallet at theta = 0
xs = x + xc;  ys = y + yc;       

phantom = (xs.^2/15^2 + ys.^2/40^2 <=1) | ( (xs-45).^2+ys.^2 <=4^2 );
Eabsorb = ctradon(phantom, nhalf, 0);

theta = [0:179]-90-150;

hi = imagesc(-150,y(abs([-400.5:400.5])<256,1),Eabsorb(:,1));

axis image
axis([-150-180,150,-100,100])

for i = 1:length(theta)
    ti = theta(i);
    [x1, y1] = rotxy(x1o, y1o, xc, yc, ti); set(h1,'xdata',x1, 'ydata', y1);
    [x2, y2] = rotxy(x2o, y2o, xc, yc, ti); set(h2,'xdata',x2, 'ydata', y2);
    [xp, yp] = rotxy(xpo, ypo, xc, yc, ti); set(hb,'xdata',xp, 'ydata', yp);
    
    Eabsorb = [Eabsorb ctradon(phantom, nhalf, ti)];
    set(hi, 'xdata', -150-[size(Eabsorb,2):-1:1], 'cdata', Eabsorb);
    drawnow
end