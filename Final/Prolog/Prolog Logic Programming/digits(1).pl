/* Implement a predicate named digits that searches for solutions of a digit puzzle */
n(A,B) :- A > B + 1.
n(A,B) :- A < B - 1.

digits([A,B,C,D,E,F,G,H]):-
	permutation([1,2,3,4,5,6,7,8],[A,B,C,D,E,F,G,H]),
	n(A,B) , n(A,C) , n(A,D) , 
	n(B,C) , n(B,E) , n(B,F) , 
	n(C,D) , n(C,E) , n(C,F) , n(C,G) ,
	n(D,F) , n(D,G) , 
	n(E,F) , n(E,H) , 
	n(F,G) , n(F,H) ,
	n(G,H).

% do not change the code below

collect:-setof(X, digits(X), L),
		length(L,Len),write(Len),write(' solutions:'),nl,
		print_result(L).

print_result([H|T]):-write(H),nl,print_result(T).
print_result([]).
