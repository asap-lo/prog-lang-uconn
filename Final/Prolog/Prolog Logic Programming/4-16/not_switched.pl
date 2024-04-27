
enjoys(vincent,X):- not(bigKahunaBurger(X)), burger(X). 

burger(X):-  bigMac(X).
burger(X):-  bigKahunaBurger(X).
burger(X):-  whopper(X).

bigMac(a). 
bigMac(c).

bigKahunaBurger(b).

whopper(d).
