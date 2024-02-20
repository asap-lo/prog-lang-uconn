datatype 'a Stream = Empty 
              | Cons of 'a * (unit -> 'a Stream);

(* Implement map function for sequence *)
(* The meaning of the map function is the same as the version for list *)

fun map f Empty = Empty
        | map f (Cons(a,b)) = Cons(f a, fn()=>map f (b()));

fun from s n = Cons(s, fn()=>from (n s) n);

val s = from 1 (fn x=>x+1)

fun square x = x*x;

fun inverse x = 1.0/(Real.fromInt(x));

(* Use map to square every element in s and the result is the sequence s' *)
val s' = map square s;

(* Use map to obtain the inverse of each element in s and the result is the squence s'' *)
val s'' = map inverse s;




exception Error;

fun take n Empty = raise Error
   | take 0 s = nil
   | take n (Cons(a,b)) = a::(take (n-1) (b()));

fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

fun printRealList x = if null x then print("\n")
        else (print(Real.toString((hd x))^" "); printRealList (tl x));

printList(take 10 s');

printRealList(take 10 s'');

