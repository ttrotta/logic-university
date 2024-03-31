% Definir un programa para sumar dos números naturales, representados en notación s(0),
% a través de incrementos sucesivos
suma(0, X, X).
suma(s(X), Y, s(Z)) :- suma(X, Y, Z).
