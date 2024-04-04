%Testovací metody euler uloha3
format long;
hold on;
alpha = 0.1;
y_der = @(t,y) (2/gamma(3-alpha)).*t^(2-alpha) -(1/gamma(2-alpha)).*t^(1-alpha) -y + t.^2 -t;
y0 = 0;
a=0.0;
b=1;
N = 100;

pocet = 1;
ykon1 = zeros(pocet,1);
ykon2 = zeros(pocet,1);
ykon3 = zeros(pocet,1);
ykon = 1.^2-1;
for i=1:pocet
    N = N*10
tic
[t,y1] = FractionalForwardEuler(y_der,a,b,N,alpha,y0);
plot(t,y1,'DisplayName',sprintf('Forward N = %d', N));
ykon1(i) = y1(end);
toc

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
% y4 = ml(-t.^alpha, alpha);
y4 = (t).^2-t;

yerr1 = ykon1-ykon
yerr2 = ykon2-ykon
yerr3 = ykon3-ykon


hold on;
% plot(t,y);
% plot(t,y,'DisplayName',sprintf('Forward N = %d', N));
plot(t,y4,'DisplayName',sprintf('t^2-t'));
legend('show');