sum:= [:n|(1 to: n) inject: 0 into: [:s :i|s + (1 / (i raisedTo:2))]].
Transcript show:((sum value: 10000) asFloat) ;cr.


Transcript show: (Float pi raisedTo: 2) / 6;cr.