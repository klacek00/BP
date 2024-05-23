%% Testovací metody euler uloha7
%   Řešíme počáteční probém y_der = f(t,y)
%   y0=y(0) - vektor počátečních podmínek
%   alpha - stupeň derivace funkce y
%   a,b   - hranice intervalu funkce, na kterem resime diferencialni
%   N     - počet krokův řešení
%   yerr~ - chybařešení danou metodou při daném počtu kroků

format long;
hold on;
alpha = 1.9;
y_der = @(t,y) -(y.^(2)) + (gamma(6)./gamma(6-alpha).*t.^(5-alpha)) - (3.*gamma(5)./gamma(5-alpha).*t.^(4-alpha)) + (gamma(5)./gamma(4-alpha).*t.^(3-alpha))+((t.^5)-(3.*t.^4)+(2.*t.^3)).^2 ;
y0 = [0 0];
a=0.0;
b=5;
N = 5;

pocet = 2;
ykon1 = zeros(pocet,1);
ykon2 = zeros(pocet,1);
ykon3 = zeros(pocet,1);
ykon = 1.^5-3.*1.^4+2.*1.^3;
for i=1:pocet
    N = N*10
%tic
%[t,y1] = FractionalForwardEuler(y_der,a,b,N,alpha,y0);
%plot(t,y1,'DisplayName',sprintf('Forward N = %d', N));
%ykon1(i) = y1(end);
%toc

tic
[t,y2] = FractionalWeightedEuler(y_der,a,b,N,alpha,y0,0.500);
plot(t,y2,'DisplayName',sprintf('Weighted N = %d', N));
ykon3(i)= y2(end);
toc

tic
[t,y3] = FractionalBackwardEuler(y_der,a,b,N,alpha,y0);
plot(t,y3,'DisplayName',sprintf('Backward N = %d', N));
ykon2(i)= y3(end);
toc

end
y4 = ((t.^5)-(3.*t.^4)+(2.*t.^3));

yerr1 = ykon1-ykon
yerr2 = ykon2-ykon
yerr3 = ykon3-ykon


hold on;
plot(t,y4,'DisplayName',sprintf('((t.^5)-(3.*t.^4)+(2.*t.^3))'));
legend('show');