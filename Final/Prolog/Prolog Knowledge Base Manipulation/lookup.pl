:- dynamic lookup/3.

addAndSquare(X,Y,Res):- lookup(X,Y,Res), !.

addAndSquare(X,Y,Res):- 
     Res is (X+Y) * (X+Y), assert(lookup(X,Y,Res)).
