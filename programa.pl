%progreso(jugador, casilla, dinero)
progreso(ana, 0, 0).
progreso(beto, 24, 10).
progreso(cari, 31, 3100).
progreso(dani, 38, 50).

ganasDeJugar(ana, 0.6).
ganasDeJugar(beto, 0.8).

ganasDeJugar(Jugador, 0.4) :-
    progreso(Jugador, Posicion, _),
    Posicion > 25.

%parte B

empatados(Jugador1, Jugador2):-
progreso(Jugador1, _, Dinero),
progreso(Jugador2, _, Dinero),
Jugador1 \= Jugador2. 

ventaja(Jugador1, Jugador2):-
    progreso(Jugador1, _, Dinero1),
    progreso(Jugador2, _, Dinero2),
    Dinero1 >= Dinero2. 

vaMejor(Jugador):-
    progreso(Jugador, _, _), 
    forall(progreso(OtroJugador,_,_), ventaja(Jugador, OtroJugador)).

estanMotivados(Jugador):-
    vaMejor(Jugador). 

estanMotivados(Jugador):-
    progreso(Jugador, _, _),
    forall(ventaja(Jugador, OtroJugador), (ganasDeJugar(OtroJugador, Ganas), 0.5 > Ganas)).