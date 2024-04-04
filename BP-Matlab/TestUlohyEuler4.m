%Testovací metody euler uloha4
% v tomto programu je nejaka chyba???????
format long;
hold on;
alpha = 0.1;
y_der = @(t,y) -y.^2 -2/((t+1).^2);
y0 = -2;
a=1;
b=2;
N = 100;

pocet = 1;
ykon1 = zeros(pocet,1);
ykon2 = zeros(pocet,1);
ykon3 = zeros(pocet,1);
ykon = -2/2;
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
y4 = -2/(t+1);

yerr1 = ykon1-ykon
yerr2 = ykon2-ykon
yerr3 = ykon3-ykon


hold on;
% plot(t,y);
% plot(t,y,'DisplayName',sprintf('Forward N = %d', N));
plot(t,y4,'DisplayName',sprintf('t^2-t'));
legend('show');