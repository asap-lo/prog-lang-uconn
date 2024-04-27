range(N1,N1,[N1]).
range(N1,N2,[N1|X]):- N1 < N2, N is N1 + 1,range(N,N2,X).
