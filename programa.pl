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
