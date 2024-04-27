% Note this only works with the recognition mode.
%Note this does not work if we generate with it.
s(Count) --> as(Count), bs(Count), cs(Count). 

as(1) --> [a].
as(NewCnt) --> [a], as(Cnt), {NewCnt is Cnt + 1}.

bs(1) --> [b].
bs(NewCnt) --> [b], bs(Cnt), {NewCnt is Cnt + 1}.

cs(1) --> [c].
cs(NewCnt) --> [c], cs(Cnt), {NewCnt is Cnt + 1}.