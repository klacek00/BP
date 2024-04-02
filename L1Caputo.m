%% L1 metoda vypoctu Caputovy derivace
function [t,y] = L1Caputo(y_der,alpha,a,b,N)
%   Funkce resici zlomkovou diferencialni rovnici implicitni Eulerovou metodou 
%   Resi rovnici typu y_der = f(t,y), kde y0=y(0) je vektor počátečních
%   podmínek
%   alpha - stupeň derivace mezi 0 a 1
%   a,b   - hranice intervalu funkce ktera se derivuje
%   N     - pocet kroku
t = linspace(a,b,N+1);
y = zeros(N+1,1);
y(1) = 0;
tau = t(2)-t(1);

b = zeros(N,1) ;
for i = 0:N-1
    b(N-i) = (tau.^(-alpha))./(gamma(2-alpha)).*((i+1).^(1-alpha) - i.^(1-alpha));
end

for i=0:(N-1)%i=0:k-1, ale matlab čísluje od 1
    y(i+2) = y(i+1) + b(i+1).*(y_der(t(i+2))-y_der(t(i+1)));
end

end