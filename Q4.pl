%a)
skip(L1,L2,AN):-skipA(L1,L2,0,AN).%the added number is a tracker for when skip is toggle on and off 

skipA([],_,_,[]).%base case when the list is empty 

skipA([H|T],L2,TG,AN):-%element is in second list and skip toggle is on 
	member(H,L2),
	0 =:= mod(TG,2),
	TGT is TG+1,
	skipA(T,L2,TGT,AN),!.

skipA([H|T],L2,TG,[H|TA]):-%element is in second list and skip toggle is off
	member(H,L2),
	0 =\= mod(TG,2),
	TGT is TG+1,
	skipA(T,L2,TGT,TA),!.

skipA([H|T],L2,TG,[H|TA]):-% element is not in second list and skip toggle is not on 
	0 =\= mod(TG,2),
	skipA(T,L2,TG,TA),!.

skipA([_|T],L2,TG,AN):-%skip toggle is on 
	skipA(T,L2,TG,AN),!.


%b)
turn(L1,L2,AN):-turnA(L1,L2,0,AN).

turnA([],_,_,[]).

turnA([H|T],L2,TG,[H|TA]):-%Toggle on 
	member(H,L2),
	0 =:= mod(TG,2),
	TGT is TG+1,
	turnA(T,L2,TGT,TA),!.

turnA([H|T],L2,TG,TA):-%toggle is off 
	member(H,L2),
	0 =\= mod(TG,2),
	TGT is TG+1,
	append(H,TA,TA),
	turnA(T,L2,TGT,TA),!.

turnA([H|T],L2,TG,TA):-
	0 =\= mod(TG,2),
	append(H,TA,TA),
	turnA(T,L2,TG,TA),!.

turnA([H|T],L2,TG,[H|TA]):-
	turnA(T,L2,TG,TA),!.

