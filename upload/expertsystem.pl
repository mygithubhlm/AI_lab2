%exist是根据用户的输入插入的事实。
:- dynamic
   exist/3.

%%%%%%%%%%%%%%%%%%%%%%% Introduce to this Expert System%%%%%%%%%%%%%%%%%%%%
introduce:-
	write("This expert system is a dress style recommended system."),nl,
	write("You will get some advice by using this system."),nl,
	write("Now, you can input:"),nl,
	write('[start]: to start'),nl,
	write('[end]: to exit'),nl.
%%%%%%%%%%%%%%%%%%%%%%% Judge the user‘s input %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%退出系统
handle(end) :-
	retractall(exist(_,_,_)),
	write('All information cleared! '),nl,!.
%进入系统
handle(start) :-
	match(R,_,_),
	write('Some suggestions about dressing: '),nl,
	write(R),nl,
	write('#############################################  我是分割线  #######################################################'),nl,
	write("Now, you have get some information about dressing, you can input more instructions to discover some interesting."),nl,
	write('[stars] : to find those stars who have similar figure with you.'),nl,
	write('[evaluate] : to get a evaluation about your figure.'),nl,
	write('[food] :  give you some suggestion about food according to your figure and BMI '),nl,
	write('[exercise] : to get some suggestions about physical exercise or keeping a good figure!'),nl,
	write('[end] : exit.'),nl,!.
%获取跟自己体型相似的一些明星
handle(stars) :-
	match(_,Stars,_),
	write('The following star(s) has/have samilar figure as you:  '),nl,
	write(Stars),nl,
	write('#############################################  我是分割线  #######################################################'),nl,
	write("Now, you have get some information about dressing, you can input more instructions to discover some interesting."),nl,
	write('[stars] : to find those stars who have similar figure with you.'),nl,
	write('[evaluate] : to get a evaluation about your figure.'),nl,
	write('[food] :  give you some suggestion about food according to your figure and BMI '),nl,
	write('[exercise] : to get some suggestions about physical exercise or keeping a good figure!'),nl,
	write('[end] : exit.'),nl,!.
%对该用户体型的一些评价
handle(evaluate) :- 
    match(_,_,Evaluate),
	write('Evaluation on your figure:  '),nl,
	write(Evaluate),nl,
	write('#############################################  我是分割线  #######################################################'),nl,
	write("Now, you have get some information about dressing, you can input more instructions to discover some interesting."),nl,
	write('[stars] : to find those stars who have similar figure with you.'),nl,
	write('[evaluate] : to get a evaluation about your figure.'),nl,
	write('[food] :  give you some suggestion about food according to your figure and BMI '),nl,
	write('[exercise] : to get some suggestions about physical exercise or keeping a good figure!'),nl,
	write('[end] : exit.'),nl,!.
%根据用户的信息，对该用户饮食方面提出的一些建议
handle(food) :-
	food_exercise(Food,_),
	write('Some suggestions about food:'),nl,
	write(Food),nl,
	write('#############################################  我是分割线  #######################################################'),nl,
	write("Now, you have get some information about dressing, you can input more instructions to discover some interesting."),nl,
	write('[stars] : to find those stars who have similar figure with you.'),nl,
	write('[evaluate] : to get a evaluation about your figure.'),nl,
	write('[food] :  give you some suggestion about food according to your figure and BMI '),nl,
	write('[exercise] : to get some suggestions about physical exercise or keeping a good figure!'),nl,
	write('[end] : exit.'),nl,!.
%根据用户的信息，对该用户健身方面提出的一些建议
handle(exercise) :- 
	food_exercise(_,Exercise),
	write('Some suggestions about exercise: '),nl,
	write(Exercise),nl,
	write('#############################################  我是分割线  #######################################################'),nl,
	write("Now, you have get some information about dressing, you can input more instructions to discover some interesting."),nl,
	write('[stars] : to find those stars who have similar figure with you.'),nl,
	write('[evaluate] : to get a evaluation about your figure.'),nl,
	write('[food] :  give you some suggestion about food according to your figure and BMI '),nl,
	write('[exercise] : to get some suggestions about physical exercise or keeping a good figure!'),nl,
	write('[end] : exit.'),nl,!.
%如果入户输入不合规范
handle(X) :-
	write(X),
	write(' is not a legal command.'), nl,
	fail.
%%%%%%%%%%%%%%%%%%%%%% The 5 questions resolved %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%已经问过的问题不能再次问，用插入事实的方式记住已经问过的问题。
%1，根据用户输入的信息,返回相应的穿衣建议
%2，查看自己的身材评价。
%3，了解了自身的特点并且得到穿衣的建议之后，如果感兴趣的话可以看看哪些明星跟该用户有相似的身材，
%4，根据得到的用户输入信息计算BMI指数并结合体型信息来为其推荐适合的食物种类。
%5，根据身材特点给出健身或者保持身材的建议。

%%%%%%%%%%%%%%%%%%%%%% What have user matched %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% When the user is male %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% when user‘s shoulders wider than buttocks%%%%%%%%%%%%%%%%%%%%
match(R,Stars,Evaluate):-
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(wider),
		   leg(straight),	   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are straight you can choose tight pants to make your legs looks longer and slim, you should not choose V-shaped collar clothes which will make your face much longer',
		   Stars = 'Benedict Cumberbatch（卷福), 胡歌',
		   Evaluate = 'I think you are in a good shape and on the top level, the long face and inverted triangle shape make you very attractive. Long face and inverted triangle shape are a perfect combination.you should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.

match(R,Stars,Evaluate):-
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(wider),  
		   leg(straight),   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are straight you can choose tight pants to make your legs looks longer and slim,you should not choose V-shaped collar clothes which will make your face much longer,you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler,and you may not choose brown color.',
		   Stars = '古天乐, 吴彦祖',
		   Evaluate = 'I think you are in a good shape and on the top level, your wheat-colored face looks healthy.Long face and inverted triangle shape are a perfect combination, the long face and inverted triangle shape make you very attractive. Long face and inverted triangle shape is a perfect combination. You should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.

match(R,Stars,Evaluate):-
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(wider),		   
		   leg(straight),
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '徐峥,林志颖,Orlando Bloom,王尼玛（如果头套算的话）',
		   Evaluate = 'I think you are in a good shape, the round face makes you look young and cute. Inverted triangle shape make you very attractive, round face and inverted triangle shape are a good combination you should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.

