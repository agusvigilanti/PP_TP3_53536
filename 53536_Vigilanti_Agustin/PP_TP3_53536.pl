% Hechos y Reglas

% Ejercicio 1
par(0).
par(N) :-
    N > 0,
    N2 is N - 2,
    par(N2).

% Ejercicio 2
suma(0,0).
suma(N,S) :- 
    N > 0,
    N1 is N-1,
    suma(N1,S1),
   	S is S1 + (2 * N).

% Ejercicio 3
potencia(_,0,1).
potencia(B,E,V) :-
    E > 0,
    E1 is E-1,
    potencia(B,E1,V1),
    V is B * V1.

% Ejercicio 4
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,R) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, R1),
    fibonacci(N2, R2), 
    R is R1 + R2.

% Ejercicio 5
not(0, 1).
not(1, 0).
and(0, 0, 0).
and(0, 1, 0).
and(1, 0, 0).
and(1, 1, 1).
or(0, 0, 0).
or(0, 1, 1).
or(1, 0, 1).
or(1, 1, 1).
circuito(Q1, Q2, S) :-
    not(Q1,S1),
    and(S1,Q2,S2),
    not(Q2,S3),
    and(S3,Q1,S4),
    or(S2,S4,S).

% Ejercicio 6

sintoma(juan, picazon).
sintoma(pedro, fiebre).
sintoma(alberto, dolor_cabeza).
  
enfermedad(sarampion, picazon).
enfermedad(covid19, fiebre).
enfermedad(migraña, dolor_cabeza).

diagnostico(P, S, E) :- 
    sintoma(P,S),
    enfermedad(E,S).


% Tratamiento de Listas

pertenece(X, [X|_]). 
pertenece(X, [_|Xs]) :- pertenece(X, Xs).

% Ejercicio 7
predecesor([], []).
predecesor([X|Xs], [X|Rs]) :- aux_pred(X, Xs, Rs).

aux_pred(_, [], []).
aux_pred(Prev, [X|Xs], [X|Rs]) :- X >= Prev, aux_pred(X, Xs, Rs).
aux_pred(Prev, [X|Xs], Rs) :- X < Prev, aux_pred(X, Xs, Rs).

% Ejercicio 8
rotada(L, 0, L). 
rotada([Cab|Col], N, Res) :- 
    N > 0, 
    N1 is N - 1, 
    append(Col, [Cab], LTemp), 
    rotada(LTemp, N1, Res).

% Ejercicio 9
suma(0, []). 
suma(Total, [X|Xs]) :- suma(SubTotal, Xs), Total is SubTotal + X.

% Ejercicio 10
cantidad([], 0). 
cantidad([_|Xs], N) :- cantidad(Xs, N1), N is N1 + 1.

% Ejercicio 11
ultimo([U], U). 
ultimo([_|Xs], U) :- ultimo(Xs, U).

% Ejercicio 12
inversa(L, I) :- inv_aux(L, [], I).

inv_aux([], Acc, Acc).
inv_aux([X|Xs], Acc, I) :- inv_aux(Xs, [X|Acc], I).

% Ejercicio 13
sacar(0, [_|Xs], Xs). 
sacar(P, [X|Xs], [X|Rs]) :- P > 0, P1 is P - 1, sacar(P1, Xs, Rs).

% Ejercicio 14
eliminar([E|Xs], E, Xs) :- !. 
eliminar([X|Xs], E, [X|Rs]) :- eliminar(Xs, E, Rs).

% Ejercicio 15
eliminarTodas([], _, []). 
eliminarTodas([E|Xs], E, Rs) :- eliminarTodas(Xs, E, Rs). 
eliminarTodas([X|Xs], E, [X|Rs]) :- X \= E, eliminarTodas(Xs, E, Rs).

% Ejercicio 16
intersec([], _, []). 
intersec([X|Xs], L2, [X|Rs]) :- pertenece(X, L2), intersec(Xs, L2, Rs). 
intersec([X|Xs], L2, Rs) :- \+ pertenece(X, L2), intersec(Xs, L2, Rs).

% Ejercicio 17
rotarIzq(L, N, R) :- rotada(L, N, R).

% Ejercicio 18
insertarEn(E, L, 0, [E|L]). 
insertarEn(E, [X|Xs], P, [X|Rs]) :- P > 0, P1 is P - 1, insertarEn(E, Xs, P1, Rs).

% Ejercicio 19
insOrden(E, [], [E]). 
insOrden(E, [X|Xs], [E, X|Xs]) :- E =< X. 
insOrden(E, [X|Xs], [X|Rs]) :- E > X, insOrden(E, Xs, Rs).

% Ejercicio 20
ordenada([], []). 
ordenada([X|Xs], O) :- ordenada(Xs, ListaTemp), insOrden(X, ListaTemp, O).