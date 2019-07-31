city(ottawa,ontario).
city(guelph,ontario).
city(kingston,ontario).
city(gatineau,quebec).
city(montreal,quebec).
team(ravens,ottawa).
team(ggs,ottawa).
team(gryphons,guelph).
team(queens,kingston).
team(torrents,gatineau).
team(stingers,montreal).
sport(annie,lacrosse).
sport(paul,crosscountry).
sport(suzy,ski).
sport(robert,basketball).
sport(tom,lacrosse).
sport(tim,ski).
sport(annie,ski).
sport(joe,basketball).
sport(jane,basketball).
sport(marie,crosscountry).
sport(suzy,crosscountry).
sport(jack,ski).
sport(simon,lacrosse).
player(annie,gryphons).
player(tom,torrents).
player(jane,stingers).
player(marie,ggs).
player(joe,ravens).
player(jack,queens).
player(simon,ravens).
player(suzy,torrents).
player(paul,ggs).
player(marie,ggs).
player(simon,gryphons).

myAnswer:-%contains all the queries required to produce the desired results 
setof(X,sport(X,basketball),L),writeln(L),
setof(Y,X^(city(X,ontario),team(Y,X)),LL),writeln(LL),
setof(X,Z^P^(sport(X,Z),sport(X,P),\+Z==P),LLL),writeln(LLL),

findall((Y,Z),(sport(Y,Z),player(Y,X),team(X,ottawa)),LLLL),writeln(LLLL),

setof((Y,Z),X^(sport(Y,Z),player(Y,X),team(X,ottawa)),LLLLL),writeln(LLLLL).


