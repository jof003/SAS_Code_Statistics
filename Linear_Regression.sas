data pharmacy;
input pharmacy y x @@;
cards;
1 25 10 2 55 18
3 50 25 4 75 40
5 110 50 6 138 63
7 90 42 8 60 30
9 10 5 10 100 55
. . 15
;
proc reg data=pharmacy;
model y = x / p r;
id pharmacy;
run; quit;

data sick;
input absences experience @@;
cards;
31.5 18.1 33.1 20.0 27.4 20.8 24.5 21.5 27.0 22.0
27.8 22.4 23.3 22.9 24.7 24.0 16.9 25.4 18.1 27.3
. 19.5
;
symbol1 value=dot color=black height=3 line=3 width=3;
proc reg data=sick;
model absences = experience / r p;
plot absences*experience;
plot p.*experience; plot r.*experience;
run; quit;
