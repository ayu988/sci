//plot different distribution functions (MB, BE and FD)
e = 1.6e-19
k = 1.38e-23
u = 0 //chemical potential (ev)
E = -0.5:0.001:0.5
T = 100:200:1100
To = 500
dist = ["Bose Einstein", "Maxwell Boltzmann", "Fermi Dirac"]
a = -1
for n = 1:3
    for i = 1:length(T)
        if T(i) == To
            z = i
        end
        for j = 1:length(E)
            
            f(i,j) = 1/(exp(((E(i)-u)*e)/(k*T(i)))+a)
        end
    end
    a = a + 1
    subplot(2,2,n)
    plot(E',f',"linewidth",6)
    xlabel("Energy (ev)","fontsize",6)
    ylabel("f(E)","fontsize",6)
    legend("T = "+string(T)+" K")
    title(string(dist(n)+" distribution for u = "+string(u),"fontsize",6))
    C(n,:) = f(z,:)
end
subplot(2,2,4)
plot(E',C',"linewidth",6)
xlabel("Energy (ev)","fontsize",6); ylabel("f(E)","fontsize",6)
legend(string(dist)+" distribution",3)
title("Temperature = "+string(T(z))+" K","fontsize",6)











