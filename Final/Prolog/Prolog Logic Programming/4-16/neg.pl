neg(Goal):- Goal, !, fail. 
neg(_).

enjoys(vincent,X):- burger(X), neg(bigKahunaBurger(X)). 

burger(X):-  bigMac(X).
burger(X):-  bigKahunaBurger(X).
burger(X):-  whopper(X).

bigMac(a). 
bigMac(c).

bigKahunaBurger(b).

whopper(d).
