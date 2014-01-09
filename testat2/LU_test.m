NBS = 1000;
NNS=250;

es=zeros(1, NNS);
for N=1:NNS
	A=rand(N,N);
	bs=rand(N,NBS);
	xs = LU_solve(A, bs);
	check_bs = A*xs;
	es(N) = mean(sum(abs(check_bs-bs)));
end

plot(es)
