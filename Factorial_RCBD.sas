data bread;
do flour = "A", "B", "C";
do day = 1,2,3;
do temp = 1,2,3;
input protein @@; output;
end; end; end;
cards;
5.8 4.6 4.6 11.4 5.2 5.2 10.5 9.7 4.7 8.4 5.4 4.7 7.5 7.9 7.2
14.6 7.9 6.9 16.0 5.2 4.2 17.8 7.0 6.3 16.9 11.5 7.2
;
proc mixed data=bread method = type3 plots=all;
class day flour temp;
model protein = flour temp flour*temp / outp=prevals;
random day;
lsmeans flour temp / adjust = tukey;
lsmeans flour*temp / adjust = tukey slice=temp slice=flour; run;
proc univariate data=prevals normal plot; var resid; run;
proc glm data=prevals; class flour temp;
model resid = flour*temp;
means flour*temp / hovtest=bf; run; quit;
