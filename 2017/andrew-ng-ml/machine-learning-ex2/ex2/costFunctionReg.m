function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y);     % number of training examples
t = size(theta);   % number of theta parameters

% You need to return the following variables correctly 
J = 0;
grad = zeros(t);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J = 1/m * sum( ...
               -y'*log(sigmoid(X*theta)) ...
               -(1-y)'*log(1-sigmoid(X*theta)) ...
             ) ...
          + lambda / 2 / m * theta(2: t)'*theta(2: t);

grad(1) = (1/m * X'*(sigmoid(X*theta) - y))(1);
grad(2:t) =  (1/m * X'*(sigmoid(X*theta) - y) + lambda/m * theta)(2: t);


% =============================================================

end
