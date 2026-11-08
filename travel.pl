% ARTI 401 - Lab 10 - Lab Activity Task 1 (slides 26-27)
% Find the path between different cities in a directed graph.
% Run with:  ?- travel('Dammam', 'Madinah', P).   (press ; for more paths)

% ---------- Facts: one edge(From, To) per arrow in the figure ----------
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

edge('Riyadh', 'Dammam').

% ---------- Rules ----------
% travel(Start, Finish, Path)
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% path(From, To, Visited_List, Path_List)
% the visited list stops Prolog going round in circles
path(X, X, P, P).
path(X, Y, V, P) :-
    edge(X, Z),
    \+ member(Z, V),
    path(Z, Y, [Z|V], P).
