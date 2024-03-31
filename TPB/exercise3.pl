% En base al predicado para sumar definido en el inciso anterior, implementar un programa
% en Prolog para multiplicar dos numeros naturales mediante sumas sucesivas.
multiplicacion(0, _, 0).
multiplicacion(s(X), Y, Z) :-
    multiplicacion(X, Y, Z1),
    suma(Z1, Y, Z).

% Auxiliares
suma(0, X, X).
suma(s(X), Y, s(Z)) :- suma(X, Y, Z).
