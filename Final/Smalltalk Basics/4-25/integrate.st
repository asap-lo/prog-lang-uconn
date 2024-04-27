f:=[:x|x].
integrate := [:n :a :b|(1 to: n) inject: 0 into: 
	[:s :i|delta := (b-a)/n. s + ((f value: (a+(i*delta)))*delta)]].
Transcript show:((integrate value: 100000 value: 0 value: 1) asFloat) ;cr.