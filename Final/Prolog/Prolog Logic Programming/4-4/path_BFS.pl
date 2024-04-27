link(a,b).
link(a,c).
link(b,d).
link(c,d).
link(c,f).
link(d,e).
link(d,f).
link(f,a).

path(Node,Node).
path(StartNode,EndNode) :-
	link(StartNode,NextNode),
	path(NextNode,EndNode).

path(Node,Node,[Node]).
path(StartNode,EndNode,[StartNode|Rest]) :-
	link(StartNode,NextNode),
	path(NextNode,EndNode,Rest).

list([]).
list([_|L]):- list(L).

%list(Path), path(a,c,Path).
