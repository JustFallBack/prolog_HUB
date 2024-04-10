estfem(eve). % Mere de anne et luc
esthom(jean). % Pere de claire et luc
estfem(anne). % Fille de eve, donc soeur de luc et claire
esthom(luc). % Fils de eve et jean, frere de anne et claire, pere de marc et laure
estfem(claire). % Fille de jean, soeur de anne et luc
esthom(marc). % Fils de luc et de marie, frere de laure.
estfem(laure). % Fille de luc et de claire, soeur de marc et mere de bob et max
estfem(marie). % Mere de marc
esthom(max). % Fils de laure, frere de bob
esthom(bob). % Fils de laure, frere de max

parent(claire, laure).
parent(eve,anne).
parent(eve,luc). 
parent(jean,luc). 
parent(jean,claire).
parent(luc,laure).
parent(luc,marc). 
parent(marie,marc).
parent(laure, bob).
parent(laure, max).


pere(Pere, Enfant) :- parent(Pere, Enfant), esthom(Pere).

mere(Mere, Enfant) :- parent(Mere, Enfant), estfem(Mere).

frere(Frere, X) :- parent(Y, Frere), parent(Y, X), esthom(Frere), Frere \= X.

soeur(Soeur, X) :- parent(Y, Soeur), parent(Y, X), estfem(Soeur), Soeur \= X.

tante(Tante, X) :- parent(Parent, X), soeur(Tante, Parent).

oncle(Oncle, X) :- parent(Parent, X), frere(Oncle, Parent).

ancetre(Ancetre, Descendant) :- parent(Ancetre, Descendant) ; parent(Parent, Descendant), ancetre(Ancetre, Parent).