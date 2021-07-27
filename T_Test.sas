data warehouse;
input time @@;
cards;
28 25 27 31 10 26 30 15 55 12 24 32 28 42 38
;
proc ttest data = warehouse
h0=25 sides=U alpha=0.05;
var time;
run; quit;

data drugs;
input Type $ bottle potency @@;
cards;
Fresh 1 10.2 Fresh 2 10.5
Fresh 3 10.3 Fresh 4 10.8
Fresh 5 9.8 Fresh 6 10.6
Fresh 7 10.7 Fresh 8 10.2
Fresh 9 10.0 Fresh 10 10.6
Stored 1 9.8 Stored 2 9.6
Stored 3 10.1 Stored 4 10.2
Stored 5 10.1 Stored 6 9.7
Stored 7 9.5 Stored 8 9.6
Stored 9 9.8 Stored 10 9.9
;
proc sort data=drugs; by type;
run; *Sort not actually not required here since already sorted.;

proc univariate data=drugs plot normal; var potency;
qqplot potency / normal(mu=est sigma=est);
inset probn n min max mean mode median var std skewness kurtosis;
by type;
run;
proc ttest data=drugs ci=equal sides=2;
var potency; class type;
run;
