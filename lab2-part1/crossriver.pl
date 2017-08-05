/* the opposite facts*/
opp(e,w).
opp(w,e).

/*the meaning of each state*/
%state(Police,Criminal,Father,Mother,SonA,SonB,DaughterA,DaughterB,Boat).
/*THE UNSAFE STATES*/
%unsafe(state(Police,X,Father,Mother,SonA,SonB,DaughterA,DaughterB,Boat)):- opp(Police,X),not(opp(Father,X),opp(Mother,X),opp(SonA,X),opp(SonB,X),opp(DaughterA,X),opp(DaughterB,X)).
/* if police and Criminal are not at same side*/
unsafe(state(Police,X,X,_,_,_,_,_,_)):- opp(Police,X).
unsafe(state(Police,X,_,X,_,_,_,_,_)):- opp(Police,X).
unsafe(state(Police,X,_,_,X,_,_,_,_)):- opp(Police,X).
unsafe(state(Police,X,_,_,_,X,_,_,_)):- opp(Police,X).
unsafe(state(Police,X,_,_,_,_,X,_,_)):- opp(Police,X).
unsafe(state(Police,X,_,_,_,_,_,X,_)):- opp(Police,X).

/* if father and daughter are at same side when mother is not */
unsafe(state(_,_,Father,X,X,_,_,_,_)):- opp(Father,X).
unsafe(state(_,_,Father,X,_,X,_,_,_)):- opp(Father,X).

/* if mother and son are not at same side when father is not */
unsafe(state(_,_,X,Mother,_,_,X,_,_)):- opp(Mother,X).
unsafe(state(_,_,X,Mother,_,_,_,X,_)):- opp(Mother,X).

writelist([]):-nl.
writelist([H|T]):-write(H),writelist(T).

reverse_writelist([]).
reverse_writelist([H|T]):-reverse_writelist(T),write(H),nl.

empty_stack([]).
stack(Top,Stack,[Top|Stack]).

reverse_print_stack(Stack):-empty_stack(Stack).
reverse_print_stack(Stack):-stack(E,Rest,Stack),reverse_print_stack(Rest),write(E),nl.

member(X,[X|_]).
member(X,[_|T]):-member(X,T).
member_stack(Element,Stack):-member(Element,Stack).

/*THE POLICE ROW*/
move(state(X,X,F,M,Sa,Sb,Da,Db,X),state(Y,Y,F,M,Sa,Sb,Da,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,Y,F,M,Sa,Sb,Da,Db,Y))).%,writelist(['Try Police takes Criminal from: ',X,X,F,M,Sa,Sb,Da,Db,X,' to: ',Y,Y,F,M,Sa,Sb,Da,Db,Y]).
move(state(X,C,X,M,Sa,Sb,Da,Db,X),state(Y,C,Y,M,Sa,Sb,Da,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,Y,M,Sa,Sb,Da,Db,Y))).%,writelist([' Try Police And Father from: ',X,C,X,M,Sa,Sb,Da,Db,X,' to: ',Y,C,Y,M,Sa,Sb,Da,Db,Y]).
move(state(X,C,F,X,Sa,Sb,Da,Db,X),state(Y,C,F,X,Sa,Sb,Da,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,F,Y,Sa,Sb,Da,Db,Y))).%,writelist([' Try Police And Motherfrom: ',X,C,F,X,Sa,Sb,Da,Db,X,' to: ',Y,C,F,Y,Sa,Sb,Da,Db,Y]).
move(state(X,C,F,M,X,Sb,Da,Db,X),state(Y,C,F,M,Y,Sb,Da,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,F,M,X,Sb,Da,Db,Y))).%,writelist([' Try Police takes the first sonfrom: ',X,C,F,M,X,Sb,Da,Db,X,' to: ',Y,C,F,M,Y,Sb,Da,Db,Y]).
move(state(X,C,F,M,Sa,X,Da,Db,X),state(Y,C,F,M,Sa,Y,Da,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,F,M,Sa,Y,Da,Db,Y))).%,writelist([' Try Police takes the second son from: ',X,C,F,M,Sa,X,Da,Db,X,' to: ',Y,C,F,M,Sa,Y,Da,Db,Y]).
move(state(X,C,F,M,Sa,Sb,X,Db,X),state(Y,C,F,M,Sa,Sb,Y,Db,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,F,M,Sa,Sb,Y,Db,Y))).%,writelist([' Try Police takes the first daughter from: ',X,C,F,M,Sa,Sb,X,Db,X,' to: ',Y,C,F,M,Sa,Sb,Y,Db,Y]).
move(state(X,C,F,M,Sa,Sb,Da,X,X),state(Y,C,F,M,Sa,Sb,Da,Y,Y)):- 
	opp(X,Y),not(unsafe(state(Y,C,F,M,Sa,Sb,Da,Y,Y))).%,writelist([' Try Police takes the second daughter from: ',X,C,F,M,Sa,Sb,Da,X,X,' to: ',Y,C,F,M,Sa,Sb,Da,Y,Y]).
