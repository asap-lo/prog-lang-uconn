
range(M, N, [M|Ns]) :- M < N, M1 is M+1, range(M1, N, Ns).
range(N, N, [N]).

queens(N,Qs) :- 
	range(1,N,Ns), permutation(Ns,Qs), safe(Qs).

safe([]).
safe([Q|Qs]) :- safe(Qs), no_attacks(Q,Qs).

no_attacks(Q,Qs) :- no_attacks(Q,Qs,1).
no_attacks(_,[],_).
no_attacks(Q,[Q1|Qs],N) :- Q =\= Q1+N,Q =\= Q1-N,N1 is N+1, 
						no_attacks(Q,Qs,N1).

% do not change code below

solutions(N):-setof(X, queens(N,X), L),
		length(L,Len),write(Len),write(' solutions:'),nl,
		print_result(L),!.

print_result([H|T]):-write(H),nl,print_result(T).
print_result([]).
