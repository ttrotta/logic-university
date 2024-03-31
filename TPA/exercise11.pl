% Ejercicio 11 - Crucigrama

word(V1, V11, V12, V13, V14, V15, V16, V17) :-
    length(V1, 7),                             % La longitud de la palabra es 7
    V1 = [V11, V12, V13, V14, V15, V16, V17].  % Descomponer la palabra en sus letras

word(V2, V21, V22, V23, V24, V25, V26, V27) :-
    length(V2, 7),
    V2 = [V21, V22, V23, V24, V25, V26, V27].

word(V3, V31, V32, V33, V34, V35, V36, V37) :-
    length(V3, 7),
    V3 = [V31, V32, V33, V34, V35, V36, V37].

word(H1, H11, H12, H13, H14, H15, H16, H17) :-
    length(H1, 7),
    H1 = [H11, H12, H13, H14, H15, H16, H17].

word(H2, H21, H22, H23, H24, H25, H26, H27) :-
    length(H2, 7),
    H2 = [H21, H22, H23, H24, H25, H26, H27].

word(H3, H31, H32, H33, H34, H35, H36, H37) :-
    length(H3, 7),
    H3 = [H31, H32, H33, H34, H35, H36, H37].

crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, _, _, _, _, _, _),  % Las palabras verticales tienen 7 letras
    word(V2, _, _, _, _, _, _, _),
    word(V3, _, _, _, _, _, _, _),
    word(H1, _, _, _, _, _, _, _),  % Las palabras horizontales también tienen 7 letras
    word(H2, _, _, _, _, _, _, _),
    word(H3, _, _, _, _, _, _, _).
    