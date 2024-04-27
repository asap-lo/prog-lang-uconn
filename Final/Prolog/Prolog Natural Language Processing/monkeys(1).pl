n(singular,X)-->[X],{member(X,[head, mama, doctor,monkey])}.
n(plural,X)-->[X],{member(X,[monkeys])}.
adj-->[little].
num(plural,X)-->[X],{member(X,['no more',two,three,four,five])}.
num(singular,X)-->[X],{member(X,[one])}.
nump(Num,Plurality,N)-->num(Plurality,Num),adj,n(Plurality,N).
pp-->['on the bed'].
v(X)-->[X],{member(X,[jumped,bumped,'fell off',called,said])}.

% Below are the three different types of sentences
/*
Five little monkeys jumped on the bed
Four little monkeys jumped on the bed
Three little monkeys jumped on the bed
Two little monkeys jumped on the bed
One little monkey jumped on the bed
No more little monkeys jumped on the bed
*/

/*
One fell off and bumped his head
She fell off and bumped her head
*/
p(male,X)-->[X],{member(X,[he,one])}.
p(female,X)-->[X],{member(X,[she,one])}.

pos(male,X)-->[X],{member(X,[his])}.
pos(female,X)-->[X],{member(X,[her])}.

conj-->[and].
det-->[the].
np(X)-->det,n(singular,X).
/*
Mama called the doctor and the doctor said
*/

/* Note
doctor called the doctor and the doctor said
should not be accepted.
*/

% Use DCG to define the grammar that accept these types of sentences


s([s0,Num,Plurality,N,V])-->nump(Num,Plurality,N),v(V),pp.

s([s1,Gender,P,V1,V2,Q,N])-->p(Gender,P),v(V1),conj,v(V2),pos(Gender,Q),n(singular,N).

s([s2,N1,V1,N2,V2])-->n(singular,N1),v(V1),np(N2),{N1\=N2},conj,np(N2),v(V2).


% Next we work on the act part

s0(Num,Plurality,N,V):-S=[s0_act,Num,V],X=..S,call(X).
s1(Gender,P,V1,V2,Q,N):-write(Gender),write(' '), write(V1), write(' '), write(V2).
s2(N1,V1,N2,V2):-write(N1),write(' '), write(V1), write(';'), write(N2), write(' '), write(V2). 

s0_act('no more', V):-write('zzzzz').
s0_act(one, V):-write(V).
s0_act(two, V):-write(V),write(' '),write(V).
s0_act(three, V):-write(V),write(' '),write(V),write(' '),write(V).
s0_act(four, V):-write(V), write(' '),write(V),write(' '),write(V),write(' '),write(V).
s0_act(five, V):-write(V), write(' '),write(V),write(' '),write(V),write(' '),write(V),write(' '),write(V).

% Do not change the code below

act(['']).
act(L):-((phrase(s(S),L),X=..S,call(X)),!;
	(write('Invalid input'),nl)).

collect:-findall(X,phrase(s(_),X),L), sort(L, LL), print_result(LL), 
	length(LL,Len),write(Len),write(' sentences.').

print_result([H|T]):-write(H),nl,print_result(T).
print_result([]).

