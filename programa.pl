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

%parte C

propiedad(ana, casaRio).
propiedad(beto, barWollok).
propiedad(beto, restoCool).
propiedad(cari, deptoFamiliar).
propiedad(dane, deptoFamiliar).
propiedad(dani, casaJujuy).
propiedad(dani, casaMendoza). 

ubi(casaRio, bsas).
ubi(barWollok, cordoba).
ubi(restoCool, cordoba).
ubi(deptoFamiliar, bsas).
ubi(casaJujuy, jujuy).
ubi(casaMendoza, mendoza). 
ubi(hotelProlog, cordoba).
ubi(casaDeHaskelicia, santaFe).

jugadoresProvinciales(Jugador, Provincia):-
    propiedad(Jugador, _),
    ubi(_, Provincia), 
    forall(propiedad(Jugador, Propiedad), ubi(Propiedad, Provincia)). 


provinciaCompleta(Provincia, Jugador):-
    ubi(_, Provincia),
    propiedad(Jugador, _),
    forall(ubi(Propiedad, Provincia), propiedad(Jugador, Propiedad)). 

objetivo(ana, expansionista(5)).
objetivo(beto, coleccionista(bsas)).
objetivo(beto, coleccionista(cordoba)).
objetivo(dani, coleccionista(bsas)).
objetivo(dani, expansionista(3)).

ganadorDelJuego(Jugador):-
    objetivo(Jugador, _),
    forall(objetivo(Jugador, Objetivo), cumple(Juegador, Objetivo)).

cumple(Jugador, expansionista(Cantidad)):-
    findall(Propiedad, propiedad(Jugador, Propiedad), Propiedades),
    length(Propiedades, Tamanio),
    Tamanio >= Cantidad. 

cumple(Jugador, coleccionista(Provincia)):-
    provinciaCompleta(Provincia, Jugador). 
