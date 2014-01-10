function c=iDFT(f)
	N=length(f);
	c=zeros(size(f));
	assert(prod(size(f))==N)
	for k=1:N
		for j=1:N
			c(k) = c(k) + exp(2*pi*j*(k-1)/N)*f(j);
		end
	end
end