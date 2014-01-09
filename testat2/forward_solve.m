function [z] = forward_solve(LU, b)
	N=size(b,1);
	assert(all(size(LU) == [N,N]));
	for i = 1:N
		b((i+1):N,:)  = b(i+1:N,:) - LU(i+1:N,i)*b(i,:);
	end
	z=b;
end
