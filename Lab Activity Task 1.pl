% ====================================================
% LAB 12: Graphs - Task 1
% ====================================================

edge(al_qatif, dammam).
edge(al_qatif, madinah).

edge(dammam, riyadh).
edge(dammam, al_qatif).

edge(makkah, madinah).
edge(makkah, riyadh).

edge(madinah, makkah).
edge(madinah, taif).
edge(madinah, tabuk).

edge(riyadh, dammam).

edge(taif, dammam).
edge(taif, tabuk).

edge(tabuk, taif).

travel(Start, Finish, Path) :- path(Start, Finish, [Start], P), reverse(P, Path).

path(X, X, P, P).
path(From, To, Visited, Path) :- edge(From, Z), \+ member(Z, Visited), path(Z, To, [Z | Visited], Path).

% ====================================================
% Task 1 - Output 
% ====================================================
/* 
?- travel(dammam, madinah, P).
P = [dammam, al_qatif, madinah]
false

?- travel(riyadh, makkah, P).
P = [riyadh, dammam, al_qatif, madinah, makkah]
false

?- travel(makkah, riyadh, P).
P = [makkah, madinah, taif, dammam, riyadh]
P = [makkah, madinah, tabuk, taif, dammam, riyadh]
P = [makkah, riyadh]
false

?- travel(makkah, madinah, P).
P = [makkah, madinah]
P = [makkah, riyadh, dammam, al_qatif, madinah]
false
*/