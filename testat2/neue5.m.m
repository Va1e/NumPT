format long
a=rand(3,1)
function [c] = DFT(f)
	m=length(f);
	c=zeros([length(f), 1]);
	for k=1:m
		be=f(1);
		for  l=1:m
			zu=exp((-i*2*pi*(k-1)*(l-1))/m)*f(l);
			be=be+zu;
		end
		c(k)=be;
	end
end
ifft(DFT(a))
