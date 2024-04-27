qsort([],[]).

qsort([X|Xs],Ys) :- 
	part(Xs,X,Littles,Bigs),
	qsort(Littles,Ls),
	qsort(Bigs,Bs),
	append(Ls,[X|Bs],Ys).

part([],_,[],[]).
part([X|Xs],Y,[X|Ls],Bs) :- X =< Y, part(Xs,Y,Ls,Bs).
part([X|Xs],Y,Ls,[X|Bs]) :- X > Y, part(Xs,Y,Ls,Bs). 
