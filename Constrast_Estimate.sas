data WoodTrts;
input Brand $ rep y @@;
cards;
A 1 3 A 2 5 A 3 4
B 1 5 B 2 4 B 3 6
C 1 8 C 2 7 C 3 9
D 1 4 D 2 5 D 3 6
;
Proc Glm data= WoodTrts; Class Brand;
model y = Brand;
Means Brand / lsd;
Contrast "Trt1 vs Trt2" Brand 1 -1;
Estimate "Trt1 vs Trt2" Brand 1 -1;
Contrast "Mean of Trt2,Trt3,Trt4" Intercept 1 Brand 0 0.33333 0.33333 0.33333;
Estimate "Mean of Trt2,Trt3,Trt4" Intercept 1 Brand 0 0.33333 0.33333 0.33333;
Contrast "Sum of Trt1,Trt2,Trt4" Intercept 3 Brand 1 1 0 1;
Estimate "Sum of Trt1,Trt2,Trt4" Intercept 3 Brand 1 1 0 1;
Contrast "Mean of Trt4" Intercept 1 Brand 0 0 0 1;
Estimate "Mean of Trt4" Intercept 1 Brand 0 0 0 1;
run; quit;
