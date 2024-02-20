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


(* Q8: Taylor expansion for Cosine *)

(* Write your code below *)



(* Also finish the next line *)
val coefs'' = 

(* Read code on the next line carefully 
	to decdie what should be in coefs'' *)

fun cos x order = eval coefs'' (x*x) order
val v = cos (Math.pi) 10;

fun printRealList x = if null x then print("\n")
        else (print(Real.toString((hd x))^" "); printRealList (tl x));

printRealList (take 10 coefs'');
print(Real.toString(v)^"\n");

