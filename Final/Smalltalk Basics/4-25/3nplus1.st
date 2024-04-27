n:=17. Transcript show: n;cr.
[n > 1] whileTrue:
    [n\\2 = 0 ifTrue: [n:=n//2] ifFalse: [n:= 3*n + 1]. Transcript show: n;cr].