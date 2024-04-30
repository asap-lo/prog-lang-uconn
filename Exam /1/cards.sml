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

fun filter Nil p = Nil
   |filter (Cons(a,b)) p = if p a
             then Cons(a, fn()=> filter (b()) p)
             else filter (b()) p;

fun map f Nil = Nil
        | map f (Cons(x, xf)) = Cons(f x, fn()=> map f (xf()));

(* step 1:  create the sequence 1, 2, 3, ..., n using the following code*)

val nat = from 1 (fn x => x + 1);

(* step 2: calculate the cumulative sum for the above sequence to 
create a sequence of triangle numbers. *)

(* finish the following function *)
(* should eval to 1, 3, 6, 10... *)

fun helper 0 = 0
  | helper n = n + helper(n-1);

fun cumsum (Cons(a, f)) = Cons(helper a, fn()=> cumsum (f()));

val triangle = cumsum nat;

val l = take 10 triangle;

fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));
printList (take 10 triangle);

(* step 3: map a function on the triangle sequence to generate a sequence of 
lists, where each triangle number is transformed into a list that 
contains that triangle number.*)

(* finish the following line of code *)
val m = map (fn x=> [x]) triangle;

val l1 = take 10 m;

(*step 4:  *)

(* finish the following function *)
fun sort nil    = nil
| sort (a::b) = 
      let
         fun insert(x, []) = [x]
            | insert(x, y::ys) =
                  if x >= y then x::y::ys
                  else y::insert(x, ys)
      in
         insert(a, sort b)
      end;

printList (sort l);

(* implementa a function fun f l that follow the rule of the card game 
for one iteration *)
fun decrementList [] = []
   | decrementList (x::xs) = (x - 1) :: decrementList xs;

fun f l = let
val pile = foldl (fn (x, acc) => acc + 1) 0 l;
val newl = sort (pile::(decrementList l));
in
newl
end;

(*step 5: *)
(* finish the following function *)
fun iterate f x = Cons(x, fn()=> iterate f (f x));

val s10 = iterate f [10];

val t10 = take 10 s10;

val t = map (iterate f) m;

(* step 6: *)
(* implement the following function *)
fun count s = let
val changed = (head s = (head (tail s)))
in
if changed then 1 + count (tail s)
else 0
end;


val c10 = count s10;

val u = map count t;

printList (take 10 u);
