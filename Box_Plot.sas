data rats;
input water @@;
cards;
10.6 14.3 11.5 18.4 11.8 14.1 13.0 9.4 17.4 15.8 13.7 12.6 16.5 11.1 13.5
15.2 12.0 13.7 15.8 15.4 14.0 14.7 17.0 12.5 10.0 16.6 13.6 12.9 18.2 11.4
16.6
;
ods graphics off;
proc univariate data=rats plot; var water; run; quit;



data DUI;
do Group = "Placebo", "Alcohol";
do Person = 1 to 10 by 1;
input ReactionTime @@;
output;
end; end;
cards;
0.90 0.37 1.63 0.83 0.95 0.78 0.86 0.61 0.38 1.97
1.46 1.45 1.76 1.44 1.11 3.07 0.98 1.27 2.56 1.32
;
proc boxplot data=DUI;
plot reactiontime*group / boxstyle = schematicidfar; run;
