(* 
John Lombardo - HW2 - CSE4102


*)

fun qsHigh xs =
        let
                fun partition (x, []) = ([], [])
                |   partition (x, y::ys) = 
                let
                        val (less, more) = partition (x, ys)
                in
                        if y < x then (y::less, more)
                        else (less, y::more)
                end
        in
                if null xs then []
                else
                let
                        val pivot = hd xs
                        val (less, more) = partition (pivot, tl xs)
                in
                        (qsHigh less) @ (pivot::(qsHigh more))
                end
        end

fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

printList (qsHigh [1, ~1, 2, ~2, 3, ~3]);
printList (qsHigh [5, 4, 3, 2, 1]);
printList (qsHigh [~5, ~4, ~3, ~2, ~1]);
printList (qsHigh [5, 5, 4, 4, 3, 3, 2, 2, 1, 1]);
