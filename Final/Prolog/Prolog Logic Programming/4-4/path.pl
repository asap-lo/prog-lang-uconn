% path(a,b) indicates a link between node a and b

link(a,b).
link(a,c).
link(b,d).
link(c,d).
link(c,f).
link(d,e).
link(d,f).
link(f,a).

% We implement a predict path(StartNode,EndNode) to check
% whether there is a path between StartNode and EndNode
path(Node,Node).
path(StartNode,EndNode) :-
	link(StartNode,NextNode),
	path(NextNode,EndNode).

% We next implement a predict path(StartNode,EndNode,Path)
% to obtain a path between StartNode and EndNode, the result
% is in list Path

path(Node,Node,[Node]).
path(StartNode,EndNode,[StartNode|Rest]) :-
	link(StartNode,NextNode),
	path(NextNode,EndNode,Rest).

% Which graph trversal algorithm are we using here?
% What happens to the following query?

%path(a,e,P).
%path(a,X,P).
%path(a,c,P).

% how can the follow predict help?
list([]).
list([_|L]):- list(L).
