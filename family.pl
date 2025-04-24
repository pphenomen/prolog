% consult('C:/Users/Administrator/Desktop/study/prolog/family.pl').
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

% 1
men:- 
    man(X), 
    print(X), nl, fail.
women:- 
    woman(X), 
    print(X), nl, fail.
children:-
    parent(Parent,Child),
    print(Parent), print(:), print(Child), nl, fail.
mother:- 
    parent(Parent,Child), 
    woman(Parent), 
    print(Parent), nl, fail.
brother(X,Y):- 
	man(X),
    X \= Y,
    parent(Parent, X),
    parent(Parent, Y).
brothers(X):-
    parent(Parent, X),
    parent(Parent, Y),
    man(Y),
    X \= Y,
    print(Y), nl, fail.
b_s(X,Y):- 
    X \= Y,
    parent(Father, X), man(Father),
    parent(Mother, X), woman(Mother),
    parent(Father, Y),
    parent(Mother, Y).