/* the meaning of each attributes*/
attributes(Owner,Type,Gallon,Truth).

/*the attributes of car*/
car(attributes(george,Type,Gallon,Truth),[attributes(george,Type,Gallon,Truth),_,_,_]).
	
car(attributes(doc,Type,Gallon,Truth),[_,attributes(doc,Type,Gallon,Truth),_,_]).
	
car(attributes(tito,Type,Gallon,Truth),[_,_,attributes(tito,Type,Gallon,Truth),_]).
	
car(attributes(jimmy,Type,Gallon,Truth),[_,_,_,attributes(jimmy,Type,Gallon,Truth)]).
	
member(X,[X|T]).
member(X,[_|T]):-member(X,T).

/*the man named X do not own a car whose type is Y.*/
not_own(X,Y,All):-
	car(attributes(X,_,G1,_),All),
	car(attributes(_,Y,G2,_),All),
	\+ (G1 = G2).
	%not(member(attributes(X,Y,_),All)).

/* the car whose type is Y do not have a gallon Z*/
not_own2(Y,Z,All):-
	car(attributes(_,Y,G3,_),All),
	car(attributes(_,_,Z,_),All),
	\+ (G3 = Z).
	%not(member(attributes(_,Y,Z),All)).

not_better(X,Y,All):-
	attributes(A,B,C) = X,
	car(attributes(A,B,C),All),
	attributes(D,E,F) = Y,
	car(attributes(D,E,F),All),
	C < F.
gas(attributes(L,M,N)).
	
/*the man whose name is Name talked about gas */
talk(attributes(Name,_,_,_),gas(attributes(Own,Ty,Ga,T1)),All):-
	car(attributes(Name,_,_,Truth),All),
	((Truth = truth,
		%write('Here1'),
	 car(attributes(Own,Ty,Ga,T1),All));
	 
	(Truth = lie,
		%write('Here2'),
	 not(car(attributes(Own,Ty,Ga,T1),All))
	)).
/* the man whose name is Name talked about whose gas is better than another*/
talk(attributes(Name,_,_,_),better(X,Y,All)):-
	car(attributes(Name,_,_,Truth),All),
	((Truth = truth,
	 attributes(A,B,C,T1) = X,
	 attributes(D,E,F,T2) = Y,
	 car(attributes(A,B,C,T1),All),
	 car(attributes(D,E,F,T2),All),
	 C > F
	);
	(Truth = lie,
	 attributes(A,B,C,T1) = X,
	 attributes(D,E,F,T2) = Y,
	 car(attributes(A,B,C,T1),All),
	 car(attributes(D,E,F,T2),All),
	 C < F
	)).
	
/*which two are truthful,and the other two are not*/
truthful([george,doc],[tito,jimmy]).
truthful([george,tito],[doc,jimmy]).
truthful([george,jimmy],[doc,tito]).
truthful([doc,tito],[george,jimmy]).
truthful([doc,jimmy],[george,tito]).
truthful([tito,jimmy],[george,doc]).

/* check if the result is good
	meaning that whose gas is higher than 25 will be truthful */
corret(P):-
	attributes(_,_,G,Truth) = P,
	((Truth=truth,
	 G > 20);
	(Truth = lie,
	 G<25)).

all_owner(All):-
	/*at begining, everyone can be truthful or not*/
	(car(attributes(george,_,_,truth),All);
	 car(attributes(george,_,_,lie),All)),
	
	(car(attributes(doc,_,_,truth),All);
	 car(attributes(doc,_,_,lie),All)),

	(car(attributes(tito,_,_,truth),All);
	 car(attributes(tito,_,_,lie),All)),

	(car(attributes(jimmy,_,_,truth),All);
	 car(attributes(jimmy,_,_,lie),All)),

	/*the gas of a man will be one of the list [30,25,20,15]*/
	car(attributes(_,_,30,_),All),
	car(attributes(_,_,25,_),All),
	car(attributes(_,_,20,_),All),
	car(attributes(_,_,15,_),All),

	/*the type of a car will be one of the list[ford,chevrolet,doge,toyota]*/
	car(attributes(_,ford,_,_),All),
	car(attributes(_,chevrolet,_,_),All),
	car(attributes(_,doge,_,_),All),
	car(attributes(_,toyota,_,_),All),

	%truthful(T,False),
	%forall(member(P,T),
	%	corret(P,All)).
	%forall(member(P,T),
	%	talk(P,_,All)).

	/* check if the result is good*/
	forall(member(P,All),corret(P)),
	not_own(doc,toyota,All),
	not_own2(chevrolet,20,All),
	
	talk(attributes(tito,_,_,_),gas(attributes(doc,_,20,_)),All),
	
	talk(attributes(tito,_,_,_),better(attributes(george,T,G,_),attributes(jimmy,T1,G1,_),All)),
	
	talk(attributes(jimmy,_,_,_),better(attributes(tito,_,_,_),attributes(N,doge,_,_),All)),
	
	talk(attributes(george,_,_,_),gas(attributes(_,ford,30,_)),All),
	
	talk(attributes(doc,_,_,_),gas(attributes(doc,_,20,_)),All).

	