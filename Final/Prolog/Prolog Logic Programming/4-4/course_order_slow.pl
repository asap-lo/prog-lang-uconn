% We first obtainn a viable list of courses that follows all the prereq requirements.
% We then segment the sequence into a few sublists.
% Each sublist represents courses in one semester.

% These 10 courses are among all the courses I ever taught.

course(cse1010).
course(cse2050).
course(cse2500).
course(cse3100).
course(cse3300).
course(cse3500).
course(cse3666).
course(cse4102).
course(cse4300).
course(cse4502).

prereq(cse3100, cse2050).
prereq(cse2050, cse1010).
prereq(cse2500, cse1010).
prereq(cse4102, cse3100).
prereq(cse3300, cse3100).
prereq(cse3500, cse2050).
prereq(cse3500, cse2500).
prereq(cse3666, cse2050).
prereq(cse3666, cse2500).
prereq(cse4300, cse3100).
prereq(cse4300, cse3666).
prereq(cse4502, cse3500).

init(L) :- 
	L = [cse1010,cse2050,cse2500,cse3100,cse3300,cse3500,cse3666,cse4102,cse4300,cse4502].

good(L, X) :- 
	permutation(L, X),
	viable(X).

% Course C does not require any courses in the list as prereq
notrequire(C,[]) :- course(C).
notrequire(C, [X|Y]) :- course(C), course(X), not(prereq(C,X)), notrequire(C, Y).

% The list follows all the prereq rules and is a viable list
viable([]).
viable([X|Y]) :- notrequire(X,Y), viable(Y).

collect2 :- setof(X, (init(L),good(L,X)), LL), 
	show_result(LL),length(LL,Len),write(Len),write(' solutions.').


show_result([]).
show_result([H|T]):-write(H),nl,show_result(T).


% statistics(runtime,T)
% T is a list of two values: first, total execution time in milliseconds from the
% start of the Prolog session, and second, execution time since the previous call of 
% statistics(runtime,_).
% if we run 
% statistics(runtime,T1),collect2,statistics(runtime,T2).
% and get the output as below
% T1 = [37857, 1],
% T2 = [56390, 18533].
% This means that to run collect2, Prolog needs 18.533 seconds.

% statistics(runtime,T1),collect1,statistics(runtime,T2).
% statistics(runtime,T1),collect2,statistics(runtime,T2).
% If we run above two, we should notice about 700 to 800 folds of speedup.

% statistics(runtime,T1),collect,statistics(runtime,T2).


