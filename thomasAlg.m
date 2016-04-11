%thomasAlg

fc = zeros(81,81);
D = 1;
a = 4;
Sig = 0.2;
h = 0.1;
L = sqrt(D/Sig);
S = (8*h^2/D)*ones(81,1);
fc(1,1) = (2+(h^2/L^2));
fc(81,81) = (2+(h^2/L^2));
fc(1,2) = -1;
fc(81,80) = -1;
for i = 2:80
    fc(i,i-1) = -1;
    fc(i,i) = (2+(h^2/L^2));
    fc(i,i+1) = -1; 
end
flux = fc\S;
x = linspace(-a,a,81);
fluxdirect = (8/Sig)*(1-((exp(x/L)+exp(-x/L))/(exp(a/L)+exp(-a/L))));
plot(x,flux,x,fluxdirect);
legend('Numerical Flux','Analytical Flux')
ylabel('Flux n/cm^2/s')
xlabel('a')