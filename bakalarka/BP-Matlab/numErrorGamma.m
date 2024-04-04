clc, clf, clear;
format long;        
z= 170.5;
alpha = 0.1;
a=1;

b = gamma(z-alpha)/gamma(z)
for i=1:180
    a = a*(z-alpha)/z;
    
    if (z <= 2)
        a = a*gamma(z-alpha)/gamma(z)
        break;
    end
    z = z-1;
end
absErr=abs(a-b)
relErr=abs(a-b)/b