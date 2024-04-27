sum:= [:n|(0 to: n) inject: 0 into: [:s :i|s + (1 / (i factorial))]].
Transcript show:((sum value: 99) asFloat) ;cr.