clc, clf, clear;

n=50;
startpoint = -30.999;
finishpoint = 10.999;
% t = linspace(startpoint,finishpoint,n);
t = startpoint:((finishpoint-startpoint)/n):finishpoint;
beta = 2;
hold on
ylim([-10 10])
%alpha = 0.5;
x = 0;

alpha = 0:1:10;
for i =2:2    
    y = MLFunction(t,alpha(i),beta);
    plot(t,y);
end