match(R,Stars,Evaluate):-
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(wider),
		   leg(straight),
		   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '张卫健，甄子丹,Johnny Depp(海盗)',
		   Evaluate = 'I think you are in a good shape, your wheat-colored face looks healthy, the round face makes you look young and cute, inverted triangle shape make you very attractive, you should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.
match(R,Stars,Evaluate):-
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(wider),		   
		   leg(straight),
		   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes.',
		   Stars = 'Leonardo DiCaprio（小李子），姚明,',
		   Evaluate = 'I think you are in a good shape, the square face makes you look solemn and moderate. inverted triangle shape make you very attractive, you should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.

match(R,Stars,Evaluate):- %%%%%%%%%%666666
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(wider),	   
		   leg(straight),
		   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes which will make your face longer,you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler,and you may not choose brown color.',
		   Stars = '周润发，金城武，鲁迅',
		   Evaluate = 'I think you are in a good shape,your wheat-colored face looks healthy, the square face makes you look solemn and moderate. inverted triangle shape make you very attractive, you should thanks your parents for this good figure and pay attention to maintain. Also, straight legs add extra points to your body.',
		   !.

%%%%%%when the legs are bend%%%%%%%%%%%%%%%%%%%%
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(wider),
		   leg(bend),
		   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should not choose V-shaped collar clothes which will make your face much longer.',
		   Stars = 'Benedict Cumberbatch（卷福), 胡歌',
		   Evaluate = 'I think you are in a good shape, the long face and inverted triangle shape make you very attractive and handsome. Long face and inverted triangle shape is a perfect combination. But bend legs are a small flaw.',
			!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(wider),		   
		   leg(bend),
	   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should not choose V-shaped collar clothes which will make your face much longer, you should choose warm or bright color clothes such as yellow,light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '古天乐, 吴彦祖',
		   Evaluate = 'I think you are in a good shape and on the top level, your wheat-colored face looks healthy, the long face and inverted triangle shape make you very attractive. Long face and inverted triangle shape is a perfect combination. You should thanks your parents for this good figure and pay attention to maintain. But bend legs are a small flaw.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(wider),
		   leg(bend),
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '徐峥,林志颖,Orlando Bloom,王尼玛（如果头套算的话）',
		   Evaluate = 'I think you are in a good shape, the round face makes you look young and cute. inverted triangle shape make you very attractive. Round face and inverted triangle shape is a good combination. You should thanks your parents for this good figure and pay attention to maintain. But bend legs are a small flaw.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(wider),
		   leg(bend),	   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '张卫健，甄子丹,Johnny Depp(海盗)',
		   Evaluate = 'I think you are in a good shape, your wheat-colored face looks healthy, the round face makes you look young and cute, inverted triangle shape make you very attractive. Round face and inverted triangle shape is a good combination. You should thanks your parents for this good figure and pay attention to maintain.But bend legs are a small flaw.',
		   !.
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(wider),
		   leg(bend),	   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = 'Leonardo DiCaprio（小李子），姚明',
		   Evaluate = 'I think you are in a good shape, the square face makes you look solemn and moderate. inverted triangle shape make you very attractive, you should thanks your parents for this good figure and pay attention to maintain. But bend legs are a small flaw.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(wider),	   
		   leg(bend),
		   
		   R = 'Your body is well-proportioned, and your choice space of dressing is very large. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '周润发，金城武，鲁迅',
		   Evaluate = 'I think you are in a good shape,your wheat-colored face looks healthy, the square face makes you look solemn and moderate. inverted triangle shape make you very attractive, you should thanks your parents for this good figure and pay attention to maintain. But bend legs are a small flaw.',
		   !.
%%%%%%%%%%%%%%%%%%%%% When the user‘s shoulders are narrower than buttocks
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(fat),	   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice. You can choose a little tight pants to make your legs looks longer and slim, you should not choose V-shaped collar clothes which will make your face much longer,',
		   Stars = 'Wentworth Miller(米帅),Jude Law',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):-
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(narrower),  
		   fat_and_thin(fat),   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice.You can choose a little tight pants to make your legs looks longer and slim, you should not choose V-shaped collar clothes which will make your face much longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '松山健一，Mario Maurer',
		   Evaluate = 'You may have a pear shaped proportion and your wheat-colored face looks healthy, this figure may be lack of symmetrical beauty but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(fat),
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice. You can choose a little tight pants to make your legs looks longer and slim, you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '鸟叔,（伟大的)金正恩(主席)',
		   Evaluate = 'You may have a pear shaped proportion and a round face make you younger and cuter, this figure may be lack of symmetrical beauty but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
			!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(fat),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice. You can choose a little tight pants to make your legs looks longer and slim, you should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '王刚,周杰,范伟',
		   Evaluate = 'You may have a pear shaped proportion and a round face make you younger and cuter, your wheat-colored face looks healthy. Your figure may be lack of symmetrical beauty, but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(fat),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice. square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose a little tight pants to make your legs looks longer and slim, you should choose V-shaped but not round collar clothes.',
		   Stars = 'Leonardo DiCaprio（小李子）, 姚明',
		   Evaluate = 'You may have a pear shaped proportion and a square face makes you look solemn and moderate, this figure may be lack of symmetrical beauty, but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- %%%%%%%%%%
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(fat),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose too wide or too large clothes just fit your body and slightly loose will be a good choice. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose a little tight pants to make your legs looks longer and slim, you should choose V-shaped but not round collar clothes which will make your face longer,you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler,and you may not choose brown color.',
		   Stars = '周润发，Robert Downey Jr',
		   Evaluate = 'You may have a pear shaped proportion and a square face makes you look solemn and moderate, your wheat-colored face looks healthy. Your figure may be lack of symmetrical beauty, but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

%%%%%% when the body is medium
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(medium),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should not choose V-shaped collar clothes which will make your face much longer.',
		   Stars = '胡歌,Nicolas Cage',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your long face makes you have a handsome appearence.  This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(medium),
	   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. you should not choose V-shaped collar clothes which will make your face much longer,you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler,and you may not choose brown color.',
		   Stars = '于震，何润东',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your long face makes you have a handsome appearence, your wheat-colored face looks healthy. This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   	!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(medium),
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. 		   		
		   		you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '张国荣，林志颖，Orlando Bloom',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your round face makes you look young and cute.  This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(medium),   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. you should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '张卫健，甄子丹,Johnny Depp(海盗)',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your round face makes you look young and cute, your wheat-colored face looks healthy. This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.


