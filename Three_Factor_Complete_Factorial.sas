Data Factory;
length Noise $ 3;
Do Noise = "Hi", "Med", "Low"; Do Gender = "F", "M";
Do Experience = "E3", "E2", "E1"; Do Rep = 1, 2, 3;
input Performance @@;
output;
end; end; end; end;
cards;
629 495 767 263 141 392 161 55 271 591 492 693 321 212 438 147 79 273 324 213
478 213 106 362 158 36 293 1098 1002 1156 708 580 843 495 376 612 1037 902
1183 779 625 921 596 458 732 1667 1527 1793 1192 1005 1306 914 783 1051
run;
Proc Glm Data=Factory order=data plots=all;
Class Noise Gender Experience;
Model Performance = Noise|Gender|Experience;
output out = Resids r=residual;
means Noise|Gender|Experience / tukey;
lsmeans Noise|Gender|Experience / adjust=tukey;
lsmeans Gender*Experience / slice = Gender adjust=tukey;
lsmeans Gender*Experience / slice = Experience adjust=tukey;
lsmeans Noise*Gender / slice = Gender adjust=tukey;
lsmeans Noise*Gender / slice = Noise adjust=tukey;
lsmeans Noise*Experience / slice = Experience adjust=tukey;
lsmeans Noise*Experience / slice = Noise adjust=tukey; run;
Proc Univariate data=Resids normal plot; var residual; run;
