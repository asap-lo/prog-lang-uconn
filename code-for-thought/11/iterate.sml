datatype 'a Stream = Empty 
              | Cons of 'a * (unit -> 'a Stream);

(* Implement the function iterate that generate the sequence 
 x, f(x), f(f(x)), f(f(f(x))), ...  *)

fun iterate f x = Cons(x, fn()=> iterate f (f x));

(* The below function is used to generate a sequence *)

fun f x = if x mod 2 = 0 then x div 2 else 3*x + 1;

(* Apply iterate to generate a sequence based on the fule of the 3x + 1 problem *)

val s = iterate f 29;

(* Implement the function takeUntil to take all the elements 
that do not satisfy the predicate p until p is satisfied.
All these elements including the one that satisfies predicate p
are put into a list *)

fun takeUntil p Empty = []
	| takeUntil p (Cons(x, xf)) = if p x then [x] else x::takeUntil p (xf());


fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

fun printRealList x = if null x then print("\n")
        else (print(Real.toString((hd x))^" "); printRealList (tl x));

printList(takeUntil (fn x=> x = 1) s);

