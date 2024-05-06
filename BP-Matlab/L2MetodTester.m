%% Testovací úloha pro L2 metodu 
%   Řešíme aproximaci Caputovy derivace na daném intervalu
%   y_der - funkce pro kterou počítáme aproximaci její Caputovy derivace
%   alpha - stupeň derivace funkce y
%   a,b   - hranice intervalu funkce, na kterém resime problém
%   N     - počet krokův řešení
%   yend  - aproximace derivace v pravém krajním bodě intervalu
%   yerr  - chyba řešení při daném počtu kroků, v případě
%           změny parametrů, je třeba upravit koncovou hodnotu derivace
%   repete- počet iterací, v kolika aproximujeme řešení
clc, clear;
y_der =@(t) 2.*t - 3.*t.^2 + t.^3;
%y_der =@(t) 3.*t.^3;
alpha = 1.5;
a = 0;
b = 2;

repete = 5
yend = zeros(repete+1,1);
yendvalue = 3.1915382432114614235;  %3.989378791412552;%1./pi.*(16/5*5/2*b.^(1.5)+8*3/2*sqrt(b)+4*1/2*1/sqrt(b));3.1915382432114614235
hold on;
for i=0:repete
    N = 100.*(2.^i)
    [t,y] = L2Caputo(y_der,alpha,a,b,N);
    plot(t,y,'DisplayName',sprintf('N = %d', N));
    yend(i+1) = y(end);
end
yerr = abs(yend - yendvalue);

EOC = zeros(repete,1);
for i = 1:repete
    EOC(i) = log((yerr(i))/(yerr(i+1)))/log(2);
end

%%%%%%%%%%následující kód ukazuje, že (-12.*sqrt(t)+8.*t^(3/2))/sqrt(pi)
%%%%%%%%%%skutečně je řešení (jeho integrací dostaneme půodní fci
% % y_back = @(t,y) (-12.*sqrt(t)+8.*t^(3/2))/sqrt(pi);
% % y0 = [0 2];
% % [t,y] = FractionalBackwardEuler(y_back,a,b,N,alpha,y0);
% % plot(t,y,'DisplayName',sprintf('N = %d', N))
% % plot(t,y_der(t),'DisplayName',sprintf('backward'))

legend('show');