function eigenVector

D = 1;
a = 4;
Sig = 0.7;
nuSig = 0.6;
h = 0.1;
k = 1;
%L = sqrt(D/Sig);
S = zeros(81,1);
fc = zeros(81,81);
fc(1,1) = 2*D/h^2+Sig;
fc(81,81) = 2*D/h^2+Sig;
fc(1,2) = -D/h^2;
fc(81,80) = -D/h^2;
for i = 2:80
    fc(i,i-1) = -D/h^2;
    fc(i,i) = 2*D/h^2+Sig;
    fc(i,i+1) = -D/h^2; 
end
%[v,d]= eig(fc);
%for i = 1:81
%f(i,1) = v(i,r);
%end
f = ones(81,1);
Q = nuSig*f;
RelError = 1;
c = 0;
Q0 = zeros(81,1);
while RelError>1e-4
    Q0(:) = Q(:);
    k0 = k;
    [f,i] = sor2(fc,Q/k,f);
    Q = nuSig*f;
    k = k*(sum(Q)/sum(Q0));
    RelError = abs((k0-k)/k);
    c = c + 1;
end
k = k
i = c
x = linspace(-a,a,81);
plot(x,f)
xlabel('a')
ylabel('Flux n/cm^2/s')