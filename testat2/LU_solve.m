function [x] = LU_solve(A, b)
	LU=LU_decompose(A);
	z = forward_solve(LU, b);
	x = backward_solve(LU, z);
end
