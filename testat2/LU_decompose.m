function LU = LU_decompose(A)
	N = length(A);
	assert(length(size(A)) == 2);
	assert(size(A)==[N, N]);
	for i=1:N
		pivot = A(i,i);
		q=A(i+1:N,i) = A(i+1:N,i) ./ pivot;
		A(i+1:N,i+1:N) = A(i+1:N,i+1:N) - q*A(i,i+1:N);
	end
	LU=A;
end
