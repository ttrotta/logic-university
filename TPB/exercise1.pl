% Proponer un predicado Prolog que verifique si su argumento representa un numero
% natural codificado en notacion s(n)
nn(0).
nn(s(X)) :- nn(X).

% ¿Se podrá usar para generar todos los naturales?
% Si, pasandole una variable como consulta. Ej: - nn(Rsta).