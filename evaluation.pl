:- use_module(library(between)).
:- use_module(library(mutarray)).

insert_Mutarray([],[],_).

insert_Mutarray([K|K_Rest], [V|V_Rest],Mutarray):-
        mutarray_put(Mutarray,K,V),
        insert_Mutarray(K_Rest,V_Rest,Mutarray).

insert(Quantity) :-
	numlist(1,Quantity,Keys),
	numlist(1,Quantity,Values),
	garbage_collect,
	new_mutarray(Mutarray,Quantity),
	insert_Mutarray(Keys,Values,Mutarray),
        garbage_collect.

insertDifferentQuantities([]).

insertDifferentQuantities([H|T]) :-
        insert(H),
        insertDifferentQuantities(T).

?-insertDifferentQuantities([100000,200000,300000,400000,500000,600000,700000,800000,900000,1000000]).
