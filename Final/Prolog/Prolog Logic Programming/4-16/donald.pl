% solve the following puzzle
%  [D,O,N,A,L,D]
% +[G,E,R,A,L,D]
% =[R,O,B,E,R,T]

donald([D,O,N,A,L,G,E,R,B,T]):-
	permutation([0,1,2,3,4,5,6,7,8,9],[D,O,N,A,L,G,E,R,B,T]),
	100000*D + 10000*O + 1000*N + 100*A + 10*L + D + 
	100000*G + 10000*E + 1000*R + 100*A + 10*L + D =:=
	100000*R + 10000*O + 1000*B + 100*E + 10*R + T.

collect:- setof(X,donald(X), L), print_result(L).

print_result([H|T]):-write(H),print_result(T).
print_result([]).

%statistics(runtime,T1),collect,statistics(runtime,T2).