data a;
Prob1=PROBCHI(1.479,10);
Prob2=PROBCHI(29.59,10);
Chiquare1=CINV(0.999,10);
Chiquare2=CINV(0.001,10);
run;
proc print data=a; run;
