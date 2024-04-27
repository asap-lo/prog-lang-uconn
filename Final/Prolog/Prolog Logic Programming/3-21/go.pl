byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

travel(X,Y,Z) :- byCar(X,Y), Z=goByCar(X,Y).
travel(X,Y,Z) :- byTrain(X,Y), Z=goByTrain(X,Y).
travel(X,Y,Z) :- byPlane(X,Y), Z=goByPlane(X,Y).

travel(X,Y,Z) :- byCar(X,U), travel(U,Y,W), Z=goByCar(X,U,W). 
travel(X,Y,Z) :- byTrain(X,U), travel(U,Y,W), Z=goByTrain(X,U,W).
travel(X,Y,Z) :- byPlane(X,U), travel(U,Y,W), Z=goByPlane(X,U,W).
