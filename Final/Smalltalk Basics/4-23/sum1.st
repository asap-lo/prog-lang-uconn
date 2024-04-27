sum:= [:n|(1 to: n) inject: 0 into: [:s :i|s + 1/(i*(i+1))]].
Transcript show:(sum value: 10);cr.
