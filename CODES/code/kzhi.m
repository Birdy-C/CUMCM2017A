%计算k值（增益系数）
k = xlsread('kzhi.xlsx');  %读取的是我们框选的圆形区域
avr_vec = [];
for i = 1:71
    s = 0;
    count = 0;
    for j = 1:66
        if k(j,i) ~= 0
            s = s + k(j,i);
            count = count + 1;
        end
    end
    avr = s/count;
    avr_vec = [avr_vec avr];
end
avr_all = sum(avr_vec)/71;
kvlaue = avr_all/(pi*4/2);
maxall = max(max(k));
kvaluemax = maxall/8;
        