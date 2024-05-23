%% L2 metoda vypoctu Caputovy derivace
function [t,y] = L2Caputo(y_der,alpha,a,b,N)
%   Funkce resici zlomkovou derivaci funkce y(t) radu alpha
%   alpha - stupeň derivace mezi 1 a 2
%   a,b   - hranice intervalu funkce ktera se derivuje
%   N     - pocet kroku

format long;
t = linspace(a,b,N+1);

y = zeros(N,1);
y(1) = 0;
tau = t(2)-t(1);

% % % W = zeros(N+2,1);
% % % for k = -1:N
% % %    switch k
% % %         case -1
% % %             W(k+2) = 1;
% % %         case 0
% % %             W(k+2) = 2.^(2-alpha)-3;
% % %         %case k>=1 & k<=N-2
% % %             %W(k+2) = (k+2).^(2-alpha)-3.*(k+1).^(2-alpha)+3.*k.^(2-alpha)-(k-1).^(2-alpha);
% % %         case N-1
% % %             W(k+2) = -2.*N.^(2-alpha)+3.*(N-1).^(2-alpha)-(N-2).^(2-alpha);
% % %         case N
% % %             W(k+2) = N.^(2-alpha) - (N-1).^(2-alpha);
% % %        otherwise
% % %             W(k+2) = (k+2).^(2-alpha)-3.*(k+1).^(2-alpha)+3.*k.^(2-alpha)-(k-1).^(2-alpha);
% % %     end
% % %     %W(k) = (tau.^(-alpha))./(gamma(2-alpha)).*((i+1).^(1-alpha) - i.^(1-alpha));
% % %     W(k+2) = W(k+2)*(tau.^(-alpha))/gamma(3-alpha);
% % % end
% % % 
% % % for n=1:(N-1)%i=0:k-1, ale matlab čísluje od 1
% % %     for k = -1:n
% % %         y(n+1) = y(n+1) + (W(k+2).*y_der(t(n-k+1)));
% % %     end
% % % end

for n=2:(N-1)%i=0:k-1, ale matlab čísluje od 1
    for k = -1:n       
           switch k
                case -1
                    W= 1;
                case 0
                    W= 2.^(2-alpha)-3;
                %case k>=1 & k<=N-2
                    %W(k+2) = (k+2).^(2-alpha)-3.*(k+1).^(2-alpha)+3.*k.^(2-alpha)-(k-1).^(2-alpha);
                case n-1
                    W= -2.*n.^(2-alpha)+3.*(n-1).^(2-alpha)-(n-2).^(2-alpha);
                case n
                    W= N.^(2-alpha) - (n-1).^(2-alpha);
               otherwise
                    W= (k+2).^(2-alpha)-3.*(k+1).^(2-alpha)+3.*k.^(2-alpha)-(k-1).^(2-alpha);
            end
            W= W*(tau.^(-alpha))/gamma(3-alpha);           
        y(n+1) = y(n+1) + (W.*y_der(t(n-k+1)));
    end
end
t = t(2:end);
y = y(1:end);
end