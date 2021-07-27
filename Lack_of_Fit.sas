data heat;
label y="Heat Loss" x="Outside Temp (F)";
do x = 20, 30, 40, 60; do rep = 1,2,3;
input y @@;
output;
end; end;
cards;
86 80 77 88 80 83 78 84 75 33 38 43
;
symbol value=dot color=black h=1.5;
proc reg data=heat plots=all;
model y = x;
plot y*x; run;
proc reg data=heat plots=all;
model y = x / lackfit;
plot y*x; run;
data heat; set heat;
x2 = x*x; run;
symbol1 value=dot color=black h=2;
symbol2 value=dot color=red h=3;
proc reg data=heat plots=all;
model y = x x2 / lackfit p r;
output out = junk p=yhat r=residual;
plot y*x p.*x / overlay; run;

symbol1 value=dot color=black h=1.5 interpol=none;
symbol2 value=dot color=red interpol=rq w=1.5 h=1.5 l=1;
proc gplot data=junk;
plot y*x yhat*X / overlay; run;