match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(medium),	   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat.you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = 'Leonardo DiCaprio（小李子），姚明',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your square face makes you look solemn and moderate. This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(medium),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat.you should choose V-shaped but not round collar clothes which will make your face longer.you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '周润发，金城武，鲁迅',
		   Evaluate = 'You may have a pear shaped proportion and you have a fit body and your square face makes you look solemn and moderate, your wheat-colored face looks healthy. This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

%%%%%%%%%%% When the body is thin 	
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(thin),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. you should not choose V-shaped collar clothes which will make your face much longer.You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = 'Adrien Brody(海上钢琴师）,Keanu Reeves(黑客)',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   	!.


match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(thin),
	   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. you should not choose V-shaped collar clothes which will make your face much longer,you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler,and you may not choose brown color.You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = '古天乐, 吴彦祖',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your wheat-colored face looks healthy. Your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(thin),
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. you should choose V-shaped but not round collar clothes which will make your face longer.You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = '林志颖，鹿晗',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your round face make you younger and cuter. Your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(thin), 
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. You should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color. You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = '佟大为, 张卫健',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your wheat-colored face looks healthy. Your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   !.


match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(narrower),
		   fat_and_thin(thin),	   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You should choose V-shaped but not round collar clothes which will make your face longer. You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = '周润发，金城武，鲁迅',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your square face makes you look solemn and moderate. Your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(narrower),		   
		   fat_and_thin(thin),
		   
		   R = 'You may have a pear shaped proportion, and you can choose single-breasted suit or botton typed clothes, but you should not wear Polo shirt or narrow shoulders clothes. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color. You may not choose too tight pants or coat, and you can try cross stripe clothes. When you wear a suit you should better choose wide tie.',
		   Stars = '周润发，金城武，鲁迅',
		   Evaluate = 'You may have a pear shaped proportion and you have a thin body, your square face makes you look solemn and moderate. Your chest and shoulders are narrower than the hips, which means your lower body is relatively large. so this figure makes you look slim and weak.',
		   !.
%%%%%%%%%%%%%%%%%%%%% When the user‘s shoulders and buttocks are equal
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(equal),
		   tall_and_short(tall),
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should not choose V-shaped collar clothes which will make your face much longer',
		   Stars = 'Benedict Cumberbatch（卷福),刘翔',
		   Evaluate = 'You have a rectangular proportion and you are tall, your long face is a kind of handsome face shape. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(equal),  
		   tall_and_short(tall),
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should not choose V-shaped collar clothes which will make your face much longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = 'Jean Reno(杀手）,古天乐, 吴彦祖',
		   Evaluate = 'You have a rectangular proportion and you are tall, your long face is a kind of handsome face shape. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(equal),		   
		   tall_and_short(tall),
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = 'Orlando Bloom，田亮',
		   Evaluate = 'You have a rectangular proportion and you are tall, your round face make you younger and cuter. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(equal),
		   tall_and_short(tall),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '张卫健，孙红雷',
		   Evaluate = 'You have a rectangular proportion and you are tall, your round face make you younger and cuter. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(equal),		  
		   tall_and_short(tall),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose cross stripe coat and thin belt to make your body symmetry. You should choose V-shaped but not round collar clothes.',
		   Stars = 'Robert Pattinson,姚明,',
		   Evaluate = 'You have a rectangular proportion and you are tall, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- %%%%%%%%%%
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(equal),		   
		   tall_and_short(tall),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose cross stripe coat and thin belt to make your body symmetry. you should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '周润发，金城武',
		   Evaluate = 'You have a rectangular proportion and you are tall, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

%%%%%%when the height is medium
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(equal),
		   tall_and_short(medium),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should not choose V-shaped collar clothes which will make your face much longer.',
		   Stars = '王力宏，Kamenashi Kazuya',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your long face makes you handsome. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(equal),		   
		   tall_and_short(medium),
	   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should not choose V-shaped collar clothes which will make your face much longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '吴彦祖，李咏',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your long face makes you handsome. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(equal),
		   tall_and_short(medium),
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '林志颖,张国荣，Orlando',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your round face makes you look young and cute . Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):-
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(equal),
		   tall_and_short(medium),   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose cross stripe coat and thin belt to make your body symmetry. You should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '徐峥,甄子丹,Johnny Depp(海盗)',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your round face makes you look young and cute . Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.


match(R,Stars,Evaluate):-
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(equal),
		   tall_and_short(medium),	   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose cross stripe coat and thin belt to make your body symmetry. You should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = 'Leonardo DiCaprio（小李子）',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(equal),		   
		   tall_and_short(medium),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. You can choose cross stripe coat and thin belt to make your body symmetry. you should choose V-shaped but not round collar clothes which will make your face longer. you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '金城武，鲁迅',
		   Evaluate = 'You have a rectangular proportion and your figure is in the majority, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

%%%%%%%%%%% When the body is short 	
match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(long),
		   shoulder_and_buttocks(equal),
		   tall_and_short(short),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. You can choose vertial striped clothes and thin belt to make your body symmetry. You should not choose V-shaped collar clothes which will make your face much longer and your shoulders more narrower, long sleeved clothes are more suitable for you.',
		   Stars = '郭敬明，刘谦',
		   Evaluate = 'You have a rectangular proportion. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(long),
		   shoulder_and_buttocks(equal),	   
		   tall_and_short(short),
	   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should not choose V-shaped collar clothes which will make your face much longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '撒贝宁，梁朝伟',
		   Evaluate = 'You have a rectangular proportion. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(round),
		   shoulder_and_buttocks(equal),
		   tall_and_short(short),
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = '王祖蓝，Takizawa Hideaki',
		   Evaluate = 'You have a rectangular proportion, your round face makes you younger and cuter. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(round),
		   shoulder_and_buttocks(equal),
		   tall_and_short(short), 
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Because your legs are straight you can choose tight pants to make your legs looks longer and slim，you should choose V-shaped but not round collar clothes which will make your face longer, you should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '潘长江，王宝强',
		   Evaluate = 'You have a rectangular proportion, your round face makes you younger and cuter. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.


