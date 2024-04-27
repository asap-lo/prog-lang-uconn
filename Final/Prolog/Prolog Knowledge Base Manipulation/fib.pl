:- dynamic fib/2.
fib(0,0).
fib(1,1).
fibn(N,X) :-
	fib(N,X),!.

fibn(N,X) :-
	N1 is N - 1,
	N2 is N - 2,
	fibn(N1,A),
	fibn(N2,B),
	X is A + B,
	assert(fib(N,X)).
