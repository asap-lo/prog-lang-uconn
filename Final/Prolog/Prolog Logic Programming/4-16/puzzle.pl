% Numbers represented as lists of digits
% sum1(N1,N2,N,C1,C,Digits1,Digits2)
% N1, N2 and N are our three numbers, C1 is carry from the right
%(before summation of N1 and N2), and C is carry to the left
%(after the summation).
% Digits1 is the list of available digits for instantiating the 
% variables in N1, N2, and N; Digits2 is the list of digits that
% were not used in the instantiation of these variables. 


sum(N1,N2,N):-
	sum1(N1,N2,N,
	0,0,						%Carries from right and to left both 0
	[0,1,2,3,4,5,6,7,8,9],_).	% All available digits

sum1([],[],[],C,C,Digits,Digits).

sum1([D1|N1],[D2|N2],[D|N],C1,C,Digs1,Digs):-
	sum1(N1,N2,N,C1,C2,Digs1,Digs2),
	digitsum(D1,D2,C2,D,C,Digs2,Digs).
% digit sum 
% S is D1 + D2 + C1
% D is S mod 10
% C is S // 10
% Digs1 is the list of digits 
% Digs is the list of digits that are not used
digitsum(D1,D2,C1,D,C,Digs1,Digs):-
	del_var(D1,Digs1,Digs2),
	del_var(D2,Digs2,Digs3),
	del_var(D,Digs3,Digs),
	S is D1+D2+C1,
	D is S mod 10,
	C is S // 10.

del_var(A,L,L):-
	nonvar(A),!.

del_var(A,[A|L],L).

del_var(A,[B|L],[B|L1]):-
	del_var(A,L,L1).

% puzzle1
puzzle1([D,O,N,A,L,D],
	   [G,E,R,A,L,D],
	   [R,O,B,E,R,T]).

% puzzle2
puzzle2([0,S,E,N,D],
		[0,M,O,R,E],
		[M,O,N,E,Y]).

solve1(N1,N2,N):- puzzle1(N1,N2,N),sum(N1,N2,N).
solve2(N1,N2,N):- puzzle2(N1,N2,N),sum(N1,N2,N).

collect1:-setof([N1,N2,N], solve1(N1,N2,N), L),
                length(L,Len),write(Len),write(' solutions:'),nl,
                print_result(L).
collect2:-setof([N1,N2,N], solve2(N1,N2,N), L),
                length(L,Len),write(Len),write(' solutions:'),nl,
                print_result(L).

print([H|T]) :- write(H), print(T).
print([]):- nl.

print_result([H|T]):-print(H),print_result(T).
print_result([]).

%statistics(runtime,T1),collect1,statistics(runtime,T2).