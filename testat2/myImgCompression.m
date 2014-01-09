function myImgCompression(infile, compr, outfile)
	%optionaler Dateiname für Ausgabe
	if nargin == 2
		outfile=infile;
	end
	B=imread(infile);
	dims = size(B);
	ncs = dims(3);
	width = dims(2);
	height = dims(1);
	
	for c = 1:ncs
		for y = 1:height
			transformed = fft(double(B(y,:,c)));
			[sorted, permutation] = sort(abs(transformed)); % sorted is unused
			nnuller = max(min(width, round(double(compr)/100 * width)), 0);
			

			%for i= 1 : endindex
			%	transformed(1,permutation(i)) = 0;
			%end
			% oder in schnell:
			transformed(permutation(1:nnuller))=zeros([1,nnuller]);

			compressed = uint8(real(ifft(transformed)));
			B(y,:,c) = compressed;
			progress=round(100*(y/height/ncs + (c-1)/ncs));
			disp(progress);
		end
	end
	imwrite(B, outfile);
end
