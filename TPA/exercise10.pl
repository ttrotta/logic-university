% Toda funcion n-aria puede ser facilmente parafraseada como una relacion n + 1-aria al
% incorporar el resultado esperado como un parametro mas

% Función suma
suma(X, Y, R) :- 
    R is X + Y.

% Función cuadrado
cuadrado(X, R) :-
    R is X * X.

% Función producto
producto(X, Y, R) :-
    R is X * Y.