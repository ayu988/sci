N = input("Enter the no. of simulations: ")
for i=1:N
    n = input("Enter no. of coins: ")
    Mi = 2^n //total num of microstaes
    for i = 0:1:n //no. of microstates for a particular macrostate
        nm = factorial(n)/(factorial(i)*factorial(n-i))
        P(i+1) = nm/Mi
        h(i+1) = i
        disp([h(i+1) P(i+1)])
    end
//    subplot(1,N,i)
//    plot(h,P,'o-','linewidth',4)
//    title("No. of coins: "+string(n),"fontsize",6);
//    xlabel("No. of heads, n(H)","fontsize",6)
//    ylabel("Probability, P(H)","fontsize",6)
//    
end
