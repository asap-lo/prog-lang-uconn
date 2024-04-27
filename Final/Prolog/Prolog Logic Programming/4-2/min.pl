% use logic to implement min(L,X) and max(L,X)
% this is not the most efficent implementation of min and max
% but this kind of thinking might be useful

min([X],X).
min(L,X) :- member(X,L), \+((member(Y,L),X > Y)).

max([X],X).
max(L,X) :- member(X,L), \+((member(Y,L),X < Y)).
