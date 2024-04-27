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

% X is a member of L, but X has no prereq in list L
top(L,X) :- member(X,L), course(X), \+ (member(Y,L), prereq(X,Y)).

% obtain toplogical ordering
order([],[]).
order(L,[X|L1s]) :- top(L,X), delete(L,X,L1), order(L1,L1s). 


collect1 :- setof(Ls, (init(L),order(L,Ls)), LL), 
	show_result(LL),length(LL,Len),write(Len),write(' solutions.').

% The courses in the list can be taken in the same semester
compatible([_]).
compatible([X,Y|Ys]) :- \+ (prereq(Y,X)), compatible([X|Ys]), compatible([Y|Ys]).

% Course C requires course from the list as prereq
% Do not need to check X, Y are coures. These have already been checked.
require(X, [Y|_]) :- prereq(X,Y).
require(X, [_|Ys]) :- require(X,Ys).

% Segment a viable list into compatible sublists
% each sublist represents one semester
% order of two clauses cannot be changed
segments(L, LS) :- append(A, [X|Xs], L), compatible(A), require(X,A), 
	segments([X|Xs], LS1),!, sort(A,B), append([B], LS1, LS).
segments(L, [L1]) :- sort(L,L1). 

% check the assignment satisfy certain constraints
% Make sure it can be done in 5 semesters
% and no more than 3 courses each semeter
check([]).
check([L|LS]) :- length([L|LS],Len1), Len1 < 6, length(L, Len), Len < 4, check(LS).

% obtain uniq solutions
uniq([],[]).
uniq([H|T], U) :- member(H, T), uniq(T, U), !.
uniq([H|T],[H|U]) :- uniq(T, U).

assign(L) :-
	init(LL),
	order(LL,X),
	segments(X, L), check(L).

collect :- setof(L, assign(L), LL), uniq(LL,LLL), 
	show_result(LLL),length(LLL,Len),write(Len),write(' solutions.').

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

% statistics(runtime,T1),collect,statistics(runtime,T2).


