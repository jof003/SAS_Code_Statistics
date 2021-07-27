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
proc univariate data=chicks freq;
var WtGain;
run;
proc freq data=chicks;
tables WtGain;
run; quit;
ods rtf close
