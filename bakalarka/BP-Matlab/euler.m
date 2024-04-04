%% symbolic
a=0;
b=5;
N=1000;
h=(b-a)/N;
%t=linspace(a,b,N+1);
t=zeros(N+1);
t(1) = a;
y = zeros(N+1);
y(1) = 1;
% 
% %explicit euler
% for n=1:N
%     y(n+1)=y(n) + fce(t(n), y(n))*h;
%     t(n+1) = t(n)+h;
% end
% plot(t,y)

%implicit euler
for n=1:N
    %y(n+1)=y(n) /(1 - fce(t(n), y(n))*h);
%     eqn = a*x^2 + b*x + c == 0;
    solve(y(n)+fce(t(n),y(n)*h)-y(n+1),y(n+1));
    t(n+1) = t(n)+h;
end
%pouzit fci fzero
plot(t,y)
clear
