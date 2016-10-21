theta_L = linspace(-pi/4,pi/4,100);
theta_c = linspace(-pi,pi,100);
g = 9.81;
k1 = g;
k2 = linspace(0,5,1000);
m = 1;
l = 1/3;

amin = 99999;
for i = 1:1000
    %figure
    for k = 1:100
        for j = 1:100
            Tm(j) = k2(i)*(theta_L(j)-theta_c(k))+cos(theta_L(j))*m*g*l;
        end
        %subplot(5,2,i)
        %plot(theta_L,Tm)
        a = rms(Tm);
        if a <= amin
            amin = a;
            thc = theta_c(k);
            k2g = k2(i);
        else
            amin = amin;
        end
    end
end


theta_c = thc;
k2 = k2g;

for i = 1:100
    TL(i) = cos(theta_L(i))*m*g*l;
    Tk(i) = k2*(theta_L(i)-theta_c);
    Tm(i) = Tk(i) + TL(i);
end

plot(theta_L,TL,'g',theta_L,Tm,'b', theta_L,Tk,'k') 



            
            
