% In the code for thought problem, we explore the map coloring problem.
% The map coloring problem is the following.
% Given a map with number of countires(states), paint each country(state) with one of the 
% available colors, but avoid painting neighboring countries(states) with the same color.
% It is known that four colors suffies to paint any map.
% In our problem, try to paint the new england states.

% possible pairs of colors of neighbor states
n(red,green).
n(red,blue).
n(red,yellow).

n(green,red).
n(green,blue).
n(green,yellow).

n(blue,red).
n(blue,green).
n(blue,yellow).

n(yellow,red).
n(yellow,green).
n(yellow,blue).

% implement the color predicate
% Back is the background
% others are the two-letter abbreviations of the 6 new england states
% consult a new England map to implement the predicate
color(Back,ME,NH,VT,MA,CT,RI) :-
	Back = blue,



% Do not change the code below
collect :- 
	setof([bk/Back,me/ME,nh/NH,vt/VT,ma/MA,ct/CT,ri/RI], color(Back,ME,NH,VT,MA,CT,RI), L),
	length(L,Len),write(Len),write(' solutions:'),nl,
	print_result(L).


print_result([]).
print_result([H|T]):-write(H),nl,print_result(T).

