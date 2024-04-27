add(0,X,X).                         %%% base clause

add(succ(X),Y,succ(Z)):-            %%% recursive clause
      add(X,Y,Z).
