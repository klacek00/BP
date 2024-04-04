function [t,y] = FractionalForwardEulerOptimalized(y_der,a,b,N,alpha,y0)
%   Funkce resisi zlomkovou diferencialni rovnici doprednou eulerovou metodou 
%   Resi rovnici typu y_der = f(t,u), kde y0=y(0) je vektor počátečních
%   podmínek
%   alpha je stupeň derivace funkce y
%   a,b jsou hranice intervalu funkce, na kterem resime diferencialni
%   rovnici
%   N je pocet kroku
t = linspace(a,b,N+1);
y = zeros(length(t),1);
y(1) = y0(1);
tau = t(2)-t(1);
m = ceil(alpha);

b = zeros(N+2,1);
for n=1:N+2
    b(n) = (1./(gamma(alpha+1))).*(((n).^alpha)-((n-1).^alpha));
end

for n=1:N
    j1 = 0:(m-1);
    scitanec1 = sum(((t(n+1)).^j1)./factorial(j1).*y0(j1+1));

    j2 = 0:n;
    yn = zeros(n+1,1);
    for j=0:n
        yn(j+1) = y_der(t(j+1),y(j+1));
    end
    scitanec2 = sum(b(n-j2+1).*yn(j2+1)); %+1 kvůli indexaci
    
    y(n+1) = scitanec1 + (tau.^(alpha)).*scitanec2;
end

end