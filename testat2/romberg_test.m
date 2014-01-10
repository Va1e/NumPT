function [int] = romberg_fix(f, a, b, tol)
	q = rand(1)*(b-a) + a;
	int =  romberg(f, a, q, tol) + romberg(f, q, b, tol);
end

eps = 1e-8;
assert(romberg(@exp, 0, 1, eps), exp(1)-1, eps);
f = @(x) x^2 * cos(2^5 * x) + 0;
assert(romberg_fix(@(x) f(x), 0, 2*pi, eps), quad(@(x) f(x), 0, 2*pi), eps);
