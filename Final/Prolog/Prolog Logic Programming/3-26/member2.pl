% member test

del(X,[X|T],T).
del(X,[Y|T],[Y|T1]) :- del(X,T,T1).

member2(X,List) :- del(X,List,_).

