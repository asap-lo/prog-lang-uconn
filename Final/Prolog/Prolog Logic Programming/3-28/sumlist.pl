% can you change the implementation and use accumulator?
sumlist([], 0).
sumlist([H|T], X) :- sumlist(T, Y), X is H + Y.

accSumlist([],S,S).
accSumlist([X|T],S1,S) :- S2 is S1 + X, accSumlist(T, S2, S).

sumlist1(L, S) :- accSumlist(L, 0, S).
