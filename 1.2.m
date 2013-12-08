%Aufgabe 1.2

P7a = @(x) x.^7 - 7.*x.^6 + 21.*x.^5 - 35 .* x.^4 + 35 .* x.^3 - 21 .* x.^2 +  7 .* x .- 1
P7b = @(x) (x-1).^7
P7c = @(x) ((((((x - 7).*x + 21).*x - 35).*x + 35).*x - 21).*x+7).*x - 1

x=single([0.8:5e-5:1.2]); % Single fuer ungenaues rechnen
genau=P7b([0.8:5e-5:1.2]);

subplot(2,2,1);
y=P7a(x);
plot(x, y); %Wie zu erwarten viel Ausloeschung; immer +- abwechselnd
% euclidischer abstand zur "genauen" loesung:
delta1 = sqrt(sum((genau-y).^2)); 
title('monomsarstellung');

subplot(2,2,2);
y=P7b(x);
plot(x, y); % Diese hier ist monoton, da zuerst (x-1) ausgerechnet wird, was monton ist, und dann ^7, was ebenfalls monoton ist.
delta2 = sqrt(sum((genau-y).^2));
title('(x-1)^7');

subplot(2,2,3); % Auch nicht schön: immernoch 6 +-.
y=P7c(x);
plot(x, P7c(x));
delta3 = sqrt(sum((genau-y).^2));
title('horner');

subplot(2,2,4);
bar([delta1 , delta3]);
title('Abweichung');

