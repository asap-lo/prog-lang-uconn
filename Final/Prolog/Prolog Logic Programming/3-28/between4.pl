between(N1,_,N1).
between(N1,N2,X):-
	X1 is X-1,
	between(N1,N2,X-1).