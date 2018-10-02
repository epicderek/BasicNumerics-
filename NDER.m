function d = NDER(f,X_sym,x_sym,X) 
%This function computes the numerical partial derivative of a function f, or more
%specifically f(X_sym), where X_sym is the independent vector variable, x_sym is the 
%independent variable the function f is to be differentiated with respect to, and
%X is a particular value of the input vector, on which the partial derivative is to 
%be evaluated. 
format long 
%Record dimensions of input array. 
sizeX = size(X); 
sizeX_sym = size(X_sym); 
%If the input array is not a row or column vector. 
if not(sizeX(1)==1||sizeX(2)==1)||not(sizeX(1)==sizeX_sym(1)||sizeX(2)==sizeX_sym(2))
    d = 'Invalid Input Dimension';  
    return 
end 
%Differentiate the given function with respect to the given variable. 
der(X_sym) = diff(f,x_sym); 
%Unpack the vector X to cell array.
X_cell = num2cell(X);     
d = eval(der(X_cell{:}));