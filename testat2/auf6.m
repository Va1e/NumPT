function a_mm=romberg(fun,a,b,tol)
	%
	h=b-a;
	hk=@(k) h/(2^(k-1));
	nss = 0;
	A=zeros([0,0]);
	delta = old = NaN;
	while not(delta < tol)
		A=[A,zeros([nss, 1])
			zeros([1, nss]),0];
		nss = nss + 1;
		A(nss:1)=(hk(nss)/2)*(fun(b)-fun(a)+2*sum(fun(a+(1:(hk(1)/hk(nss))-1)*hk(nss))));
		for w=2:nss
			A(nss,w)=A(nss,w-1)+(A(nss,w-1)-A(nss-1,w-1))/(((hk(nss-1-w)/hk(nss-1))^(2*w))-1);
		end
		A
		% neue zeile berechnen
%		A(nss,nss)=fun(hk(nss));
		delta = abs((A(nss, nss) - old) / max(1e-20, abs(old)));
		old = A(nss, nss);
		delta
	end
	a_mm=A(nss, nss);
end
fun1=@(x) exp(.x);
disp('teil a');
romberg(fun1,0,1,1e-8)
fun2=@(x) (x.^2)*cos((2^5).*x);
disp('teil b');
romberg(fun2,0,2*pi,1e-8)
