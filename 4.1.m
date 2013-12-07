%% myNatCubSpline: Natural Cubic Spline through x_i, y_i
function [c] = myNatCubSpline(x,y)
	
	if not(length(x)==length(y))
		error('x and y differ in length');
	end
	
	n = length(x)-1
	c = zeros(n,4);
	
	if n == 1
		c(1,1)=y(1);
		c(1,2)=(y(2)-y(1))/(x(2)-x(1));
		return;
	end

	c(1:n,1+0) = y(1+0:1+n-1);
	h=x(1+1:1+n) - x(1+0:1+n-1);
	h
	if n == 2
		A=2*(h(1)+h(2));
	else
		A=2*diag(h(1:n-1)+h(2:n));
		A+=diag(h(2:n-1),-1);
		A+=diag(h(2:n-1),+1);
	end
	A

	rechteseite = transpose(3*((y(1+2:1+n)   - y(1+1:1+n-1)) ./ h(2:n)- ...
							 (y(1+1:1+n-1) - y(1+0:1+n-2)) ./ h(1:n-1)));
	
	rechteseite

	c(1:n-1, 1+2) = A\rechteseite;
	c(n, 1+2) = 0;

	c(1,1+3) = c(1,1+2)/3*h(1);
	c(2:n,1+3) = transpose((c(2:n,1+2) - c(1:n-1, 1+2))) ./ (3*h(2:n));
	c(1, 1+1) = (y(1+1)-y(1+0))/h(1) + h(1)/3*(2*c(1,1+2));
	c(2:n, 1+1) = (y(1+2:1+n)-y(1+1:1+n-1))./h(2:n) + ...
		h(2:n)/3*(2*c(2:n,1+2)+c(1:n-1,1+2));
end

% nicht fertig, da asymptotisch nicht wichtig, da gleichgungssystem
% loesen mehr zeit braucht bei wenigen z, und bei vielen z  ungefaehr |x| = log |x| :) 
function [l,u]=binseach(haystack, needle)
	li=1;
	ui=length(haystack);
	while true
		midl=floor(li+up)/2;
		midu=midl+1;
		if(haystack(midl) <= needle && haystack(midu)>=needle)
			l=haystack(midl);
			u=haystack(midu);
			break;
		end
		if needle <= haystack(midl)
			ui=midl;
		end

	end
end

function j=search(haystack, needle)
	l=length(haystack);
	if needle <= haystack(1);
		j=1;
	elseif needle >= haystack(l-1)
		j=l-1;
	else
		for i=1:l-1
			if(haystack(i)<=needle)
				j=i;
			end
		end
	end
end


%% myNatCubSplineEval: Evaluates myNatCubSpline
function [y] = myNatCubSplineEval(x,c,z);
	n=length(z);
	y=zeros(n,1);
	for i=1:n
		zi=z(i);
		j=search(x,zi);
		dx=z(i)-x(j);
		cj=c(j,:);
		y(i)=((cj(4)*dx + cj(3))*dx + cj(2))*dx + cj(1);
	end
end

function [s]=chebspace(howmany)
	n=howmany-1;
	s=zeros(1,howmany);
	for i=0:howmany-1
		s(1+i) = -cos(((2*i+1)*pi)/(2*n+2));
	end
end

function myNatCubSplineTest()

	runge = @(x)  (1 + 25*x .^ 2).^(-1);

	ns = [7,12,17];
	for i=1:length(ns)
		n=ns(i);
		px = linspace(-1,1,1000);
		
		aex=linspace(-1,1,n+1);
		aey = runge(aex);
		aec=myNatCubSpline(aex,aey);
		paey = myNatCubSplineEval(aex,aec, px);
		
		cx=chebspace(n+1);
		cy=runge(cx);
		cc = myNatCubSpline(cx,cy);
		pcy=myNatCubSplineEval(cx,cc,px);
		
		figure(i);
		hold;
		
		plot(px, runge(px), 'g');
		plot(aex,aey, 'r*', 'markersize', 10);
		plot(px,paey, 'r');
		plot(cx,cy, 'b*', 'markersize', 10);
		plot(px,pcy, 'b');
		print(sprintf('NI-%d.fig', n));
		replot;
		diffx = linspace(-1,1,101);
		diffr = runge(diffx);
		diffaey = myNatCubSplineEval(aex,aec, diffx);
		diffcy = myNatCubSplineEval(cx,cc, diffx);
		n
		printf("Maximale Abweichung bei Aequidistanten Knoten: %f\n", ...
				max(diffx-diffaey));
		printf("Maximale Abweichung bei Chebycheffknoten: %f\n", ...
				max(diffx-diffcy));
	end
end

