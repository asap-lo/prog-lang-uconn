(* 
John Lombardo - HW2 - CSE4102

Cross product of two lists
cross1 takes the first element of the first list and pairs it with each element of the second list
cross combines the result of cross1 with the result of cross called recursively with the rest of the list

Implement cross using list pattern matching and reursion
*)

(*
Making my own appendlist function to avoid using the @ operator,
Essentially confirming that I'm only using pattern matching and recursion!
*)
fun appendlist (nil, l) = l
        | appendlist (x::xs, l) = x::(appendlist(xs, l));

fun cross nil     b = nil
        | cross (a::al) b = let
                fun cross1 a nil = nil
                        | cross1 a (b::bl) = (a, b)::cross1 a bl
                in
                        appendlist (cross1 a b, cross al b)
                end;

fun printPair (x, y) = print("("^Int.toString(x)^","^Int.toString(y)^") ")

fun printList x = if null x then print("\n")
        else (printPair(hd(x)); printList (tl x));

printList (cross [1, ~1, 2, ~2, 3, ~3] [ 1, 1, 2, 2, 3, 3]);
printList (cross [5, 4, 3, 2, 1] [1, 2, 3, 4, 5]);
printList (cross [~5, ~4, ~3, ~2, ~1] [1, 2, 3, 4, 5]);
printList (cross [5, 5, 4, 4, 3, 3, 2, 2, 1, 1] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
