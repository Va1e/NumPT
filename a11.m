%
% while true; do curl olpp.net/~marco/aufgabe11.m > aufgabe11.m; sleep 1; done
%

%Blatt 1, Aufgabe 1
format long
%n=[3:3:30];
x=-5.5;
x2=x/11;
naeherung1 = 0;
naeherung2 = 0;
naeherung3 = 0;
wert_vom_blatt = 0.0040867714

disp('a)');

for n=3:3:30
	e=1;
	for k=1:n
		s=(x^k)/(factorial(k));
		e=e+s;
	end
    n
    naeherung1 = e
end

absolut_1 = (naeherung1 - wert_vom_blatt)
relativ_1 = absolut_1/wert_vom_blatt

disp("b)");
for n=3:3:30
	e=1;
	for k=1:n
		s=((-x)^k)/factorial(k);
		e=e+s;
	end
    n
	naeherung2 = 1/e
end
disp('');

absolut_2 = (naeherung2 - wert_vom_blatt)
relativ_2 = absolut_2/wert_vom_blatt

for n=3:3:30
	e=1;
	for k=1:n
		s=((-x2)^k)/factorial(k);
		e=(e+s);
	end
    n
	naeherung3 = (1/e)^11
end
disp('');

absolut_3 = (naeherung3 - wert_vom_blatt)
relativ_3 = absolut_3/wert_vom_blatt

