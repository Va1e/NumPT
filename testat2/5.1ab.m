%% myImgCompression: Zeilenweise Bildkompression
function [R] = myImgCompression(img, compr, imgout)	
	if nargin==2
		imgout=img
	end
	compress=compr/100
	B=imread(img);
	s=size(B)
	%Es gibt heute keie S/W Bilder mehr => nur 3D Matrizen
	for c=1:1:s(3)
		for y=1:1:s(1)
			transformed=fft(double(B(y,:,c)));
			[sor,ind]=sort(abs(transformed));
			for x=1:round(length(ind)*compress)
				transformed(ind(x))=0;
			end
			zuncompr=real(ifft(transformed));
			B(y,:,c)=zuncompr;
		end
	end
	imwrite(B,imgout)
	%image(B)
end
for index=0:10:100
	myImgCompression("largecat.bmp",index,[sprintf("catcomp%.3d.jpg", index)])
end
