datatype 'a Stream = Nil 
              | Cons of 'a * (unit -> 'a Stream);
exception Bad of string;
fun from seed next = Cons(seed, fn () => from (next seed) next);   

fun head (Nil)       = raise Bad("got nil in head")
   |head (Cons(a,b)) = a;

fun tail (Nil)       = raise Bad("got nil in tail")
   |tail (Cons(a,b)) = b();

fun take 0 stream = nil
	| take n Nil = raise Bad("got nil in take")
	| take n (Cons(h,t)) = h::(take (n-1) (t()));

(* implement function mul *)
(* Why is this only taking in int Stream?*)
fun mul Nil (b: real Stream) = Nil
   | mul (a : real Stream) Nil = Nil
   | mul (Cons(h1,t1) : real Stream) (Cons(h2,t2) : real Stream) = Cons(h1*h2, fn () => mul (t1()) (t2()));


fun printRealList x = if null x then print("\n")
        else (print(Real.toString((hd x))^" "); printRealList (tl x));

val odd = from 1.0 (fn x => x + 2.0);
val even = from 2.0 (fn x => x + 2.0);
printRealList (take 10 (mul odd even));


