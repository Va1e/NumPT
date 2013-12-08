%Blatt 1, Aufgabe 1
format long
%n=[3:3:30];
x=-5.5;
naeherung1 = naeherung2 = 0;

wert_vom_blatt = 0.0040867714
wert_aus_octave=exp(-5.5)

puts("a)\n");

for n=3:3:30
	e=1;
	for k=1:n
		s=(x^k)/(factorial(k));
		e=e+s;
	end
	naeherung1 = e
end

absolut_1 = (naeherung1 - wert_aus_octave)
relativ_1 = absolut_1/wert_vom_blatt

puts("b)\n");
for n=3:3:30
	e=1;
	for k=1:n
		s=((-x)^k)/factorial(k);
		e=e+s;
	end
		naeherung2 = 1/e
end
puts("\n");
absolut_2 = (naeherung2 - wert_aus_octave)
relativ_2 = absolut_1/wert_vom_blatt
