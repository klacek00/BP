%% Testovací úloha mechanického oscilátoru
%   Řešíme počáteční probém y_der = f(t,u)
%   y0=y(0) - vektor počátečních podmínek
%   alpha - stupeň derivace funkce y
%   a,b   - hranice intervalu funkce, na kterem resime diferencialni
%   N     - počet krokův řešení
%   theta - váhový parametr pro váženou metodu
%   yres  - matice, ve které se po řádcích provádí aproximace řešení
%           váženou metodou s parametrem theta, slopce v této matici
%           odlišují řešení kdy v každém sloupci je 2* více kroků, než ve
%           sloupci předchozím
%   yerr  - chyba řešení danou metodou při daném počtu kroků
%   y4    - přesné řešení úlohy

format shortE;
hold on;
xlabel('t')
ylabel('y'),
% title('Graf analytického řešení mechanického oscilátoru')

m = 1;
k = 1;
c0 = 1;
c1 = 0;

alpha = 1.1;
y_der = @(t,y) (-k.*y)./m ;
y0 = [c0 c1];
a=0.0;
b=10;
n = 10; %počet N sloupců pro které provádíme výpočet

yend = zeros(11,n);
% theta = 0.5
for i=1:11
    N = 50;
    theta =  0.1.*(i-1)
for j=1:n
    N=N.*2
    tic
    [t,y1] = FractionalWeightedEuler(y_der,a,b,N,alpha,y0,theta);
    toc
    yend(i,j) = y1(end)
end
end
y4 = @(t) (1./m).*(c0.*ml(-k./m.*t.^(alpha),alpha,1)+t.*c1.*(ml(-k./m.*t.^(alpha),alpha,2)));
yreal = y4(10) %přesné řešení v podě t = 10;
yerr = abs(yend - yreal)
% tic
% [t,y1] = FractionalBackwardEuler(y_der,a,b,N,alpha,y0);
% toc
% plot(t,y1,'DisplayName',sprintf('Backward N = %d', N));

%   výpočet odhadu řádu numerické konvergence
EOC = zeros(11,n-1);
for i = 1:11
    for j = 1:n-1
        EOC(i,j) = log((yerr(i,j))/(yerr(i,j+1)))/log(2);
    end
end


% %   vykreslení řešení pro alpha =1.9
% alpha = 1.9;
% y4 = @(t) (1./m).*(c0.*ml(-k./m.*t.^(alpha),alpha,1)+t.*c1.*(ml(-k./m.*t.^(alpha),alpha,2)));
% plot(t,y4(t),'DisplayName',sprintf('alpha = %d', alpha));

% %   vykreslení řešení pro alpha =1.5
% alpha = 1.5;
% y4 = @(t) (1./m).*(c0.*ml(-k./m.*t.^(alpha),alpha,1)+t.*c1.*(ml(-k./m.*t.^(alpha),alpha,2)));
% plot(t,y4(t),'DisplayName',sprintf('alpha = %d', alpha));

% %   vykreslení řešení pro alpha =1.1
% alpha = 1.1;
% y4 = @(t) (1./m).*(c0.*ml(-k./m.*t.^(alpha),alpha,1)+t.*c1.*(ml(-k./m.*t.^(alpha),alpha,2)));
% plot(t,y4(t),'DisplayName',sprintf('alpha = %d', alpha));


% legend('show');