%% Testovaci uloha Garrappa


alpha = 0.5;
al = alpha;
y_der =@(t,y) 40320./gamma(9-al).*(t.^(8-al)) - 3*gamma(5+al./2)./gamma(5-al/2).*t.^(4-al/2)+9/4*gamma(al+1) + (3/2.*t.^(al/2)-t.^4).^3 - (y.^(3/2)) ;
y0 = 0;
a=0.0;
b=1.0;
theta = 0.5;
N = 250;
hold on;

ysol =@(t) t.^8-3.*t.^(4+alpha/2) + 9./4.*t.^alpha;
repete = 5;
yend = zeros(repete,1);
for i=1:repete
    N = N.*2
    [t,y1] = FractionalBackwardEuler(y_der,a,b,N,alpha,y0);
    plot(t,y1,'DisplayName',sprintf('Backward N = %d', N));
    yend(i) = y1(end);
end
sol = ysol(t(end));
yerr = abs(yend - sol);

EOC = zeros(repete,1);
for i = 1:repete-1
    EOC(i) = log((yerr(i))./(yerr(i+1)))/log(2);
end

plot(t,ysol(t),'k')
legend('show')