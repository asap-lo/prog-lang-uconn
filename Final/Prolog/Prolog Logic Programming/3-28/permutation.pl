del(X,[X|T],T).
del(X,[Y|T],[Y|T1]) :- del(X,T,T1).

insert(X,List,BiggerList) :-
	del(X,BiggerList,List).

permutation([],[]).
permutation([X|L],P) :-
	permutation(L,L1),
	insert(X,L1,P).
