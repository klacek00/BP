%% Testovací úloha pro Eulerovy metody 
%   Řešíme počáteční probém y_der = f(t,u)
%   y0=y(0) - vektor počátečních podmínek
%   alpha - stupeň derivace funkce y
%   a,b   - hranice intervalu funkce, na kterem resime diferencialni
%   N     - počet krokův řešení
%   theta - váhový parametr pro váženou metodu
%   yres~ - matice, ve které první řádek jsou řešení Exlicitní eulrovou
%   metodou
%           druhý řádek řešený Implicitní Eulerovou metodou
%           třetí řádek řášený váženou metodou s parametrem theta
%           sloupce 
%   yerr~ - chybařešení danou metodou při daném počtu kroků

hold on;
y_der = @(t,y) 2./gamma(2.5) .* t.^(1.5) - y + t.^2;
%           řešení pro tuto metodu je y(t) = t.^2
y0 = 0.00;
a=0.0;
b=10;
alpha = 0.5;
N = 1;
yres1 = zeros(3, 5);
yres2 = zeros(3, 5);
yres3 = zeros(3, 5);
yres4 = zeros(3, 5);
yres5 = zeros(3, 5);
yres6 = zeros(3, 5);
yres7 = zeros(3, 5);
yres8 = zeros(3, 5);
yres9 = zeros(3, 5);
yres10 = zeros(3, 5);
yerr1 = zeros(3, 5);
yerr2 = zeros(3, 5);
yerr3 = zeros(3, 5);
yerr4 = zeros(3, 5);
yerr5 = zeros(3, 5);
yerr6 = zeros(3, 5);
yerr7 = zeros(3, 5);
yerr8 = zeros(3, 5);
yerr9 = zeros(3, 5);
yerr10 = zeros(3, 5);

for n = 1:5 
    N = N*10 %10násobné zvýšení počtu kroků oproti předchozí iteraci

    [t,y] = FractionalForwardEuler(y_der,a,b,N,alpha,y0);
    toc
    plot(t,y,'DisplayName',sprintf('Forward N = %d', N));
        yres1(1,n) = y(find(t==1));
    yerr1(1,n) = abs(1^2 - yres1(1,n));

        yres2(1,n) = y(find(t==2));
    yerr2(1,n) = abs(2^2 - yres2(1,n));

        yres3(1,n) = y(find(t==3));
    yerr3(1,n) = abs(3^2 - yres3(1,n));

        yres4(1,n) = y(find(t==4));
    yerr4(1,n) = abs(4^2 - yres4(1,n));

        yres5(1,n) = y(find(t==5));
    yerr5(1,n) = abs(5^2 - yres5(1,n));

        yres6(1,n) = y(find(t==6));
    yerr6(1,n) = abs(6^2 - yres6(1,n));

        yres7(1,n) = y(find(t==7));
    yerr7(1,n) = abs(7^2 - yres7(1,n));

        yres8(1,n) = y(find(t==8));
    yerr8(1,n) = abs(8^2 - yres8(1,n));

        yres9(1,n) = y(find(t==9));
    yerr9(1,n) = abs(9^2 - yres9(1,n));

        yres10(1,n) = y(find(t==10));
    yerr10(1,n) = abs(10^2 - yres10(1,n));


    tic
    [t,y] = FractionalBackwardEuler(y_der,a,b,N,alpha,y0);
    toc
    plot(t,y,'DisplayName',sprintf('Backward N = %d', N));

        yres1(2,n) = y(find(t==1));
    yerr1(2,n) = abs(1^2 - yres1(2,n));

        yres2(2,n) = y(find(t==2));
    yerr2(2,n) = abs(2^2 - yres2(2,n));

        yres3(2,n) = y(find(t==3));
    yerr3(2,n) = abs(3^2 - yres3(2,n));

        yres4(2,n) = y(find(t==4));
    yerr4(2,n) = abs(4^2 - yres4(2,n));

        yres5(2,n) = y(find(t==5));
    yerr5(2,n) = abs(5^2 - yres5(2,n));

        yres6(2,n) = y(find(t==6));
    yerr6(2,n) = abs(6^2 - yres6(2,n));

        yres7(2,n) = y(find(t==7));
    yerr7(2,n) = abs(7^2 - yres7(2,n));

        yres8(2,n) = y(find(t==8));
    yerr8(2,n) = abs(8^2 - yres8(2,n));

        yres9(2,n) = y(find(t==9));
    yerr9(2,n) = abs(9^2 - yres9(2,n));

        yres10(2,n) = y(find(t==10));
    yerr10(2,n) = abs(10^2 - yres10(2,n));

    theta = 0.5;
    tic
    [t,y] = FractionalWeightedEuler(y_der,a,b,N,alpha,y0,theta);
    toc
    plot(t,y,'DisplayName',sprintf('Weighted, with theta = %d and N = %d',theta, N));
        yres1(3,n) = y(find(t==1));
    yerr1(3,n) = abs(1^2 - yres1(3,n));

        yres2(3,n) = y(find(t==2));
    yerr2(3,n) = abs(2^2 - yres2(3,n));

        yres3(3,n) = y(find(t==3));
    yerr3(3,n) = abs(3^2 - yres3(3,n));

        yres4(3,n) = y(find(t==4));
    yerr4(3,n) = abs(4^2 - yres4(3,n));

        yres5(3,n) = y(find(t==5));
    yerr5(3,n) = abs(5^2 - yres5(3,n));

        yres6(3,n) = y(find(t==6));
    yerr6(3,n) = abs(6^2 - yres6(3,n));

        yres7(3,n) = y(find(t==7));
    yerr7(3,n) = abs(7^2 - yres7(3,n));

        yres8(3,n) = y(find(t==8));
    yerr8(3,n) = abs(8^2 - yres8(3,n));

        yres9(3,n) = y(find(t==9));
    yerr9(3,n) = abs(9^2 - yres9(3,n));

        yres10(3,n) = y(find(t==10));
    yerr10(3,n) = abs(10^2 - yres10(3,n));
end
plot(t,t.^2,'DisplayName','t^2');
legend('show');

