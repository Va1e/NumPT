function int = romberg(f, a, b, tol)
	h =(b-a);
	%todo: negatives h ok?
	%index = @(i) 2-mod(i,2); % man braucht immer nur
		% die letzten beiden zeilen
	m = 1;
	auswertungen = 1;
	I = []; % neville tabelle
	fa = f(a);
	F = [f(b)]; % wertetabelle von f(a+(i-1)h)
	%dreieck = @(m,n) m*(m-1) / 2 + n; % Indexzugriff
	%I{index(m)} = zeros(m);
	
	I = [ h/2 * (fa + F(1)) ];
	
	delta = Inf;
	while delta > tol
	%for count = 1:5
		m = m+1;
		h = h/2;
		auswertungen = 2* auswertungen;
		I = [I, zeros(m-1, 1).+NaN;
			 zeros(1, m-1).+NaN, NaN];
		
		%I = [I, zeros(m)]; % mit glueck macht octave hier was schlaues
		%					%statt zu kopieren
		
		% Wetetabelle spreizen und luecken fuellen
		nF = zeros(auswertungen, 1);
		nF(2:2:auswertungen) = F;
		nF(1:2:auswertungen) = arrayfun(@(x) f(x), linspace(a+h,b-h, auswertungen/2));
		F=nF;
		#I{index(m)}(1)
		I(m,1) = h/2*(fa + F(auswertungen)) + h*sum(F(1:auswertungen-1));
		
		for k = 2:1:m
			n=m+1-k;
			I(n,k) = I(n+1,k-1) + (I(n+1, k-1)- I(n,k-1))/((4^(k-1))-1);
			I;
			%I{index(m)}(2) = 
		end
		I;
		old = abs(I(1,m-1));
		absdelta = abs((I(1, m)-I(1,m-1)));
		if old < tol
			delta = absdelta^2;
		else
			delta = absdelta / old;
		end
	end
	
	int = I(1,m);
end
