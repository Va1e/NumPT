function c=DFT(f)
	N=length(f);
	assert(prod(size(f)) == N);
	c=zeros(size(f));
	for k=1:N
		for j=1:N
			c(k) = c(k) + exp(-2*pi*1i*(j-1)*(k-1) / N) * f(j);
		end
	end
end
