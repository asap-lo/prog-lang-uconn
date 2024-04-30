(* Part 1 : Use pattern matching to create a list *)
(* The list looks like [n*n, (n-1)*(n-1), ..., 9, 4, 1] *)
(* That is, it holds n^2, (n-1)^2, ..., 3^2, 2^2, 1^2 *)

(* finish the following function *)
fun fillList 0 = []
    | fillList n = n*n::fillList(n-1);

(* Part 2: Use folding to calculate the number of occurances of a digit as the first digit*)
(* Specifically, we focus on the first digit of the numbers of in a list *)
(* and count the number of times a digit d appears as the first digit *)
(* of the numbers of the list l *)

(* finish the following function *)
fun firstDigit n = if n div 10 = 0 then n else firstDigit (n div 10);


(* finish the following function *)
fun count d l = foldl (fn (x, y) => if firstDigit x = d then y+1 else y) 0 l;


(* Part 3: Use map to get a list of occurances for all digits *)
(* from 0 to 9 *)

(* finish the following function *)
fun digitCounts l = map (fn x=> count x l) [1, 2, 3, 4, 5, 6, 7, 8, 9];

(* Do not change the code below *)
fun printIntList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printIntList (tl x));

printIntList (digitCounts (fillList 10000));
