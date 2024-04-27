happy(yolanda).
listensToMusic(mia).
listensToMusic(yolanda) :- happy(yolanda).
playsAirGuitar(mia) :- listensToMusic(mia).
playsAirGuitar(yolanda) :- listensToMusic(yolanda).
