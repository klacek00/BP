%% Testovací úloha pro L1 metodu 
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
alpha = 0.7;
a = 0;
b = 2;

repete = 15;
yend = zeros(repete+1,1);

%hold on;
for i=0:repete
    N = 100.*(2.^i)
    [t,y] = L1Caputo(y_der,alpha,a,b,N);
    %plot(t,y,'DisplayName',sprintf('N = %d', N));
    yend(i+1) = y(end);
end
yerr = abs(yend -(0.63830764864229228470));

EOC = zeros(repete,1);
for i = 1:repete
    EOC(i) = log((yerr(i))/(yerr(i+1)))/log(2);
end

%legend('show');