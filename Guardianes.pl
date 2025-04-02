% Definir guardianes
guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

% Definir templos
templo(fuego).
templo(tierra).
templo(agua).
templo(aire).

% Restricciones de quién no puede cuidar qué templo
no_cuida(apolo, fuego).
no_cuida(apolo, tierra).
no_cuida(hecate, aire).
no_cuida(ares, fuego).
no_cuida(ares, agua).

% Hermes cuida fuego o agua
cuida_opcional(hermes, fuego).
cuida_opcional(hermes, agua).

% Regla para la solución
solucion(Solucion) :-
    Solucion = [ (apolo, T1), (hecate, T2), (ares, T3), (hermes, T4) ],
    
    % Asegurar que sean templos distintos
    templo(T1), templo(T2), templo(T3), templo(T4),
    all_different([T1, T2, T3, T4]),

    % Aplicar restricciones
    \+ no_cuida(apolo, T1),
    \+ no_cuida(hecate, T2),
    \+ no_cuida(ares, T3),
    cuida_opcional(hermes, T4).

% Función para asegurar que los valores sean distintos
all_different([]).
all_different([X|Xs]) :- \+ member(X, Xs), all_different(Xs).
