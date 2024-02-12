(* 
John Lombardo - HW2 CSE4102 - Q1.1

Implement qSort 

Using midpoint method
Steps
1. pick midpoint pivot
2. partition list into two sublists
3. sort sublists
4. concatenate sorted sublists with pivot in the middle
5. return sorted list

*)


fun qSort nil    = nil (* base case *)
  | qSort [x]    = [x] (* base case *)
  | qSort (x::xs) = let 
    fun partition (pivot, nil, left, right) = (left, right)
      | partition (pivot, x::xs, left, right) = 
      if x < pivot then partition(pivot, xs, x::left, right)
        else partition(pivot, xs, left, x::right)
    val (left, right) = partition(x, xs, nil, nil)
  in
    (qSort left) @ (x::(qSort right))
  end;


fun printList x = if null x then print("\n")
        else (print(Int.toString((hd x))^" "); printList (tl x));

printList (qSort [1, ~1, 2, ~2, 3, ~3]);
printList (qSort [5, 4, 3, 2, 1]);
printList (qSort [~5, ~4, ~3, ~2, ~1]);
printList (qSort [5, 5, 4, 4, 3, 3, 2, 2, 1, 1]);