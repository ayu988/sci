h=197.3;m=940;k=100
rmin=0.01;rmax=10;n = 1000
b = 20
r = linspace(rmin,rmax,n)
d = r(2)-r(1)
V = zeros(n,n)
for i=1:n
    V(i,i)= (1/2)*(k*r(i)^2)+(1/3)*(b*r(i)^3)
end
K = eye(n,n)*(-2)
for i=1:(n-1)
    K(i,i+1) = 1
    K(i+1,i) = 1
end
H = (-(h^2)/(2*m*d^2))*K+V
[U,EV]=spec(H)
R1 = U(:,1)./r'
R2 = U(:,2)./r'
E=diag(EV)
format(6)
disp("Ground state energy---> "+string(E(1))+"Mev","1st excited state energy---> "+string(E(2))+"Mev")
//xset("font size",2)
subplot(2,2,1)
title("Wave function Plot")
plot(r',[U(:,1),U(:,2)],"linewidth",3)
legend("Ground state","1st Excited State",4)
xlabel("r-->","fontsize",3)
ylabel("U-->","fontsize",3)
xgrid
subplot(2,2,2)
title("Probabilty Density Plot")
plot(r',[U(:,1)^2,U(:,2)^2],"linewidth",3)
legend("Ground state","1st Excited State",)
xlabel("r-->","fontsize",3)
ylabel("U^2-->","fontsize",3)
xgrid
subplot(2,2,3)
//xset("font size",2)
title("Radial Wave Function")
plot(r',[abs(R1),abs(R2)],"linewidth",1.5)
legend("Ground state","1st Excited State")
xlabel("r-->","fontsize",3)
ylabel("R(r)-->","fontsize",3)
xgrid
subplot(2,2,4)
title("Radial Probability Density")
plot(r',[abs(R1)^2,abs(R2)^2],"linewidth",1.5)
legend("Ground state","1st Excited State")
xlabel("r-->","fontsize",3)
ylabel("R(r)^2-->","fontsize",3)
xgrid
