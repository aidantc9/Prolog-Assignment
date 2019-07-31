%a)
treeEx(X) :-
 X = t(73,t(31,t(5,nil,nil),nil),t(101,t(83,nil,t(97,nil,nil)),nil)).

single(nil,[]).
single(t(_,nil,nil),[]):-!.%base case done going through the list

single(t(Root,nil,Right),[Root|T]):-%if element is missing a left child 
	single(Right,T).

single(t(Root,Left,nil),[Root|TL]):-%element is missing right child 
	single(Left,TL).

single(t(_,Left,Right),L):-%when has both left and right children calls single 2 times for left and right portions of the tree
	single(Left,LL),
	single(Right,LR),
	append(LL,LR,L).



%b)



single(T,V,L):-singleFill(T,V,L).%fills in the value when it reaches the end node of the tree thats parent has only one child
singleFill(nil, V, t(V, nil, nil)).

singleFill(t(Root, nil, nil),_, t(Root, nil, nil)):- !.%when reach a node that does not have a left or right child the recursion stops

singleFill(t(Root, Left, Right), V, t(Root, LD, RD)) :- %calls singleFill for left and right sub trees and stores the modded tree in the LD and RD variables which are later stored in the final result 
    singleFill(Left, V, LD),
    singleFill(Right, V, RD).