sum:= [:n|(1 to: n) inject: 0 into: [:s :i|s + i]].
Transcript show:(sum value: 10);cr.
