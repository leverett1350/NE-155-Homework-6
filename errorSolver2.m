%h = 1cm
fc = zeros(9,9);
D = 1;
a = 4;
Sig = 0.2;
h = 1;
L = sqrt(D/Sig);
S = (8*h^2/D)*ones(9,1);
fc(1,1) = (2+(h^2/L^2));
fc(9,9) = (2+(h^2/L^2));
fc(1,2) = -1;
fc(9,8) = -1;
for i = 2:8
    fc(i,i-1) = -1;
    fc(i,i) = (2+(h^2/L^2));
    fc(i,i+1) = -1; 
end
flux = fc\S;
x = linspace(-a,a,9);
fluxdirect = (8/Sig)*(1-((exp(x/L)+exp(-x/L))/(exp(a/L)+exp(-a/L))));
fd = fluxdirect';
error(1,1) = max(abs(flux-fd));

%h = 0.5 cm

fc = zeros(17,17);
D = 1;
a = 4;
Sig = 0.2;
h = 0.5;
L = sqrt(D/Sig);
S = (8*h^2/D)*ones(17,1);
fc(1,1) = (2+(h^2/L^2));
fc(17,17) = (2+(h^2/L^2));
fc(1,2) = -1;
fc(17,16) = -1;
for i = 2:16
    fc(i,i-1) = -1;
    fc(i,i) = (2+(h^2/L^2));
    fc(i,i+1) = -1; 
end
flux = fc\S;
x = linspace(-a,a,17);
fluxdirect = (8/Sig)*(1-((exp(x/L)+exp(-x/L))/(exp(a/L)+exp(-a/L))));
fd = fluxdirect';
error(2,1) = max(abs(flux-fd));

%h = 0.1 cm

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
fd = fluxdirect';
error(3,1) = max(abs(flux-fd));

%h = 0.05 cm

fc = zeros(161,161);
D = 1;
a = 4;
Sig = 0.2;
h = 0.05;
L = sqrt(D/Sig);
S = (8*h^2/D)*ones(161,1);
fc(1,1) = (2+(h^2/L^2));
fc(161,161) = (2+(h^2/L^2));
fc(1,2) = -1;
fc(161,160) = -1;
for i = 2:160
    fc(i,i-1) = -1;
    fc(i,i) = (2+(h^2/L^2));
    fc(i,i+1) = -1; 
end
flux = fc\S;
x = linspace(-a,a,161);
fluxdirect = (8/Sig)*(1-((exp(x/L)+exp(-x/L))/(exp(a/L)+exp(-a/L))));
fd = fluxdirect';
error(4,1) = max(abs(flux-fd));

%h = 0.01 cm

fc = zeros(801,801);
D = 1;
a = 4;
Sig = 0.2;
h = 0.01;
L = sqrt(D/Sig);
S = (8*h^2/D)*ones(801,1);
fc(1,1) = (2+(h^2/L^2));
fc(801,801) = (2+(h^2/L^2));
fc(1,2) = -1;
fc(801,800) = -1;
for i = 2:800
    fc(i,i-1) = -1;
    fc(i,i) = (2+(h^2/L^2));
    fc(i,i+1) = -1; 
end
flux = fc\S;
x = linspace(-a,a,801);
fluxdirect = (8/Sig)*(1-((exp(x/L)+exp(-x/L))/(exp(a/L)+exp(-a/L))));
fd = fluxdirect';
error(5,1) = max(abs(flux-fd));

% Final Plot

plot([9,17,81,161,801],error,'s');
ylabel('Maximum Flux Relative Error: n/cm^2/s')
xlabel('# of Meshes')
