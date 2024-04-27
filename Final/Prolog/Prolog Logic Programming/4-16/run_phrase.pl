num(X)-->[X],{number(X)}.

v(X)-->[X],{member(X,[add,sub])}.

s([V,X1,X2])-->num(X1),v(V),num(X2).

add(A,B,C):- C is A + B.

sub(A,B,C):- C is A - B.


run(L,X) :- phrase(s(S),L), append(S,[X],S1), Y=..S1,call(Y).