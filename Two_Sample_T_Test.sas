data lambs;
do Treatment = "Drug Treated", "Untreated";
do animal = 1 to 12 by 1;
input wormcount @@;
output;
end;
end;
cards;
18 43 28 50 16 32 13 35 38 33 6 7
40 54 26 63 21 37 39 23 48 58 28 39
;
run;
Title "This is a one-side lower";
proc ttest data=lambs ci=equal sides=L ; var wormcount; class Treatment;
run;
Title "This is a one-side upper";
proc ttest data=lambs ci=equal sides=U ; var wormcount; class Treatment;
run;
Title "This is a two-sided";
proc ttest data=lambs ci=equal sides=2 ; var wormcount; class Treatment;
run;
