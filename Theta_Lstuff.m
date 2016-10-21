theta_L = linspace(-pi/4,pi/4,1000);
theta_c = linspace(-pi/4,pi/4,1000);
g = 9.81;
k1 = g;
k2 = linspace(0,100,1000);
m = 1;
l = 1/3;


for i = 1:1000
    TL(i) = cos(theta_L(i))*m*g*l;
    Tk(i) = k2*(theta_L(i)-theta_c);
    Tm(i) = Tk(i) + TL(i);
end

plot(theta_L,TL,'g',theta_L,Tm,'b', theta_L,Tk,'k') 

