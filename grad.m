function G = grad(f,X_sym,X) 
% This function computes the numerical gradient vector of a a given
% function f, or more specifcally f(X_sym), where X_sym is the input vector
% for the function f, in the form of either row or column. The vector X
% represents the current coordinate the gradient is to be evaluated. The
% dimensions of X_sym and X must match, that is size(X_sym)(i)==size(X)(i)
% for arbitrary indices of i. 
format long
%Record dimensions of the input vector. 
sizeX = size(X); 
sizeX_sym = size(X_sym); 
%Ensure that input format is a sizeX vector. 
if not(sizeX(2)==1)||not(sizeX(1)==sizeX_sym(1)||sizeX(2)==sizeX_sym(2)) 
    %Transpose a row vector to a column vector if necessary. 
    if sizeX(1)==1
        X = X.'; 
        X_sym = X_sym.'; 
        sizeX = size(X); 
        sizeX_sym = size(X_sym); 
    else
         G = 'Invalid Input: Intial Coordinate Dimension!'; 
         return 
    end 
end
%Initialize gradient vector as a column vector. 
G = zeros(sizeX(1),1); 
%Compute gradient. 
for i=1:sizeX(1)
    G(i) = NDER(f,X_sym,X_sym(i),X);  
end 
