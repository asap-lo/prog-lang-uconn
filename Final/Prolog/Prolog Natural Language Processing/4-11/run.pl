add(A,B,C):- C is A + B.

sub(A,B,C):- C is A - B.

run(S) :- X=..S,call(X).
