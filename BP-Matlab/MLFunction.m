function E = MLFunction(z, alpha, beta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
UpperLimit = 100000 ;
eps = 0.0000001; 
E = 0;
E_pom = 0;

%přidat podmínku, že abs(z)<=1! - nebo jinou podmínku na konvergenci
 
if(alpha == 0)
    if(abs(z) < 1)
        E = 1./((1-z).*gamma(beta));
% % %         E = 1./(1-z);
        return;
    end
    return;
end
n = UpperLimit;
pokusor = 15/20;
mezivysledek = 1;
for i=10:UpperLimit
    blabla = alpha*i+beta;
    while blabla > 2
        mezivysledek = mezivysledek * (blabla)/(alpha+blabla);
        blabla = blabla -1;
    end
    mezivysledek = mezivysledek*gamma(blabla)/gamma(blabla+alpha);
    if mezivysledek < pokusor
        n = i
        break
    end
end





%n=50;
% % % % % if (z .* gamma(alpha.*(3) + beta) ./ gamma(alpha.*(4) + beta)>pokusor)
% % % % %     if(z .* gamma(178-alpha) ./ gamma(178)<pokusor)
% % % % %         % neco2 = @(n) 3 .* z.^(n+1) - 2 .* gamma(alpha.*(n+1) + beta);
% % % % %         neco2 = @(n) (z .* gamma(alpha.*(n+1) + beta) ./ gamma(alpha.*(n+2) + beta)) - pokusor;
% % % % %         n = fzero(neco2, 50)
% % % % % 
% % % % %     else
% % % % %         nelze vycislit
% % % % %         return
% % % % %     end
% % % % % 
% % % % % else
% % % % %     n = 2
% % % % % end
% % % % % n = abs(n);
% % % % % n = ceil(n+1);
neco3 = @(k) (((z.^(k+n))./gamma(alpha .* (k+n) + beta))/(1-pokusor)) - eps;
k = fzero(neco3, 10)
if k<0
%     k=0;
    k=abs(k) %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end
j = ceil(n+k)
%n = ceil(n)
% % % % % 
% for k = 0:UpperLimit
for k = n:-1:0
    E = E_pom + (z.^k)./gamma(alpha .* k + beta);


%     if E-E_pom<eps
% %         k;
%         break;
%     end

%     if k==UpperLimit
% %         E = 0;
% %         Ressult is too bad
%         break;
%     end

    E_pom = E;
end

% E;
end