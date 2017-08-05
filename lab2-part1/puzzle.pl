house(X,[X,_,_,_,_]).
house(X,[_,X,_,_,_]).
house(X,[_,_,X,_,_]).
house(X,[_,_,_,X,_]).
house(X,[_,_,_,_,X]).

/* if X and Y are near by*/
next_to(X,Y,[X,Y,_,_,_]).
next_to(X,Y,[_,X,Y,_,_]).
next_to(X,Y,[_,_,X,Y,_]).
next_to(X,Y,[_,_,_,X,Y]).

next_to(X,Y,[Y,X,_,_,_]).
next_to(X,Y,[_,Y,X,_,_]).
next_to(X,Y,[_,_,Y,X,_]).
next_to(X,Y,[_,_,_,Y,X]).

/*X is left of Y*/
is_left(X,Y,[X,Y,_,_,_]).
is_left(X,Y,[_,X,Y,_,_]).
is_left(X,Y,[_,_,X,Y,_]).
is_left(X,Y,[_,_,_,X,Y]).

/*X is in the center*/
center(X,[_,_,X,_,_]).

/*X is the first house*/
first(X,[X,_,_,_,_]).

%attributes(Color,Nationality,Drink,Cigarette,Pet).

/*according to Einstin_s stories, we can get such facts as follow*/
fish_master(M):- 
	house(attributes(_,M,_,_,fish),A),
	house(attributes(red,english,_,_,_),A),
	house(attributes(_,swedish,_,_,dogs),A),
	house(attributes(_,dane,tea,_,_),A),
	house(attributes(red,english,_,_,_),A),
	is_left(attributes(green,_,_,_,_),attributes(white,_,_,_,_),A),
	house(attributes(green,_,coffee,_,_),A),
	house(attributes(_,_,_,pall_mall,birds),A),
	house(attributes(yellow,_,_,dunhill,_),A),
	center(attributes(_,_,milk,_,_),A),
	first(attributes(_,norwegian,_,_,_),A),
	next_to(attributes(_,_,_,blend,_),attributes(_,_,_,_,cats),A),
	next_to(attributes(_,_,_,_,horses),attributes(_,_,_,dunhill,_),A),
	house(attributes(_,_,beer,blue_master,_),A),
	house(attributes(_,german,_,prince,_),A),
	next_to(attributes(_,norwegian,_,_,_),attributes(blue,_,_,_,_),A),
	next_to(attributes(_,_,_,blend,_),attributes(_,_,water,_,_),A).

