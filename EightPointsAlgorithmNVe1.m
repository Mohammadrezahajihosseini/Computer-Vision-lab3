function [F] = EightPointsAlgorithmNVe1(P1, P2)
%% 1.Matrix A
A = [P2(1,:)'.*P1(1,:)' P2(1,:)'.*P1(2,:)' P2(1,:)' ...
P2(2,:)'.*P1(1,:)' P2(2,:)'.*P1(2,:)' P2(2,:)' ...
P1(1,:)' P1(2,:)' ];
%% add a column of 1
[i,j] = size(A);
NewCol = ones(i,1);
A = [A NewCol];
%% 2.Compute the SVD decomposition of A 
[U,D,V] = svd(A);
%% 3.Extract fundamental matrix from the column of V
% corresponding to the smallest singular value.
F = reshape(V(:,9),3,3)';
%% Enforce rank2 constraint
[U,D,V] = svd(F);
D(3,3) = 0;
F = U*D*V';