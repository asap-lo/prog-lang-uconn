% check whether a list is ordered
% pay attention to the usage of | here

ordered([_]).
ordered([X,Y|Rest]) :- X =<Y, ordered([Y|Rest]).
