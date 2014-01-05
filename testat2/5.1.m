function [c] = DFT(x,f)
	if length(x)!=length(f)
	   error('x and f(x) differ in length');
	end
	n=length(x) - 1;
	m=1/(n+1);
	c=zeros([length(x), 1]);

	for k=1:length(x)
	  be=m*f(k);
%	  zw=be;
	  for l=0:1:n
	    zu=m*f(l+1)*exp(-i*l*x(k));
	    be=be+zu;
	  end
	  c(k)=be;
	end
end

%y=input('x:')
%g=input('f:')
g=[2;2.5;2.33;1.98];
y=[1;2;2.4;5];
DFT(y,g)