match(R,Stars,Evaluate):- 
		   gender(male),
		   color(white),
		   face(square),
		   shoulder_and_buttocks(equal),
		   tall_and_short(short),	   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer.',
		   Stars = 'Tom Cruise，陈奕迅',
		   Evaluate = 'You have a rectangular proportion, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   		!.

match(R,Stars,Evaluate):- 
		   gender(male),
		   color(wheat),
		   face(square),
		   shoulder_and_buttocks(equal),		   
		   tall_and_short(short),
		   
		   R = 'You have a rectangular proportion, and you may choose stand-up collor coat or wear scarf, but you may not wear double breasted suit or printed rectangular pattern T-shirt. Square face makes you look mature, intelligent and easy to dress up elegently, but your bangs may not be too neat. Because your legs are bend you should not choose too tight pants to hide your bend legs, you should choose V-shaped but not round collar clothes which will make your face longer. You should choose warm or bright color clothes such as yellow light blue to make you looks brighter and cooler, and you may not choose brown color.',
		   Stars = '鲁迅，李连杰',
		   Evaluate = 'You have a rectangular proportion, your square face makes you look solemn and moderate. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. Although you are smaller in size but also should be confident enough to be neither humble nor pushy. If you can make the chest muscle more fullness by exercising, the body will be more beautiful.',
		   !.	
%%%%%%%%%%%%%%%%%%%%%%%%%% when the user is female %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%																		        %
%																		        %
%%%%%%%%%%%%%% when user is not fat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% when user‘s shoulders wider than buttocks%%%%%%%%%%%%%%%%%%%%%%%%%

match(R,Stars,Evaluate):-
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(nfat),
		   shoulder_and_buttocks(wider),   
		   
		   R = 'You should avoid wearing short dresses and small collar clothes, because that will make your shoulder wider, your neck shorter and face greater. Big V collar is the best style for you. You can try same color clothes and straight jacket, your shirt sleeves should not too fat. Don’t wear texture hard skirt which looks bloated.',
		   Stars = 'Emilia Clarke（龙母），夏琳王妃，高圆圆',
		   Evaluate = 'You are not fat and you have wider shoulders which means you have queen style. So you can be very confident of your body, and your figure is the type of most men like. Congratulations! But you should pay attention to your big face and take care in choosing clothes. ',
		   !.

match(R,Stars,Evaluate):-
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(nfat),		   
		   shoulder_and_buttocks(wider),  
		   
		   R = 'Your wheat-color skin is not appropriate for dark brown and pure black color. You should avoid wearing short dresses and small collar clothes, because that will make your shoulder wider, your neck shorter and face greater. Big V collar is the best style for you. You can try same color clothes and straight jacket, your shirt sleeves should not too fat. Don’t wear texture hard skirt which looks bloated.',
		   Stars = '钟缇丽，巩俐',
		   Evaluate = 'You are not fat and you have wider shoulders which means you have queen style. So you can be very confident of your body, and your figure is the type of most men like. Congratulations! But you should pay attention to your big face and your wheat-color skin and take care in choosing clothes.',

		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(nfat),   
		   shoulder_and_buttocks(wider),
		   
		   R = 'You should avoid wearing short dresses and small collar clothes, because that will make your shoulder wider, your neck shorter.You can take a variety of material scarfs according to the weather, because scarf can make the face layer rich and shoulders shorter. You can choose sweater which designed off-the-shoulders.',
		   Stars = '张雨绮，李多喜',
		   Evaluate = 'You are not fat and you have wider shoulders which means you have queen style, more inportantly, you have a small face which make you cute and lovely. So you can be very confident of your body, and your figure is the type of most men like. Congratulations! ',
			!.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(nfat),
		   shoulder_and_buttocks(wider),		   
	   
		   R = 'Your wheat-color skin is not appropriate for dark brown and pure black color. You should avoid wearing short dresses and small collar clothes, because that will make your shoulder wider, your neck shorter.You can take a variety of material scarfs according to the weather, because scarf can make the face layer rich and shoulders shorter. You can choose sweater which designed off-the-shoulders.',
		   Stars = '章子怡，周迅',
		   Evaluate = 'You are not fat and you have wider shoulders which means you have queen style, more inportantly, you have a small face which make you cute and lovely. So you can be very confident of your body, and your figure is the type of most men like. Congratulations! But you should pay attention to your wheat-color skin and take care in choosing clothes.',
		   !.


%%%%%%%%%%%%%%%%%%%%% When the user‘s shoulders are narrower than buttocks
match(R,Stars,Evaluate):-
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(nfat),
		   shoulder_and_buttocks(narrower),	   
		   R = 'You can choose V-shaped collar shirt to make your face smaller. When you choosing clothes you should pay attention to hide your fat lower body and outstand your upper body. You can choose loose shirt which can cinch you in at the waist. Avoid tight clothes which will make your upper body smaller. And do not wearing tight pencil pants. ',
		   Stars = '唐嫣，杨蓉',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it is cute for a girl who is not fat. Many boys like pear-shaped figure jusk like you have. But you should be careful not to outstand your big face.',
		   !.

match(R,Stars,Evaluate):-
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(nfat),
		   shoulder_and_buttocks(narrower),     
		   R = 'Your wheat-color skin is not appropriate for dark brown and pure black color. You can choose V-shaped collar shirt to make your face smaller. When you choosing clothes you should pay attention to hide your fat lower body and outstand your upper body. You can choose loose shirt which can cinch you in at the waist. Avoid tight clothes which will make your upper body smaller. And do not wearing tight pencil pants. ',
		   Stars = '秦岚，张可颐，',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it is cute for a girl who is not fat. Many boys like pear-shaped figure jusk like you have. But you should be careful not to outstand your big face.',
		   !.