move(state(X,C,F,M,Sa,Sb,Da,Db,X),state(Y,C,F,M,Sa,Sb,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(Y,C,F,M,Sa,Sb,Da,Db,Y))).%,writelist([' Try Police takes himself from: ',X,C,F,M,Sa,Sb,Da,Db,X,' to: ',Y,C,F,M,Sa,Sb,Da,Db,Y]).
/*THE FATHER ROW*/
move(state(P,C,X,M,X,Sb,Da,Db,X),state(P,C,Y,M,Y,Sb,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,Y,M,Y,Sb,Da,Db,Y))).%,writelist([' Try father takes the first son from: ',P,C,X,M,X,Sb,Da,Db,X,' to: ',P,C,Y,M,Y,Sb,Da,Db,Y]).
move(state(P,C,X,X,Sa,Sb,Da,Db,X),state(P,C,Y,Y,Sa,Sb,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,Y,Y,Sa,Sb,Da,Db,Y))).%,writelist([' Try father And Mother from: ',P,C,X,X,Sa,Sb,Da,Db,X,X,' to: ',P,C,Y,Y,Sa,Sb,Da,Db,Y,Y]).
move(state(P,C,X,M,Sa,X,Da,Db,X),state(P,C,Y,M,Sa,Y,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,Y,M,Sa,Y,Da,Db,Y))).%,writelist([' Try father takes the second son from: ',P,C,X,M,Sa,X,Da,Db,X,' to: ',P,C,Y,M,Sa,Y,Da,Db,Y]).
move(state(P,C,X,M,Sa,Sb,Da,Db,X),state(P,C,Y,M,Sa,Sb,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,Y,M,Sa,Sb,Da,Db,Y))).%,writelist([' Try father takes himself from: ',P,C,X,M,Sa,Sb,Da,Db,X,' to: ',P,C,Y,M,Sa,Sb,Da,Db,Y]).
/*THE MOTHER ROW*/
move(state(P,C,F,X,Sa,Sb,X,Db,X),state(P,C,F,Y,Sa,Sb,Y,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,F,Y,Sa,Sb,Y,Db,Y))).%,writelist([' Try Mother takes the first daughter from: ',P,C,F,X,Sa,Sb,X,Db,X,' to: ',P,C,F,Y,Sa,Sb,Y,Db,Y]).
move(state(P,C,F,X,Sa,Sb,Da,X,X),state(P,C,F,Y,Sa,Sb,Da,Y,Y)):-
	opp(X,Y),not(unsafe(state(P,C,F,Y,Sa,Sb,Da,Y,Y))).%,writelist([' Try Mother takes the second daughter from: ',P,C,F,X,Sa,Sb,Da,X,X,' to: ',P,C,F,Y,Sa,Sb,Da,Y,Y]).
move(state(P,C,F,X,Sa,Sb,Da,Db,X),state(P,C,F,Y,Sa,Sb,Da,Db,Y)):-
	opp(X,Y),not(unsafe(state(P,C,F,Y,Sa,Sb,Da,Db,Y))).%,writelist([' Try mother takes herself from: ',P,C,F,X,Sa,Sb,Da,Db,X,' to: ',P,C,F,Y,Sa,Sb,Da,Db,Y]).

/*get the length of list*/
list_length([],0):-!.
list_length([_|Tail],K) :-
	list_length(Tail,S),
	K is S+1.

/* choose the best way*/
choose_optimal(Been):-
	list_length(Been,N),
	optimal_path(Old_path),
	optimal_foot(M),
	N < M,
	assert(optimal_path(Been)),
	assert(optimal_foot(N)),
	retract(optimal_path(Old_path)),
	retract(optimal_foot(M)),
	write('Now, the shortest path is: '),nl,
	reverse_print_stack(Been),
	write('The number of  shortest steps is: '),
	get_num(N,O),
	write(O).
	
	
path(Goal,Goal,Been_stack):-
	choose_optimal(Been_stack).
	
path(State,Goal,Been_stack):-
	move(State,Next_state),
	not(member_stack(Next_state,Been_stack)),
	stack(Next_state,Been_stack,New_been_stack),
	path(Next_state,Goal,New_been_stack),fail.

get_num(I,O):-
	O is I - 1.

/*Let's go*/
go(Start,Goal):-
	assert(optimal_path([])),
	assert(optimal_foot(500)),
	empty_stack(Empty_been_stack),
	stack(Start,Empty_been_stack,Been_stack),
	path(Start,Goal,Been_stack).

	
	







