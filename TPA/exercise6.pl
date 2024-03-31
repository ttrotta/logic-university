% Programa otorgado por el TP
progenitor(abel, cesar).
progenitor(flavia, dario).
progenitor(dario, ines).
progenitor(sara, maria).

progenitor(abel, dario).
progenitor(dario, hector).
progenitor(luisa, ines).
progenitor(omar, victor).

progenitor(flavia, cesar).
progenitor(luisa, hector).
progenitor(omar, maria).
progenitor(sara, victor).

parejaCasada(abel, flavia). 
parejaCasada(dario, luisa).
parejaCasada(omar, sara). 
parejaCasada(hector, maria).

hermanos(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y).

esMadre(X) :- 
    esMujer(X), progenitor(X, _). 

mujer(flavia).
mujer(ines).
mujer(sara).
mujer(maria).
mujer(luisa).

esMujer(X) :-
    mujer(X).

% a) casados(X,Y), representando la versión simétrica de parejaCasada/2.
casados(X, Y) :-
    parejaCasada(X, Y).
casados(X, Y) :-
    parejaCasada(Y, X).

% b) suegra(X,Y), que determina si X es suegra de Y.
suegra(X, Y) :- 
    casados(P, Y),
    esMujer(X),
    progenitor(X, P).

% c) suegro(X,Y), que determina si X es suegro de Y.
suegro(X, Y) :- 
    casados(P, Y),
    \+ esMujer(X), % si es hombre xD
    progenitor(X, P).

% d) padresPoliticosDe(X,Y,Z), que determina si X e Y son los padres políticos de Z.
padresPoliticosDe(X, Y, Z) :- 
    suegro(X, Z),
    suegra(X, Y).

% e) nuera(X,Y), que determina si X es nuera de Y. X seria tu novia e Y tu mama
nuera(X, Y) :- 
    casados(X, Z),
    esMujer(X),
    progenitor(Y, Z).

% f ) yerno(X,Y), que determina si X es yerno de Y.
 yerno(X, Y) :-
    casados(X, Z),
    \+ esMujer(X),
    progenitor(Y, Z).

% g) cunado(X,Y), que determina si X es el cuñado de Y.
cunados(X, Y) :-
    casados(Y, Z),
    \+ esMujer(X),
    hermanos(X, Z).

% h) cunada(X,Y), que determina si X es la cuñada de Y.
cunadas(X, Y) :- 
    casados(Y, Z),
    esMujer(X),
    hermanos(X, Z).

% i) hermanosPoliticos(X,Y), que determina si X e Y son hermanos polÍticos.
hermanosPoliticos(X, Y) :- 
    casados(X, Z),
    hermanos(Y, Z).

% j) concunados(X,Y), que determina si X e Y son concuñados.
concunados(X, Y) :-
    cunados(Y, Z),
    casados(Z, X).