match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(nfat),
		   shoulder_and_buttocks(narrower),
		   
		   R = 'When you choosing clothes you should pay attention to hide your fat lower body and outstand your upper body. You can choose loose shirt which can cinch you in at the waist. Avoid tight clothes which will make your upper body smaller. And do not wearing tight pencil pants. ',
		   Stars = '刘亦菲，刘若英',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it is cute for a girl who is not fat. Many boys like pear-shaped figure jusk like you have. ',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(nfat),
		   shoulder_and_buttocks(narrower),		   
	   
		   R = 'When you choosing clothes you should pay attention to hide your fat lower body and outstand your upper body. You can choose loose shirt which can cinch you in at the waist. Avoid tight clothes which will make your upper body smaller. And do not wearing tight pencil pants. ',
		   Stars = '汤唯，陈妍希',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it is cute for a girl who is not fat. Many boys like pear-shaped figure jusk like you have. ',
		   	!.


%%%%%%%%%%%%%%%%%%%%% When the user‘s shoulders and buttocks are equal
match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(nfat),
		   shoulder_and_buttocks(equal),
		   R = 'Your body is well symmetrically. Don‘t choose double breasted coat and sportswear, you should choose V shaped collar shirt. Lower body can choose A shaped skirt or round skirt which can show the fullness of the hip. Tight dress with a belt around the waist is also a good choice. But you should avoid tight jeans.',
		   Stars = '倪妮，王鸥',
		   Evaluate = 'You figure is just like rectangular, chest and buttocks both are not prominent, but it is said to be one of the most common (45%) figure of women. And this figure is the easiest to choose clothes, body proportion is also harmonious. But you should be careful not to outstand your big face.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(nfat),
		   shoulder_and_buttocks(equal),  
		   R = 'Your wheat-color skin is not appropriate for dark brown and pure black color. Your body is well symmetrically. Don‘t choose double breasted coat and sportswear, you should choose V shaped collar shirt. Lower body can choose A shaped skirt or round skirt which can show the fullness of the hip. Tight dress with a belt around the waist is also a good choice. But you should avoid tight jeans.',
		   Stars = '谢娜，宁静',
		   Evaluate = 'You figure is just like rectangular, chest and buttocks both are not prominent, but it is said to be one of the most common (45%) figure of women. And this figure is the easiest to choose clothes, body proportion is also harmonious. But you should be careful not to outstand your big face and wheat-color skin.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(nfat),
		   shoulder_and_buttocks(equal),
		   
		   R = 'You can take a variety of material scarfs according to the weather, because scarf can make the face layer rich.Don‘t choose double breasted coat and sportswear, you should choose V shaped collar shirt. Lower body can choose A shaped skirt or round skirt which can show the fullness of the hip. Tight dress with a belt around the waist is also a good choice. But you should avoid tight jeans.',
		   Stars = 'Angelababy,周冬雨',
		   Evaluate = 'You figure is just like rectangular, chest and buttocks both are not prominent, but it is said to be one of the most common (45%) figure of women. And this figure is the easiest to choose clothes, body proportion is also harmonious.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(nfat),
		   shoulder_and_buttocks(equal),		   
	   
		   R = 'Your wheat-color skin is not appropriate for dark brown and pure black color. You can take a variety of material scarfs according to the weather, because scarf can make the face layer rich.Don‘t choose double breasted coat and sportswear, you should choose V shaped collar shirt. Lower body can choose A shaped skirt or round skirt which can show the fullness of the hip. Tight dress with a belt around the waist is also a good choice. But you should avoid tight jeans.',
		   Stars = '朱茵，王璐丹',
		   Evaluate = 'You figure is just like rectangular, chest and buttocks both are not prominent, but it is said to be one of the most common (45%) figure of women. And this figure is the easiest to choose clothes, body proportion is also harmonious. But you should be careful not to outstand your wheat-color skin.',
		   !.

%%%%%%%%%%%%%% when user is fat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% when user‘s upper body is fat obviously %%%%%%%%%%%%%%%%%%%%%%

match(R,Stars,Evaluate):-
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(fat),
		   where_fat(upper),
		   
		   R = 'The upper body fat girl should better not to choose a small collar shirt which wrapped the upper body in clothes having a swelling effect. Threre will be a sliming effect in visual by choosing big collar coat or big coat and also that will make your face look smaller. Select a V-shaped collar shirt having a gentle, sexy feeling and let the clavicle was exposed to a proper extent. And dark color clothes is suitable for fat girl.',
		   Stars = '赵薇，张馨予',
		   Evaluate = 'You are a little fat and you have a big face, maybe the overall size of the upper wide and lower narrow in visual, arm and waist are slightly thick, hips and legs were significantly thin. This figure is strong in visual, so you should have a balance diet and do some exercise.',
		   !.

match(R,Stars,Evaluate):-
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(fat),		   
		   where_fat(upper), 
		   
		   R = 'Your wheat-color skin is not appropriate for dark brown color clothes. The upper body fat girl should better not to choose a small collar shirt which wrapped the upper body in clothes having a swelling effect. Threre will be a sliming effect in visual by choosing big collar coat or big coat and also that will make your face look smaller. Select a V-shaped collar shirt having a gentle, sexy feeling and let the clavicle was exposed to a proper extent. And dark color clothes is suitable for fat girl.',
		   Stars = '韩红',
		   Evaluate = 'You are a little fat, you have a big face and you have wheat-color skin which looks healthy. Maybe the overall size of the upper wide and lower narrow in visual, arm and waist are slightly thick, hips and legs were significantly thin. This figure is strong in visual, so you should have a balance diet and do some exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(fat),   
		   where_fat(upper),
		   
		   R = 'The upper body fat girl should better not to choose a small collar shirt which wrapped the upper body in clothes having a swelling effect. Threre will be a sliming effect in visual by choosing big collar coat or big coat. Select a V-shaped collar shirt having a gentle, sexy feeling and let the clavicle was exposed to a proper extent. And dark color clothes is suitable for fat girl.',
		   Stars = '黄奕',
		   Evaluate = 'You are a little fat and maybe the overall size of the upper wide and lower narrow in visual, arm and waist are slightly thick, hips and legs were significantly thin. This figure is strong in visual, so you should have a balance diet and do some exercise.',
			!.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(fat),
		   where_fat(upper),		   
	   
		   R = 'Your wheat-color skin is not appropriate for dark brown color clothes. The upper body fat girl should better not to choose a small collar shirt which wrapped the upper body in clothes having a swelling effect. Threre will be a sliming effect in visual by choosing big collar coat or big coat. Select a V-shaped collar shirt having a gentle, sexy feeling and let the clavicle was exposed to a proper extent. And dark color clothes is suitable for fat girl.',
		   Stars = '张惠妹',
		   Evaluate = 'You are a little fat and you have wheat-color skin which looks healthy. Maybe the overall size of the upper wide and lower narrow in visual, arm and waist are slightly thick, hips and legs were significantly thin. This figure is strong in visual, so you should have a balance diet and do some exercise.',
		   !.


