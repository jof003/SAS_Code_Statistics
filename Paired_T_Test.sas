data repairshops;
input pair garage estimate1 pair garage estimate2 @@;
cards;
1 1 17.6 1 2 17.3 2 1 20.2 2 2 19.1
3 1 19.5 3 2 18.4 4 1 11.3 4 2 11.5
5 1 13.0 5 2 12.7 6 1 16.3 6 2 15.8
7 1 15.3 7 2 14.9 8 1 16.2 8 2 15.3
9 1 12.2 9 2 12.0 10 1 14.8 10 2 14.2
11 1 21.3 11 2 21.0 12 1 22.1 12 2 21.0
13 1 16.9 13 2 16.1 14 1 17.6 14 2 16.7
15 1 18.4 15 2 17.5
;
proc ttest data=repairshops; paired estimate1*estimate2;
run; quit;
