function Eabsorb = ctradon(phantom, nhalf, angle)

imrot = imrotate(phantom,angle,'crop');
imrot = imrot(abs([-400.5:400.5])<nhalf, :);
Eabsorb = sum(imrot,2);