%%%%%%%%%%%%%% when user‘s lower body is fat obviously %%%%%%%%%%%%%%%%%%%%%%
match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(fat),
		   where_fat(lower),
		   	   
		   R = 'Hips or thighs are fat, you should cover the fat part of body as far as possible in the choice of clothes, A-line skirt or longuette both can hide your fat hips and thighs. Threre will be a sliming effect in visual by choosing big collar coat to make your face smaller.',
		   Stars = 'Kate Winslet，Adele',
		   Evaluate = 'You may have a pear shaped proportion, this figure may be lack of symmetrical beauty but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):-
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(fat),
		   where_fat(lower),
		   R = 'Your wheat-color skin is not appropriate for dark brown color clothes. Hips or thighs are fat, you should cover the fat part of body as far as possible in the choice of clothes, A-line skirt or longuette both can hide your fat hips and thighs. Threre will be a sliming effect in visual by choosing big collar coat to make your face smaller.',
		   Stars = 'Kim Kardashian，吴昕',
		   Evaluate = 'You may have a pear shaped proportion and your wheat-colored face looks healthy, this figure may be lack of symmetrical beauty but it has a stocky beauty. But you should pay attention to your weight, if you are too fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.


match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(fat),
		   where_fat(lower),
		   
		   R = 'Hips or thighs are fat, you should cover the fat part of body as far as possible in the choice of clothes, A-line skirt or longuette both can hide your fat hips and thighs. And dark color clothes is suitable for fat girl.',
		   Stars = '何洁，邓紫棋',
		   Evaluate = 'You may have a pear shaped proportion and your small face makes you have a cute and lovely appearence.  This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(fat),
		   where_fat(lower),	   
	   
		   R = 'Your wheat-color skin is not appropriate for dark brown color clothes. Hips or thighs are fat, you should cover the fat part of body as far as possible in the choice of clothes, A-line skirt or longuette both can hide your fat hips and thighs. And dark color clothes is suitable for fat girl.',
		   Stars = '周迅',
		   Evaluate = 'You may have a pear shaped proportion and your small face makes you have a cute and lovely appearence, your wheat-colored face looks healthy. This figure make you have a stocky beauty, but you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.


%%%%%%%%%%%%%% when user‘s body is fat evenly %%%%%%%%%%%%%%%%%%%%%%
match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(big),
		   female_weight(fat),
		   where_fat(even),
		   R = 'Fat girl mostly have a double chin and thick and a little short neck, so in the choice of clothes, you should avoid high collar and you can choose V shaped collar to which can lengthen the neck. The pure color and slightly loose clothes is suitable for plump girls. ',
		   Stars = 'Kat Dennings',
		   Evaluate = 'You have a fat but symmetrical proportion. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. But you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(big),
		   female_weight(fat),
		   where_fat(even),
		   R = 'Fat girl mostly have a double chin and thick and a little short neck, so in the choice of clothes, you should avoid high collar and you can choose V shaped collar to which can lengthen the neck. The pure color and slightly loose clothes is suitable for plump girls. But your wheat-color skin is not appropriate for dark brown color clothes. ',
		   Stars = '李湘，沈殿霞',
		   Evaluate = 'You have a fat but symmetrical proportion, you have wheat-color skin which is not very attractive but healthy. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. But you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(white),
		   face_size(nbig),
		   female_weight(fat),
		   where_fat(even),
		   
		   R = 'Fat girl mostly have a double chin and thick and a little short neck, so in the choice of clothes, you should avoid high collar and you can choose V shaped collar to which can lengthen the neck. The pure color and slightly loose clothes is suitable for plump girls. You can choose V-shaped collar clothes to make your face smaller.',
		   Stars = '徐熙媛，蒋欣，',
		   Evaluate = 'You have a fat but symmetrical proportion, your face is small which is cute. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. But you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.

match(R,Stars,Evaluate):- 
		   gender(female),
		   color(wheat),
		   face_size(nbig),
		   female_weight(fat),
		   where_fat(even),		   
	   
		   R = 'Fat girl mostly have a double chin and thick and a little short neck, so in the choice of clothes, you should avoid high collar and you can choose V shaped collar to which can lengthen the neck. The pure color and slightly loose clothes is suitable for plump girls.You can choose V-shaped collar clothes to make your face smaller. But your wheat-color skin is not appropriate for dark brown color clothes. ',
		   Stars = '汤唯，陈妍希',
		   Evaluate = 'You have a fat but symmetrical proportion, your face is small which is cute. You have wheat-color skin which is not very attractive but healthy. Your chest and shoulders are almost as wide as the hips, which means your body looks more symmetrical. But you should pay attention to your weight, if you are getting fat, you will loss the beauty and become bloated. So you need a balance diet and some taking exercise.',
		   !.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%																		   %
%			 Some suggestions about food or body building				   %
%																		   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Suggestions about foods and exercise %%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% 当用户为男生并且是倒三角型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(male),
			shoulder_and_buttocks(wider),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = 'As a man with innate inverted triangle shaped body, you have a lot of advantages in body building. You just need to exercise a little, the effect will be very obvious. You can exercise your abdominal muscle by running, sit-up and exercise your pectoral by supine and push barbell up（平卧推举）、上斜推举、平卧飞鸟、仰卧直臂上拉. '.
%%%%%%%%%%%%%%% 当用户为男生并且是矩形身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(male),
			shoulder_and_buttocks(equal),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的身材上下比较匀称，这种体型的人所占比例应该是最多的。全身没有突出的脂肪和肌肉，穿起衣服看起来形状非常不错，但是脱下衣服就是类似水桶型身材。所以在训练时需要注意两点：1.减脂，2.增肌。减脂训练目的是为了将体脂降到令自己满意的程度，其中最重要的地方就是胸部和腹部，这两个部位的脂肪必须降到一个很客观的程度。增肌训练自然是为了让自己的身材凹凸有致，胸肌突出，腹部收紧并且腹肌凸显。至于手臂、肩膀、腿部等部位，所以想要达到比较理想的效果你可能需要比较均匀的锻炼身上的肌肉。'.
