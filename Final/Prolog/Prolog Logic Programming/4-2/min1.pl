% use logic to implement min(L,X) and max(L,X)
% this is not the most efficent implementation of min and max
% but this kind of thinking might be useful

min(L,X) :- member(X,L), not((member(Y,L),X > Y)).

max(L,X) :- member(X,L), not((member(Y,L),X < Y)).
