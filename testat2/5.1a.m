%% myImgCompression: Zeilenweise Bildkompression
function [R] = myImgCompression(img, compr, imgout)	
	if nargin==2
		imgout=img
	end
	B=imread(img);
	s=size(B)
	for c=1:1:s(3)
		for y=1:1:s(1)
			Z=fft(double(B(y,:,c)));
%			[sor,ind]=sort(R);
			%s,i=sort(e)
			%e(i)
		end
	end
	image(Z)
end