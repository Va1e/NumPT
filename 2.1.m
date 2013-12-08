function [c]=myNewtonInterpol(x,f)
	if length(x)!=length(f)
		error('x and f(x) differ in length');
	end
	n = length(x) - 1;
	y = diag(f);
	for i=n:-1:0
		for j=i+1:n
			y(1+i,1+j)=(y(1+i+1,1+j)-y(1+i,1+j-1))/...
					(x(1+j)-x(1+i));
			end
	end
	c=zeros([n+1, 1]);
	for i=0:n
		c(1+i) = y(1+0, 1+i);
	end
end

%% myNewtonInterpolHorner: evaluates the newton interpolation polynom
%% given as x,c at z.
function [y] = myNewtonInterpolHorner(x,c,z)
	if length(x)!=length(c)
		length(x)
		length(c)
		x
		c
		error('x and c differ in length');
	end
	n=length(x)-1;
	y=ones(size(z)) .* c(1+n);
	for i=n-1:-1:0
		y = y .* (z-x(1+i));
		y = y .+ c(1+i);
	end
end

function [s]=chebspace(howmany)
	n=howmany-1;
	s=zeros(1,howmany);
	for i=0:howmany-1
		s(1+i) = cos(((2*i+1)*pi)/(2*n+2));
	end
end

function myNewtonInterpolTest()

	runge = @(x)  (1 + 25*x .^ 2).^(-1);

	ns = [7,12,17];
	for i=1:length(ns)
		n=ns(i);
		px = linspace(-1,1,1000);
		
		aex=linspace(-1,1,n+1);
		aey = runge(aex);
		aec=myNewtonInterpol(aex,aey);
		paey = myNewtonInterpolHorner(aex,aec, px);
		
		cx=chebspace(n+1);
		cy=runge(cx);
		cc = myNewtonInterpol(cx,cy);
		pcy=myNewtonInterpolHorner(cx,cc,px);
		
		figure(i);
		hold;
		
		plot(px, runge(px), 'g');
		plot(aex,aey, 'r*', 'markersize', 10);
		plot(px,paey, 'r');
		plot(cx,cy, 'b*', 'markersize', 10);
		plot(px,pcy, 'b');
		%print & replot ist wie saveas in matlab.
		print(sprintf('NI-%d.fig', n)); % fig ist xfig, nicht matlab fig.
		replot;
		
		diffx = linspace(-1,1,101);
		diffr = runge(diffx);
		diffaey = myNewtonInterpolHorner(aex,aec, diffx);
		diffcy = myNewtonInterpolHorner(cx,cc, diffx);
		n
		printf("Maximale Abweichung bei Aequidistanten Knoten: %f\n", ...
				max(diffx-diffaey));
		printf("Maximale Abweichung bei Chebycheffknoten: %f\n", ...
				max(diffx-diffcy));
	end
end

