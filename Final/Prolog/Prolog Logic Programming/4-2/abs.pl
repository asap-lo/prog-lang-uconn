% does this work?
abs(X,X):- X>=0.
abs(X,-X).

abs1(X,X):- X>=0.
abs1(X,R):- X<0, R is -X.

