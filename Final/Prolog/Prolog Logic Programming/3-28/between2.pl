% how about this?
between(N1,N2,N1) :-
	N1 =< N2.

between(N1,N2,X) :- 
	N1 < N2,
	between(N1+1,N2,X).
