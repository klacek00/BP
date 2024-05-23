%% Vazena metoda
function [t,y] = FractionalWeightedEuler(y_der,ah,bh,N,alpha,y0,theta)
%   Funkce resisi zlomkovou diferencialni rovnici doprednou eulerovou metodou 
%   Resi rovnici typu y_der = f(t,u), kde y0=y(0) je vektor počátečních
%   podmínek
%   alpha - stupeň derivace funkce y
%   a,b   - hranice intervalu funkce, na kterem resime diferencialni
%   rovnici
%   theta - váhový parametr
t = linspace(ah,bh,N+1);
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
    scitanec2 = (tau.^(alpha)).*theta.*sum(b(n-j2+1).*yn(j2+1)); %+1 kvůli indexaci
    
    j3 = 0:n-1; %%%%%%%%%% %do nelinearni fce vstupuje pouze n clenu, n+1 clen v ni pocitame
    yn = zeros(n+1,1);
    for j=1:n-1 %%%%%%%%%%
        yn(j+1) = y_der(t(j+1),y(j+1));
    end
    scitanec3 = (1-theta).*(tau.^(alpha)).*sum(b(n-j3+1).*yn(j3+1)); %+1 kvůli indexaci

    scitance = scitanec1 + scitanec2 + scitanec3;
    cinitel = (tau.^(alpha)).*b(1).*(1-theta);

    fun = @(hled) hled - scitance  - cinitel .* y_der(t(n+1),hled);

    y(n+1) = fzero(fun, y(n));
end
end