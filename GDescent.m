function X = GDescent(f,X_sym,X_p,lRate) 
%This function recursively solves for the input vector that yields a local
%minimum of the the function f, or more specifically f(X_sym). The vector
%X_p indicates the current coordinate, or input value, for the gradient
%descent to be computed. The field lRate represents the desired learning
%rate for this descent procedure. 
format long
%Initialize the projected after-descent coordinate as initial coordinate. 
X = X_p; 
%Record input dimensions. 
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
         X = 'Invalid Input: Intial Coordinate Dimension!'; 
         return 
    end
end   
%Compute gradient. 
G = grad(f,X_sym,X);  
%Descend in the direction of the gradient vector. 
X = X - lRate*G
%Recursively compute the minimum. 
GDescent(f,X_sym,X,lRate); 