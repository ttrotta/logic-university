% Definir en Prolog los siguientes predicados recursivos para manejar listas:

% Lista vacía: []
% Lista que contiene al 1: [1 | []]
% Lista que contiene al 1, 2 y 3: [1 | [2 | [3 | []]]] 

% a) Dados dos elementos, crear una lista con esos dos elementos.
createList(A, B, [A | B]).

% b) Insertar un elemento en una lista:
%  1) Al comienzo de la lista.
addFirst(E, Xs, [E | Xs]).

%  2) Al final de la lista.
addLast(E, [], [E | []]).
addLast(E, [X | Xs], L) :-
    addLast(E, Xs, Ls),
    L = [X | Ls].

% c) Concatenar dos listas
concat([], Xs, Xs).
concat([X | Xs], Ys, [X | Zs]) :- concat(Xs, Ys, Zs).

% d) Buscar un elemento en una lista
findElement(E, [E | _Xs]).
findElement(E, [_X | Xs]) :- findElement(E, Xs).

% e) Invertir una lista.
investList([], _). % otra opción: investList([X | []], [X]).
investList([X | Xs], List) :-
    investList(Xs, AuxList),
    addLast(X, AuxList, List).

% f) Borrar un elemento en una lista
%  1) Borrando sólo una aparición del elemento
removeElement(X, [X | Xs], Xs).
removeElement(X, [Y | Ys], List) :-
    removeElement(X, Ys, AuxList),
    List = [Y | AuxList].

%  2) Borrando todas las apariciones de ese elemento
removeAllElements(X, [X | []], []).
removeAllElements(X, [Y | []], [Y]) :-
    Y \= X.
removeAllElements(X, [X | Ys], L) :-
    removeAllElements(X, Ys, L).
removeAllElements(X, [Y | Ys], L) :-
    Y \= X,
    removeAllElements(X, Ys, K),
    L = [Y | K].

% g) Cambiar un cierto elemento por otro
%  1) Borrando sólo una aparición del elemento
%    X = nuevo elemento, Y = elemento a cambiar
changeElement(X, Y, [Y | Zs], [X | Zs]).
changeElement(X, Y, [Z | Zs], L) :-
    changeElement(X, Y, Zs, K),
    L = [Z | K].

%  2) Borrando todas las apariciones de ese elemento

%changeAllElements(X, Y, [X | []], [X]).
%changeAllElements(X, Y, [Z | []], [Z]) :- Z \= X.
%changeAllElements(X, Y, [X | Xs], L) :-
%  addFirst(Y, Zs, K),
%changeAllElements(X, Y, K, L).
%changeAllElements(X, Y, [Z | Zs], L) :-
% Z \= X,
% changeAllElements(X, Y, Zs, K),
% L = [Z | K].

% h) Detectar si una lista es palíndroma
isPalindrome([]).
isPalindrome([_]).
isPalindrome([X | Xs]) :-
    append(Ys, [X], Xs), 
    isPalindrome(Ys).

palindrome(X) :-
    investList(X, Y).
    equal(X, Y).

equal([], []).
equal([X | Xs], [Y | Ys]) :-
    X =:= Y,
    equal(Xs, Ys).

% i) Dada una lista de longitud n, generar otra lista de longitud 2n que sea palíndroma.
bigPalindrome(X, R) :-
    investList(X, Y),
    concat(X, Y, R).

% j) Desplazar una posición a la derecha a todos los elementos de una lista (i.e., pasar
% de la lista [x1, x2, . . . , xn] a la lista [xn, x1, . . . , xn−1]).
shiftRight(L, R) :-
    removeLast(L, E, K),
    addFirst(E, K, R).

removeLast([X | []], X, []). 
removeLast([X | Xs], E, R) :-
    removeLast(Xs, E, K),
    R = [X | K]. % Other option: addFirst(X, K, R).

% k) Idem ejercicio anterior, pero ahora desplazar una posición a la izquierda.
shiftLeft(L, R) :-
    removeFirst(L, E, K),
    addLast(E, K, R).

removeFirst([X | Xs], X, Xs).
