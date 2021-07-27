data mpg;
input trt value @@;
cards;
1 4.2 1 2.9 1 0.2 1 25.7 1 6.3 1 7.2 1 2.3 1 9.9 1 5.3 1 6.5
2 0.2 2 11.3 2 0.3 2 17.1 2 51.0 2 10.1 2 0.3 2 0.6 2 7.9 2 7.2
3 7.2 3 6.4 3 9.9 3 3.5 3 10.6 3 10.8 3 10.6 3 8.4 3 6.0 3 11.9
;
run;
Proc glm data=mpg; class trt;
model value = trt;
means trt / hovtest=levene hovtest=bf; run;
proc sort data=mpg; by trt; run;
proc univariate data=mpg normal plot; var value; by trt; run;
