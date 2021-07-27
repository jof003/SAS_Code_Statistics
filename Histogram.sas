data chicks;
input WtGain @@;
cards;
3.7 4.2 4.4 4.4 4.3 4.2 4.4 4.8 4.9 4.4
4.2 3.8 4.2 4.4 4.6 3.9 4.3 4.5 4.8 3.9
4.7 4.2 4.2 4.8 4.5 3.6 4.1 4.3 3.9 4.2
4.0 4.2 4.0 4.5 4.4 4.1 4.0 4.0 3.8 4.6
4.9 3.8 4.3 4.3 3.9 3.8 4.7 3.9 4.0 4.2
4.3 4.7 4.1 4.0 4.6 4.4 4.6 4.4 4.9 4.4
4.0 3.9 4.5 4.3 3.8 4.1 4.3 4.2 4.5 4.4
4.2 4.7 3.8 4.5 4.0 4.2 4.1 4.0 4.7 4.1
4.7 4.1 4.8 4.1 4.3 4.7 4.2 4.1 4.4 4.8
4.1 4.9 4.3 4.4 4.4 4.3 4.6 4.5 4.6 4.0
;
ods rtf;
title 'Analysis of Chicken Weight Gain';
proc univariate data=chicks;
histogram WtGain / midpoints = 3.6 to 4.9 by 0.1; run;
title 'Weight gain (grams) of chicks by 0.2';
proc univariate data=chicks;
histogram WtGain / midpoints = 3.6 to 4.9 by 0.2; run;
title 'Weight gain (grams) of chicks by 0.3';
proc univariate data=chicks;
histogram WtGain / midpoints = 3.6 to 4.9 by 0.3; run;
title 'Weight gain (grams) of chicks by 0.4';
proc univariate data=chicks;
histogram WtGain / midpoints = 3.6 to 4.9 by 0.4; run; quit;

DATA POLLEN;
INPUT CONC @@;
CARDS;
2471 520 561 488 5986 359
1305 512 467 270 360 451
4904 572 498 382 271 3634
1682 784 8298 643 947 686
;
PROC UNIVARIATE DATA=POLLEN PLOT FREQ;
VAR CONC; RUN;
