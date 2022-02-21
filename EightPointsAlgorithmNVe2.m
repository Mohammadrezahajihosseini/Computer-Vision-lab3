function [F] = EightPointsAlgorithmNVe2(P1, P2)
%% 1.Normalize the points using the function normalise2dpts
[P1, T1] = normalise2dpts(P1);
[P2, T2] = normalise2dpts(P2);
%% 2.Matrix A
A = [P2(1,:)'.*P1(1,:)' P2(1,:)'.*P1(2,:)' P2(1,:)' ...
P2(2,:)'.*P1(1,:)' P2(2,:)'.*P1(2,:)' P2(2,:)' ...
P1(1,:)' P1(2,:)' ];
%% add a column of 1 in end of matrix
[i,j] = size(A);
NewCol = ones(i,1);
A = [A NewCol];
%% 3.Compute the SVD decomposition of A 
[U,D,V] = svd(A);
%% Extract fundamental matrix from the column of V
% corresponding to the smallest singular value.
F = reshape(V(:,9),3,3)';
%% 4.Enforce rank2 constraint
[U,D,V] = svd(F);
D(3,3) = 0;
F = U*D*V';
%% 5.Denormalise
F = T2'*F*T1;