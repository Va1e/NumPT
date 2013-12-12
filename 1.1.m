%Blatt 1, Aufgabe 1
format long
%n=[3:3:30];
x=-5.5;
naeherung1 = naeherung2 = 0;

wert_vom_blatt = 0.0040867714

puts("a)\n");

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
relativ_1 = abs(absolut_1/wert_vom_blatt)

puts("b)\n");
for n=3:3:30
	e=1;
	for k=1:n
		s=((-x)^k)/factorial(k);
		e=e+s;
	end
	n
	naeherung2 = 1/e
end
puts("\n");
absolut_2 = abs(naeherung2 - wert_vom_blatt)
relativ_2 = abs(absolut_2/wert_vom_blatt)

puts("c)\n");
for n=3:3:30
	e=1;
	for k=1:n
		s=((-x)^k)/factorial(k);
		e=e+s;
	end
	n
	naeherung3 = e^11
end
puts("\n");
absolut_3 = abs((naeherung3 - wert_vom_blatt))
relativ_3 = abs(absolut_3/wert_vom_blatt)

