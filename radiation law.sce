//plot radiation laws (Planck/Rayleigh-Jeans/Wien's dist./Wien/Stefan)
h = 6.62e-34
kb = 1.38e-23
c = 3e8
T = 500:100:1000 //teMP RANGE IN KELVIN
To = 1000 // Temp for comparison of planck with Rayleigh-Jeans/Wien's
Wu = 0.1:0.005:30
W = Wu.*10^-6
A = (8*3.14*h*c)
for i = 1:length(T)
    for j = 1:length(W)
        up(i,j) = (A/W(i)^5)/(exp((h*c)/(kb*T(i)*W(i)))-1 //plack's law
        ur(i,j) = 8*3.14*kb*T(i)/(W(i)^4)//Rayleigh-Jeans Law
        uw(i,j) = (A/W(i)^5)*exp(-(h*c)/(kb*T(j)*W(i)))//Wien's
        
    
   
    end
    if T(i) == To
        q = i
    end
    [p,k] = max(up(i,:))
    Wmax(i) = Wu(k)
    U(i) = (0.005*10^-6)*sum(up(i,:))
end
subplot(2,2,1)
plot(Wu',up','linewidth',5)
legend('T = '+string(T)+' K')
xlabel('$\lambda(\mu m)$','fontsize',6)
ylabel('$u(\lambda)$','fontsize',6)
title('Planck Radiation Law','fontsize',6)

//Comparison of Planck's Law with Rayleigh-Jeans/Wien's dist. Law
subplot(2,2,2)
plot(Wu',[up(q,:)' uw(w,:)'],'linewidth',5)
replot([0,0,20,200])
legend('Planck Law','Rayleigh-Jeans Law','Wien dist Law')
title('Temperature: '+string(T(q))+' K','fontsize',6)
xlabel('$\lambda(\mu m)$','fontsize',6)
ylabel('$u(\lambda)$','fontsize',6)

//Plot Wien's Law
subplot(2,2,3)
TI = 1./T
plot(TI,Wmax','-o-','linewidth',5)
title('Wien Law','fontsize',6)
xlabel('$\frac1T(K^{-1})$','fontsize',6)
xlabel('$\lambda_{max}(\mu m)$','fontsize',6)
[b,a] = reglin(TI,Wmax')
disp('The value of Wien constant is: '+string(b)+' um.K')


//Plot Stefan's Law
subplot(2,2,4)
T4 = T.^4
E = U.*(c/4)
plot(T4',E,'-o-','linewidth',5)
title('Stefan Law','fontsize',6)
xlabel('$\text T^4(K^4)$','fontsize',6)
ylabel('$E(W/m^2)$','fontsize',6)
[sigma, d] = reglin(T4,E')
disp('The value of Stefan constant is: '+string(sigma)+'W.m-2.K-4')


