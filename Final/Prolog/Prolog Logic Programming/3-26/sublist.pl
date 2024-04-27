% A list L is a sublist of a list S such that S occurs within L.

sublist(S,L) :-
	append(_,L2,L),
	append(S,_,L2).

