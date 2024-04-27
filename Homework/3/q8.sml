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

fun foldl f e nil = e
	| foldl f e (a::b) = foldl f (f a e) b

fun curry f = fn x => fn y=> f(x, y)


(* Q8: Taylor expansion for Cosine *)

(* Write your code below *)
val nat = from 0.0 (fn x => x+1.0);

fun helper (n, acc) = Cons(acc, fn () => helper (n+1.0, acc*n));

val fs = helper (1.0, 1.0);

fun frac Nil = Nil
   | frac s = Cons((1.0 / (head s)), fn () => frac (tail s));

fun pow x n =
   if n = 0 then 1.0
   else x * pow x (n-1);

fun eval s x 0 = 1.0
   | eval s x order =
         foldl (curry (fn (a, b) => a*x + b)) 0.0 (take order s);

(*coefs should be 1, -2, 4, -6, 8*)
val coefs = from 1.0 (fn x => if x mod 2 = 0 then x+2.0 else x+1.0);
(*make every other number in coefs negative*)
val coefs' = 


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

