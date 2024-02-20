datatype 'a Stream = Empty 
              | Cons of 'a * (unit -> 'a Stream);

(* Implement seqSum to sum two sequences *)

fun seqSum s Empty = s
	| seqSum Empty s = s
	| seqSum (Cons(a,b)) (Cons(c,d)) = Cons(a+c, fn()=>seqSum (b()) (d()));


fun from s n = Cons(s,fn()=>from (n s) n);

(* use from to obtain the sequence 1, 3, 5, 7, 9, ... *)

val s1 = from 1 (fn x => x+2);
(* use from to obtain the sequence 3, 5, 7, 9, 11, ... *)

val s2 = from 3 (fn x => x+2);
(* Obtain the sum of the above two sequence *)
val s3 = seqSum s1 s2;

exception Error;

fun take n Empty = raise Error
   | take 0 s = nil
   | take n (Cons(a,b)) = a::(take (n-1) (b()));

fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

printList(take 10 s3);
