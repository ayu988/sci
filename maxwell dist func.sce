//plot maxwell speed distribution function
k = 1.38e-23
N = 6e23
pi = 3.14
v = 0:1:2000 //speed in m/s
T = 300:300:900
n = input("Enter total no. of gases for plot simulation: ")
for g = 1:n
    name(g) = input("Enter the name of gas: ","string")
    M = input("Enter molar mass (g/mol) of "+string(name(g))+": ")
    m = M/(N*1000)
    disp(["Temp(K)" "vmp" "vav" "vrms"])
    for i = 1:length(T)
        a = m/(2*k*T(i))
        for j = 1:length(v)
            f(i,j) = (4*pi)*(a/pi)^1.5*(v(j)^2)*exp(-a*(v(j)^2))
        end    
        [p,q] = max(f(i,:))
        vmp = v(q)
        vav = sqrt(4/pi)*vmp
        vrms = sqrt(3/2)*vmp
        disp([T(i) vmp vav vrms])
    end
//subplot(n,1,g)
//plot(v',f',"linewidth",5)
//xlabel("v(m/s","fontsize",5)
//ylabel("f(v)","fontsize",5)
//legend("T = "+string(T)+" K")
//title("Maxwell speed distribution function for "+string(name(g)),"fontsize",5)
end
