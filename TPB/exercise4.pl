% En base al predicado para multiplicar definido en el inciso anterior, implementar un programa 
% en Prolog para calcular las potencias entero positivas de un número
% natural, apelando a multiplicaciones sucesivas.
potencia(_, 0, s(0)).
potencia(X, s(N), F) :-
    potencia(X, N, F1),
    multiplicacion(F1, X, F). 
    
% Auxiliares
multiplicacion(0, _, 0).
multiplicacion(s(X), Y, Z) :-
    multiplicacion(X, Y, Z1),
    suma(Z1, Y, Z).  

suma(0, X, X).
suma(s(X), Y, s(Z)) :- 
    suma(X, Y, Z).
