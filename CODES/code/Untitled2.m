deltax=0.277429210100547;
struct=load('tc.mat') 
A=struct.tc;
I=512;
J=180;
i=[1:1:180];
sini=sin(i);
cosi=cos(i);
j=[];
for m=1:1:J
    for n=1:1:I
        if A(n,m)~=0 j1=n;
            break;
        end
    end
    for l=I:-1:1
        if A(l,m)~=0 j2=l;
            break;
        end
    end
    j(m)=(j1+j2)/2;
end 
X=[sini;cosi]
[b,bint,r,rint,stats] = regress(j',X'); 
r1=norm(b)*deltax
