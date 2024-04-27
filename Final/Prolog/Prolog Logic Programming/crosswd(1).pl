word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(V1,V2,V3,H1,H2,H3) :-
	word(V1, _, A, _, D, _, E, _),
	word(V2, _, B, _, F, _, H, _),
	word(V3, _, C, _, G, _, I, _),
	word(H1, _, A, _, B, _, C, _),
	word(H2, _, D, _, F, _, G, _),
	word(H3, _, E, _, H, _, I, _).

% do not change the code below	 
collect :- setof([V1,V2,V3,H1,H2,H3], crosswd(V1,V2,V3,H1,H2,H3), L),
		length(L,Len),write(Len),write(' solutions:'),nl,
		print_result(L).

print_result([H|T]):-write(H),nl,print_result(T).
print_result([]).