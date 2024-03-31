% Un conjunto puede ser modelado mediante una lista de elementos sin repeticiones. 
% Adoptando esta representación, implementar las siguientes operaciones sobre 
% conjuntos en lenguaje Prolog.

add(E, Xs, [E | Xs]).

% a) Comprobar si una lista de elementos constituye un conjunto valido.
validSet([X | []]).
validSet([X | Xs]) :-
    not(findElement(X, Xs)), % not = \+
    validSet(Xs).

% b) Determinar si un elemento pertenece a un conjunto.
belongs(E, X) :-
    findElement(E, X).
    
% c) Incorporar un elemento a un conjunto
set(E, S, R) :-
    belongs(E, S),
    R = S.
set(E, S, R) :-
    not(belongs(E, S)),
    add(E, S, R).

% d) Unir dos conjuntos
union([], [], []).
union(X, [], X).
union(X, [Y | Ys], [Y | R]) :-
    \+(belongs(Y, X)),
    union(X, Ys, R).
union(X, [Y | Ys], R):-
    belongs(Y, X),
    union(X, Ys, R). 

% e) Intersectar dos conjuntos
intersection(X, [], []).
intersection(X, [Y | Ys], R) :-
    not(belongs(Y, X)),
    intersection(X, Ys, R). 
intersection(X, [Y | Ys], [Y | R]) :-
    belongs(Y, X),
    intersection(X, Ys, R). 

% f) Calcular la diferencia entre dos conjuntos.
difference(X, Y, R) :-
    intersection(X, Y, I),
    removeIntersection(X, I, R).

removeIntersection([], I, []).
removeIntersection([X | Xs], I, R) :-
    not(belongs(X, I)),
    removeIntersection(Xs, I, R).
removeIntersection([X | Xs], I, [X | R]) :-
    belongs(X, I),
    removeIntersection(Xs, I, R).

% g) Dada una lista de elementos con repeticiones, construir un 
% conjunto que contenga todos los elementos de esa lista.
listToSet([X | []], [X]).
listToSet([X | Xs], R) :-
    listToSet(Xs, K),
    set(X, K, R).

% Methods of List
createList(A, B, [A | B]).

addFirst(E, Xs, [E | Xs]).

addLast(E, [], [E | []]).
addLast(E, [X | Xs], L) :-
    addLast(E, Xs, Ls),
    L = [X | Ls].

concat([], Xs, Xs).
concat([X | Xs], Ys, [X | Zs]) :- concat(Xs, Ys, Zs).

findElement(E, [E | _Xs]).
findElement(E, [_X | Xs]) :- findElement(E, Xs).

investList([], _). % otra opción: investList([X | []], [X]).
investList([X | Xs], List) :-
    investList(Xs, AuxList),
    addLast(X, AuxList, List).

removeElement(X, [X | Xs], Xs).
removeElement(X, [Y | Ys], List) :-
    removeElement(X, Ys, AuxList),
    List = [Y | AuxList].

removeAllElements(X, [X | []], []).
removeAllElements(X, [Y | []], [Y]) :-
    Y \= X.
removeAllElements(X, [X | Ys], L) :-
    removeAllElements(X, Ys, L).
removeAllElements(X, [Y | Ys], L) :-
    Y \= X,
    removeAllElements(X, Ys, K),
    L = [Y | K].

changeElement(X, Y, [Y | Zs], [X | Zs]).
changeElement(X, Y, [Z | Zs], L) :-
    changeElement(X, Y, Zs, K),
    L = [Z | K].

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

bigPalindrome(X, R) :-
    investList(X, Y),
    concat(X, Y, R).

shiftRight(L, R) :-
    removeLast(L, E, K),
    addFirst(E, K, R).

removeLast([X | []], X, []). 
removeLast([X | Xs], E, R) :-
    removeLast(Xs, E, K),
    R = [X | K]. 

shiftLeft(L, R) :-
    removeFirst(L, E, K),
    addLast(E, K, R).

removeFirst([X | Xs], X, Xs).
