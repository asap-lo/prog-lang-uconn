"Examples of loops"

"While loop using message whileTrue"
n:=1.
[n<1000]whileTrue:[n:=n*2].
Transcript show: n;cr.

"While loop using message whileFalse"

n:=1.
[n>1000]whileFalse:[n:=n*2].
Transcript show: n;cr.

"timesRepeat offers a simple way of implement a fixed iteration"
n:=1.
10 timesRepeat:[n:=n*2].
Transcript show: n;cr.

"use message to:do:"
result := String new.
1 to: 10 do:[:n|result := result, n printString, ' '].
Transcript show: result;cr.
