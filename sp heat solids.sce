//specific heat of solids
k = 1.38e-23
N = 6e23
name = input("Enter the name of solid: ","string")
Te = input("Enter the value of Eintein Temperature (K)")
Td = input("Enter the value of Debye Temperature (K)")
T = 0:2*Td
for i = 1:length(T)
    Cvdp(i) = 3*N*k
    if T(i) == 0 then
        Cve(i)=0
        Cvd(i)=0
    else
        x = (Te/T(i))
        Cve(i) = (3*N*k*(x^2)*exp(x))/((exp(x)-1)^2)//Einstein model
        if T(i)>Td/50 then
            I = integrate('((y^4)*exp(y))/((exp(y)-1)^2)','y',0,Td/T(i))
            Cvd(i) = 9*N*k*I*((T(i)/Td)^3)
        else
            Cvd(i) = ((12*3.14^4)/5)*N*k*((T(i)/Td)^3)//Debye Model Low temp
        end
    end
end
plot(T',[Cvdp Cve Cvd],'linewidth',5)
legend('Dulong Petit Law','Einstein Model','Debye Model',4)
title(string(name)+' (Td = '+string(Td)+'K and Te = '+string(Te)+'K)')
ylabel('Specific heat, Cv (J/mol-K)','fontsize',6)
xlabel('Temperature (K)','fontsize',6)
