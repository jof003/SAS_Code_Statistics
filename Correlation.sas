data road;
input miles cost @@;
cards;
1.0 6.0 3.0 14.0 4.0 10.0 5.0 14.0 7.0 26.0
;
proc reg data=road;
model cost = miles; run;
proc corr data=road; run;

data scatter;
do X = -50 to 50 by 1;
y = x*x + 15*rannor(34422); x2 = x*x;
output; end; run;
symbol value=dot h=1 c=black;
proc gplot data=scatter;
plot Y*X / vaxis = 0 to 3000 by 500;
plot Y*X2 / vaxis = 0 to 3000 by 500; run;
proc corr data=scatter; run;

/*------------------------------------------------------
| This program generates samples of size 3 from a |
| population of (X,Y) pairs with correlation R. You can |
| pick R as shown. Changing the seed of NORMAL(0) from |
| 0 to a positive integer will cause the same sample to |
| be generated on each run. The argument 0 causes the |
| computer clock time to be used as a seed and results |
| cannot be reproduced. |
-------------------------------------------------------*/
DATA CORR;
*************************************************
PICK A VALUE FOR R;
R = .8;
************************************************;
FILE PRINT;
IF R*R > 1 THEN DO;
PUT '|R| EXCEEDS 1 CHANGING TO R=.99'; R=.99; END;
FILE LOG;
DO GROUP=1 TO 50;
DO SAMPLE=1 TO 10;
DO I=1 TO 3; X=NORMAL(1234567); Y=NORMAL(1234567);
Y = R*X + SQRT(1-R*R)*Y;
OUTPUT; END; END;
PUT 'Finished ' group 'x10 samples';
END;
PROC CORR DATA=CORR NOPRINT NOSIMPLE OUTP=OUT1;
BY SAMPLE NOTSORTED; VAR Y; WITH X;
DATA NEXT; SET OUT1; IF _TYPE_='CORR';
PROC UNIVARIATE DATA=NEXT PLOT; VAR Y; RUN;
