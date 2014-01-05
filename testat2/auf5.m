format long

g=[2;2.5;2.33;1.98];
function [c] = DFT(f)
%	n=length(f) - 1;
	m=1/(length(f));
	c=zeros([length(f), 1]);
	x=linspace(0,2*pi,length(f))
	flen=length(f)
	xlen=length(x)
	for k=1:length(f)
	  be=m*f(k);
	  for l=0:length(f)-1;
	    zu=m*f(l+1)*exp(-i*l*x(k));
	    be=be+zu;
	  end
	  c(k)=be;
	end
end



%y=input('x:')
%g=input('f:')

disp('dft:');
z=DFT(g)
disp('fft:');
matlabfft=fft(g)
disp('ruecktrafo')
ifft(z)
ifft(matlabfft)

function [R] = myImgCompression(img, compr)
  B=imread(img);
  
  %  image(B)
end
