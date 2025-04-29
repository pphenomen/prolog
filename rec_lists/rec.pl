% consult('C:/Users/Administrator/Desktop/study/prolog/rec_lists/rec.pl').
% 1
% max(+X,+Y,-Z)
max(X,Y,X) :- X>Y, !.
max(_,Y,Y).

% max(+X,+Y,+U,-Z)
max(X,Y,Z,U) :- 
	max(X,Y,V),
	max(V,Z,U).

max3(X,Y,Z,X) :- X>Y, X>Z, !.
max3(_,Y,Z,Y) :- Y>Z, !.
max3(_,_,Z,Z).

% fact_up(+N, ?Res)
fact_up(0, 1) :- !.
fact_up(N, Res) :- 
	PrevN is N-1, 
	fact_up(PrevN, PrevRes), 
	Res is N * PrevRes.

fact_down(0, Acc, Acc) :- !.
fact_down(N, Acc, Res) :-
	NewAcc is Acc * N,
	PrevN is N - 1,
	fact_down(PrevN, NewAcc, Res).

fact_down(N, Res) :- fact_down(N, 1, Res).

% sum_digits_up(+N, ?Sum)
sum_digits_up(0, 0) :- !.
sum_digits_up(N, Sum) :- 
    Digit is N mod 10,
    Rest is N div 10,
    sum_digits_up(Rest, CurSum),
    Sum is CurSum + Digit.

% sum_digits_down(+N, ?Sum)
sum_digits_down(0, CurSum, CurSum) :- !.
sum_digits_down(N, CurSum, Sum) :-
    Digit is N mod 10,
    Rest is N div 10,
    NewSum is CurSum + Digit,
    sum_digits_down(Rest, NewSum, Sum).

sum_digits_down(N, Sum) :- sum_digits_down(N, 0, Sum).

% square_free(+N, ?Res)
square_free(N) :- 
    \+ has_square_divisor(N, 2).  

has_square_divisor(N, Del) :- Del * Del > N, !.   
has_square_divisor(N, Del) :- 0 is N mod (Del * Del), !, fail.
has_square_divisor(N, Del) :- NextDel is Del + 1, has_square_divisor(N, NextDel).

% read_list(?List, +N)
read_list(List, N) :- read_list(List, N, 0, []).
read_list(List, N, N, List) :- !.
read_list(List, N, Count, TempList) :- 
    read(El),
    append(TempList, [El], NewTempList),
    NewCount is Count + 1,
    read_list(List, N, NewCount, NewTempList).

% write_list(+List)
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

% sum_list_up(+List, ?Sum)
sum_list_up([], 0).
sum_list_up([H|T], Sum) :-
    sum_list_up(T, SumTail),
    Sum is H + SumTail.

% sum_list_down(+List, ?Sum)
sum_list_down(List, Sum) :- sum_list_down(List, 0, Sum).

sum_list_down([], Acc, Acc).
sum_list_down([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    sum_list_down(T, NewAcc, Sum).

% sum_prog
sum_prog :-
    write("Count elements: "), nl, read(N),
    write("Enter elements: "), nl, read_list(List, N),
    sum_list_down(List, Sum),
    write("Sum elements: "), write(Sum), nl.

% rm_elements_with_sum_digits(+List, +Sum, -Res)
rm_elements_with_sum_digits([], _, []) :- !.
rm_elements_with_sum_digits([H|T], Sum, Res) :-
    sum_digits_down(H, DigitSum),
    DigitSum =:= Sum, !,
    rm_elements_with_sum_digits(T, Sum, Res).
rm_elements_with_sum_digits([H|T], Sum, [H|ResTail]) :-
    rm_elements_with_sum_digits(T, Sum, ResTail).
