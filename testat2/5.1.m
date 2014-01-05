function [c] = DFT(f)
	n=length(f) - 1;
	m=1/(n+1);
	c=zeros([length(f), 1]);
	x=linspace(0,2*pi,length(f))
	for k=1:length(f)
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
%{
g=[2;2.5;2.33;1.98];
y=[1;2;2.4;5];
DFT(g)
%}

function [R] = myImgCompression(img, compr)
  B=imread(img);
  
  %  image(B)
end