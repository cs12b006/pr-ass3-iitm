% X is row
function [pdf] = mvnGaussian(X,mu,sigma)
    k = size(X,2);
    cons = 1/sqrt((2*pi)^k*abs(det(sigma)));
    body = exp(-0.5*(X-mu)*inv(sigma)*(X-mu)');
    pdf = cons*body;
end