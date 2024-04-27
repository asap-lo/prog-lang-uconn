
del(X,[X|T],T).
del(X,[Y|T],[Y|T1]) :- del(X,T,T1).


% Insert X at any place in list List

insert(X,List,BiggerList) :-
	del(X,BiggerList,List).
