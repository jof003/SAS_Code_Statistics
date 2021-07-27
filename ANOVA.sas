data crd;
input trt$ rep value @@;
cards;
A 1 73.471 A 2 73.523 A 3 91.681 A 4 79.494
B 1 67.786 B 2 78.678 B 3 88.891 B 4 76.181
C 1 104.143 C 2 103.115 C 3 93.397 C 4 102.689
D 1 115.28 D 2 96.586 D 3 96.292 D 4 113.174
;
proc glm data=crd; class trt;
model value = trt;
output out=junk r=residual
;
means trt / lsd alpha = 0.1 hovtest=bf; run;
/* Note: recall that hovtest = bf is used to conduct the Brown-Forsyth test
to test for the equality of variances at each group (see Chapter 7 lecture notes)*/
proc print data=junk; run;
symbol v=circle color=black h=3;
proc univariate data=junk normal plot; var residual;
probplot residual/normal(mu=est sigma=est color=black w=3);
inset mean median min max skewness kurtosis var probn;
run;
