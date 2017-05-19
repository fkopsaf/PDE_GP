function [H] = h(x, y, hyp,i)

logsigma = hyp(1);
logtheta = hyp(2);

if i == 0 || i == 1
    
    hh = @(x,y) exp(1).^(logsigma+(-1).*logtheta+(-1/2).*exp(1).^((-1).*logtheta) ...
        .*(x+(-1).*y).^2).*(2.*exp(1).^logtheta+x+(-1).*y)+5.*exp(1).^( ...
        logsigma+(1/2).*logtheta).*((1/2).*pi).^(1/2).*(erf(2.^(-1/2).* ...
        exp(1).^((-1/2).*logtheta).*x)+erf(2.^(-1/2).*exp(1).^((-1/2).* ...
        logtheta).*((-1).*x+y)));
    
    H = bsxfun(hh,x,y');
    
elseif i == 2
    hh = @(x,y) (1/4).*exp(1).^(logsigma+(-1/2).*exp(1).^((-1).*logtheta).*x.^2).* ...
        ((-10).*x+2.*exp(1).^((-2).*logtheta+(-1/2).*exp(1).^((-1).* ...
        logtheta).*y.*((-2).*x+y)).*(5.*exp(1).^(2.*logtheta)+2.*exp(1) ...
        .^logtheta.*((-1)+x+(-1).*y)+(x+(-1).*y).^2).*(x+(-1).*y)+5.*exp( ...
        1).^((1/2).*(logtheta+exp(1).^((-1).*logtheta).*x.^2)).*(2.*pi).^( ...
        1/2).*(erf(2.^(-1/2).*exp(1).^((-1/2).*logtheta).*x)+(-1).*erf( ...
        2.^(-1/2).*exp(1).^((-1/2).*logtheta).*(x+(-1).*y))));
    
    H = bsxfun(hh,x,y');
end
