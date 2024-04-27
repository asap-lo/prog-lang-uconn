s(Count) --> as(Count), bs(Count), cs(Count). 

as(succ(0)) --> [a].
as(succ(Count)) --> [a], as(Count).

bs(succ(0)) --> [b].
bs(succ(Count)) --> [b], bs(Count).

cs(succ(0)) --> [c].
cs(succ(Count)) --> [c], cs(Count).