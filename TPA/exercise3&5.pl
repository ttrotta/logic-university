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

% a) padresDe(X,Y,Z), que determina si X e Y son los padres de Z
padresDe(X, Y, Z) :-
    progenitor(X, Z),
    progenitor(Y, Z).

% b) tuvoHijos(X), que determina si X tuvo algun hijo.
tuvoHijos(X) :- 
    progenitor(X, _).

% c) esMadre(X), que determina si X ha sido madre. Verificar que el predicado definido no suministre 
%    respuestas incorrectas. De ser necesario, incorporar a la base de conocimiento provista nuevos 
%    predicados auxiliares modelando información extra indicando las razones que fundamentan dicha incorporación.
esMadre(X) :- 
    esMujer(X), progenitor(X, _). 

% Auxiliares
mujer(flavia).
mujer(ines).
mujer(sara).
mujer(maria).
mujer(luisa).

esMujer(X) :-
    mujer(X).

% d) hermanos(X,Y), que determina si X e Y son hermanos. Explicitar la nocion de hermano adoptada.
hermanos(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y).

% e) tio(X,Y), que determina si X es uno de los tios de Y.
tio(X, Y) :-
    progenitor(P, Y),
    hermanos(X, P).

% f) abuelo(X,Y), que determina si X es uno de los abuelos de Y.
abuelo(X, Y) :- 
    progenitor(P, Y),
    progenitor(X, P).

% g) tioAbuelo(X,Y), que determina si X es uno de los tios abuelos de Y. Considerando la
%    base de conocimiento suministrada, ¿que particularidad presenta esta relacion?
tioAbuelo(X, Y) :-
    abuelo(A, Y),
    hermanos(A, X).

% h) ancestro(X,Y), que determina si X es un ancestro de Y. Cabe señalar que esta relación
%    coincide con la clausura transitiva de la relacion progenitor/2.
ancestro(X, Y) :- 
    progenitor(X, Y) ;
    progenitor(X, Z),
    ancestro(Z, Y).