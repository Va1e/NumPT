%% myNatCubSpline: Natural Cubic Spline through x_i, y_i
function [c] = myNatCubSpline(x,y)
	if not(length(x)==length(y))
		error('x and y differ in length');
	end
	
	n = length(x)-1;
	c = zeros(n+1,4);
	
	for i = 0:n-1
		c(1+i,4) = y(1+i);
	end

	rechteseite = zeros(3*n,1);
	@apos = @(i) 1+(i)*3;
	@bpos = @(i) apos(i)+1;
	@cpos = @(i) bpos(i)+1;
	A=zeros(3*n);
	z=1 ; % zeilenzaeler: welche gleichung schreiben wir gerade.
	A(z,bpos(0))=1;
	rechteseite(z)=0;
	z=z+1;
	for i = 0:n-1
		dx=x(1+i+1)-x(1+i);
		dx2=dx1*dx;
		dx3=dx2*dx;
		%Stetigkeit des Splines
		A(z,apos(i))=dx3;
		A(z,bpos(i))=dx2;
		A(z,cpos(i))=dx;
		rechteseite(z)=y(1+i+1);
		z=z+1;

		%Stetigkeit der Ableitung
		A(z,apos(i))=3*dx2;
		A(z,bpos(i))=2*dx;
		A(z,cpos(i))=1;
		A(z,cpos(i+1))=-1;
		rechteseite(z)=0;
		z=z+1;

		%Stetigk. d. 2. Abl.
		A(z,apos(i))=6*dx;
		A(z,bpos(i))=2;
		A(z,bpos(i))=-2;
		rechteseite(z)=0;
		z=z+1;
	end
	A(z,apos(n-1))=6*(x(1+n)-x(1+n-1));
	A(z,bpos(n-1))=2;
	rechteseite(z)=0;
	%Loesung trivial Uebung
	loesung=A\rechteseite;
	for i = 0:n-1
		c(i,1)=loesung(apos(i));
		c(i,2)=loesung(bpos(i));
		c(i,3)=loesung(cpos(i));
	end
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

%% myNatCubSplineEval: Evaluates myNatCubSpline
function [y] = myNatCubSplineEval(x,c,z);

end
