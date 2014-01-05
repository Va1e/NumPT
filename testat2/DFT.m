a=rand(2,1);
function c=DFT(f)
	N=length(f);
	c=zeros([1,N]); % size(f) mal probieren
	for k=1:N
		for j=1:N
			c(k) += exp(-2*pi*1i*(j-1)*(k-1) / N) * f(j);
		end
	end
end
ifft(DFT(a))