% Deleting an item X, from a list L

del(X,[X|T],T).
del(X,[Y|T],[Y|T1]) :- del(X,T,T1).