%%%%%%%%%%%%%%% 当用户为男生并且是梨型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(male),
			shoulder_and_buttocks(narrower),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的这种肩膀窄，臀部宽的身材是一种梨形身材，这种身材的男生在健身中不占优势，你需要注意锻炼上身的肌肉来使得身体比较平衡，因此你可能要多注意锻炼肱二头肌，三角肌，胸肌。推荐的健身动作有：推举、侧平举、俯身侧平举、耸肩、前锯肌转腰、旋转举腿等。'.
%%%%%%%%%%%%%%% 当用户为女生并且是倒三角型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(nfat),
			shoulder_and_buttocks(wider),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '作为一个天生具有倒三角型身材的女生，你在健身方面有很多的优势，与其他体型相比，你锻炼出来效果相对比较容易。但是作为女生来讲，太宽的肩膀往往容易失去协调性，所以你可以把重点放在腹肌的锻炼上，这样可以在瘦腰的同时保持身体的协调性以及美感。推荐的健身方法是坚持跑步，或者通过仰卧起坐的方式锻炼腹肌。'.
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(nfat),
			shoulder_and_buttocks(equal),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的身材上下比较匀称，这种体型的人所占比例应该是最多的。全身没有突出的脂肪和肌肉，穿起衣服看起来形状很不错，但是脱下衣服就是类似水桶型身材，没有比较突出的地方,所以在训练的时候需要注意两点：1.减脂，2.增肌。减脂训练目的是为了将体脂降到令自己满意的程度，其中最重要的地方就是胸部和腹部，这两个部位的脂肪必须降到一个很客观的程度。增肌训练自然是为了让自己的身材凹凸有致，胸肌突出，腹部收紧并且腹肌凸显。至于手臂、肩膀、腿部等部位，所以想要达到比较理想的效果你可能需要比较均匀的锻炼身上的肌肉。跑步是一种减脂不增肌的锻炼方式，对于你这种体型女生来讲比较合适。'.

food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(nfat),
			shoulder_and_buttocks(narrower),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的这种肩膀窄，臀部宽的身材是一种梨形身材，对于女生来讲，这种身材可能看上去比较小巧可爱，但这种身材协调性较差而且看上去溜肩，如果你想要通过健身来改变改变身体的比例的话，你需要注意锻炼上身的肌肉来使得身体比较平衡，因此你可能要多注意锻炼肱二头肌，三角肌，胸肌。推荐的健身动作有：推举、侧平举、俯身侧平举、耸肩、前锯肌转腰、旋转举腿等。而如果你想要瘦臀的话，可以通过每天坚持跑步的方式来减少臀部多余的赘肉。'.
%%%%%%%%%%%%%%% 当用户为女生并且是倒三角型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(fat),
			shoulder_and_buttocks(wider),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '作为一个天生具有倒三角型身材的女生，你在健身方面有很多的优势，与其他体型相比，你锻炼出来效果相对比较容易。但是作为女生来讲，太宽的肩膀往往容易失去协调性，所以你可以把重点放在腹肌的锻炼上，这样可以在瘦腰的同时保持身体的协调性以及美感。推荐的健身方法是坚持跑步，或者通过仰卧起坐的方式锻炼腹肌。'.
%%%%%%%%%%%%%%% 当用户为女生并且是矩形型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(fat),
			shoulder_and_buttocks(equal),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的身材上下比较匀称，这种体型的人所占比例应该是最多的。全身没有突出的脂肪和肌肉，穿起衣服看起来形状很不错，但是脱下衣服就是类似水桶型身材，没有比较突出的地方,所以在训练的时候需要注意两点：1.减脂，2.增肌。减脂训练目的是为了将体脂降到令自己满意的程度，其中最重要的地方就是胸部和腹部，这两个部位的脂肪必须降到一个很客观的程度。增肌训练自然是为了让自己的身材凹凸有致，胸肌突出，腹部收紧并且腹肌凸显。至于手臂、肩膀、腿部等部位，所以想要达到比较理想的效果你可能需要比较均匀的锻炼身上的肌肉。跑步是一种减脂不增肌的锻炼方式，对于你这种体型女生来讲比较合适。'.

%%%%%%%%%%%%%%% 当用户为女生并且是梨型身材时
food_exercise(Food,Exercise):-
			get_height(H),
			get_weight(W),
			gender(female),
			female_weight(nfat),
			shoulder_and_buttocks(narrower),
			Value is W / (H * H),
			((Value < 18.5
			 -> 
			 Food = 'Your BMI is lower than 18.5 that means your body is thin, so you should adjust your eating habits to increase the body weight gain appropriatly. Breakfast is very important, there must be enough protein and carbohydrates, so breakfast should be recommended to have soybean milk and eggs. Eat a little more for lunch, recommended to have two bowls of rice, a chicken steak and a bowl of soup. Dinner and lunch are almost same and you also can change the chicken steak by fish. If necessary, you can add a midnight snack.'
			 );
			(Value >= 25
			 -> 
			 write(Value),nl,
			 Food = 'Your BMI is higher than 25 that means your body is fat, so you should keep a balance diet. Even if you are dieting, you should also eat breakfast, because breakfast is very important. You can eat a little more at breakfast, recommended a glass of milk, an egg and one or two steamed stuffed buns. Lunch should has 100 gram rice, one or two meat dishes and one or two vegetable dishes. Dinner should has a vegetable dish, a piece of chicken and a cup of porrige. Midnight snack is not recommended, if you are hungry, you can eat some fruit. '
			 );
			(Value >= 18.5,Value < 25
			 -> 
			 Food = 'Your BMI is higher than 18.5 and lower than 25, that means your body is perfect, but you also should keep a good eating habit. Staying in shape continues to be a balancing act between calories and activity. A good energy intake ratio of three meals is 3: 4: 3. '
			 )),
			 Exercise = '你的这种肩膀窄，臀部宽的身材是一种梨形身材，对于女生来讲，这种身材可能看上去比较小巧可爱，但这种身材协调性较差而且看上去溜肩，如果你想要通过健身来改变改变身体的比例的话，你需要注意锻炼上身的肌肉来使得身体比较平衡，因此你可能要多注意锻炼肱二头肌，三角肌，胸肌。推荐的健身动作有：推举、侧平举、俯身侧平举、耸肩、前锯肌转腰、旋转举腿等。而如果你想要瘦臀的话，可以通过每天坚持跑步的方式来减少臀部多余的赘肉。'.
