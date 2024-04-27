dot([],[], 0).
dot([X|TX],[Y|TY], Z) :- dot(TX,TY,W), Z is X*Y + W. 
