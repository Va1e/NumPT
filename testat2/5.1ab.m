%% myImgCompression: Zeilenweise Bildkompression
function [R] = myImgCompression(img, compr, imgout)	
	if nargin==2
		imgout=img
	end
	compress=compr/100
	B=imread(img);
	s=size(B)
	image(B)
	ind=0
	sor=0
	for c=1:1:s(3)
		for y=1:1:s(1)
			Z=fft(double(B(y,:,c)));
			[sor,ind]=sort(Z);
			%s,i=sort(e)
			%e(i)
			for x=2:2:round(length(ind)*compress)
				Z(x)=0;
			end
			zuncompr=ifft(Z);
			B(y,:,c)=zuncompr;
		end
	end
	imwrite(B,imgout)
end

myImgCompression("logo.png",30,"logocomp.bmp")