%%%%%%%%%%%%%%%%%%%%%% Hint to user %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hint(X,Menu,Type):- 
			write('ANSWER:'),
			write(Menu),nl,
			write('Please input your answer :'),read(Y),nl,
			check_input(Y,X,Menu,Type),
			asserta(exist(yes,Type,Y)),%remeber user‘s input if the input is valid.
			Y == X.

hint2(X,Type):- 
			read(Y),nl,
			check_input2(Y,Type),
			asserta(exist(yes,Type,Y)),%remeber user‘s input if the input is valid.
			X = Y.

%%%%%%%%%%%%%%%%%%%%%% Check uesr‘s input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
check_input(Y,_,Menu,_):-
			member(Y,Menu),!.

check_input(Y,X,Menu,Type):-
			write(Y),write(' is not a valid input,please try again!'),nl,
			hint(X,Menu,Type).

check_input2(Y,_):-
			Y > 0,
			Y < 200.
			/*((Y < 0,
			 write(Y),
			 write(' is not valid, please try again!'),nl,
			 hint3(Y,Type),
			 write('Now Y is: '),
			 write(Y),nl
			 );
			(Y > 0)).*/
%%%%%%%%%%%%%%%%%%%%%% The types %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% 需要问用户的问题 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%性别
gender(X):- judge_exist(gender,X).
%gender(X):- judege_type_exist(gender),fail,nl,!.
gender(X):- not(judege_type_exist(gender)),
			explain_gender,
			hint(X,[male,female],gender).
			
%肩膀是否比臀部宽
shoulder_and_buttocks(X):- judge_exist(shoulder_and_buttocks,X).
shoulder_and_buttocks(X):- not(judege_type_exist(shoulder_and_buttocks)),
						   explain_shoulder_and_buttocks,
						   hint(X,[wider,equal,narrower],shoulder_and_buttocks).

%是胖还是瘦
fat_and_thin(X):- judge_exist(fat_and_thin,X).	
fat_and_thin(X):- not(judege_type_exist(fat_and_thin)),				   
				  explain_fat_and_thin,
				  hint(X,[fat,medium,thin],fat_and_thin).

%女生胖还是不胖
female_weight(X):- judge_exist(female_weight,X).	
female_weight(X):- not(judege_type_exist(female_weight)),				   
				   explain_female_weight,
				   hint(X,[fat,nfat],female_weight).

%身体的那一部分比较胖
where_fat(X):- judge_exist(where_fat,X).
where_fat(X):-  not(judege_type_exist(where_fat)),
				explain_where_fat,
			    hint(X,[upper,even,lower],where_fat).		  

%高还是矮
tall_and_short(X):- judge_exist(tall_and_short,X).
tall_and_short(X):- not(judege_type_exist(tall_and_short)),
					explain_height,
				    hint(X,[tall,medium,short],tall_and_short).

%脸型是什么样
face(X):- judge_exist(face,X).
face(X):- not(judege_type_exist(face)),
		  explain_face,
		  hint(X,[long,round,square],face).

%脸的大小
face_size(X):- judge_exist(face_size,X).
face_size(X):- not(judege_type_exist(face_size)),
			   explain_face_size,
			   hint(X,[big,nbig],face_size).

%肤色
color(X):- judge_exist(color,X).
color(X):- not(judege_type_exist(color)),
		   explain_color,
		   hint(X,[white, wheat],color).

%腿是直的还是弯的
leg(X):- judge_exist(leg,X).
leg(X):- not(judege_type_exist(leg)),
		 explain_leg,
		 hint(X,[straight,bend],leg).

buttocks(X):- judge_exist(bottocks,X).
buttocks(X):- not(judege_type_exist(buttocks)),
			  explain_buttocks,
			  hint(X,[chubby,flat],buttocks).

%大胸还是小胸
brest(X):- judge_exist(brest,X).
brest(X):- not(judege_type_exist(brest)),
		   explain_brest,
		   hint(X,[big, nbig],brest).

%获取用户的身高信息
get_height(H):- judge_exist(get_height,H).
get_height(H):- not(judege_type_exist(get_height)),
				explain_get_height,
				(hint2(H,get_height);
				(get_height(H))).

%获取用户的体重信息
get_weight(H):- judge_exist(get_weight,H).
get_weight(H):- not(judege_type_exist(get_weight)),
				explain_get_weight,
				(hint2(H,get_weight);
				(get_weight(H))).
%%%%%%%%%%%%%%%%%%%%%% Explain %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
explain_gender:- write('QUESTION: Whats your gender?'),nl.
explain_shoulder_and_buttocks:- write('QUESTION: Your shoulders wider than your buttocks ?'),nl.
explain_fat_and_thin:- write('QUESTION: Your body is fat, medium or thin ?'),nl.
explain_buttocks:- write('QUESTION: Your buttocks are fat ,medium or thin?'),nl.
explain_leg:- write('QUESTION: Your legs are straight or bend?'),nl.
explain_height:- write('QUESTION: Your height is tall(more than 175), medium or short(less than 160)?'),nl.
explain_face:- write('QUESTION: Your face is long, round or square?'),nl.
explain_color:- write('QUESTION: What the color do you think your skin is? white, wheat-colored?'),nl.
explain_face_size:- write('QUESTION: Is your face big or not?'),nl.
explain_female_weight:- write('QUESTION: Are you fat or not?'),nl.
explain_where_fat:- write('QUESTION: Which part of your body is fat obviously?'),nl.
explain_get_height:- write('Input your height (m): ').
explain_get_weight:- write('Input your weight (kg): ').
%%%%%%%%%%%%%%%%%%%%%% What we have known %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%判断该条事实是否已经存在
judge_exist(Type,X):- 
	exist(yes,Type,X).%%%We know the X has existed.
%判断这个规则是不是已经存在
judege_type_exist(Type):-
	exist(yes,Type,_).

% go into the expert system. 
go:-
	introduce,
	repeat,
		write('>>'),
		read(X),
		handle(X),
		X=end.

	