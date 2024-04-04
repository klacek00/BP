clc, clf, clear;
% n=100;
% startpoint = 0.9999;
% finishpoint = 100;
alpha = 0.1;
beta = 0.2;
%z = zeros(2001,1)
z = 1;
% t = linspace(startpoint,finishpoint,n);
% t = startpoint:((finishpoint-startpoint)/n):finishpoint;

% y1 = 3.^t;
% y2 = gamma(0.1.*t+0.2);
y3 =  zeros(1,1710);
for n=1:1710
   y3(n) = z .* gamma(alpha.*(n) + beta) ./ gamma(alpha.*(n+1) + beta);
end
% y3 = z .* gamma(alpha.*(n+1) + beta) ./ gamma(alpha.*(n+2) + beta)
% plot(t,y1);
% hold on;
% plot(t,y2);
plot(y3, 'LineWidth',3)
% legend('q','FontSize',12)
xlabel('n')
ylabel('q')
% ax.Legend.TextColor = 'black';