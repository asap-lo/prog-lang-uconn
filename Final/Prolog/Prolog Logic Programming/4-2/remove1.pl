% remove all the instances of X from a list
remove(_,[],[]).
remove(X,[X|Xs],Ys) :- remove(X,Xs,Ys).
remove(X,[Y|Xs],[Y|Ys]) :- X \== Y, remove(X, Xs, Ys).
