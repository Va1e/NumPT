function [x] = backward_solve(LU, z)
	N=size(z, 1);
	N
	assert(all(size(LU) == [N,N]));
	for i = N:-1:1
		z(i,:) = z(i,:) / LU(i,i);
		z(1:i-1, :)  = z(1:i-1, :) - LU(1:i-1, i)*z(i,:);
	end
	x=z;
end
