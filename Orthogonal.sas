data WoodTrts;
input Brand $ rep y @@;
cards;
A 1 3 A 2 5 A 3 4
B 1 5 B 2 4 B 3 6
C 1 8 C 2 7 C 3 9
D 1 4 D 2 5 D 3 6
;
Proc Glm data= WoodTrts; Class Brand;
model y = Brand;
Means Brand ;
contrast "l1 orthog" Brand -3 -1 1 3;
contrast "l2 orthog" Brand 1 -1 -1 1;
contrast "l3 orthog" Brand -1 3 -3 1;
contrast "l1 non-orthog" Brand 1 -1 0 0;
contrast "l2 non-orthog" Brand 0 1 -1 0;
contrast "l3 non-orthog" Brand 0 0 1 -1;
run; quit;
