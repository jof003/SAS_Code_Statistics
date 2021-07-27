Data LatinSquare;
Do ProblemType = 1,2,3,4;
Do Secretary = 1,2,3,4;
input SoftwareType $ Time @@;
output;
end; end;
cards;
A 0.3 B 1.8 C 0.7 D 1.2
B 1.4 C 1.4 D 1.1 A 0.5
C 0.5 D 1.5 A 0.5 B 1.1
D 1.0 A 0.5 B 1.7 C 1.6
;
Proc GLM data=LatinSquare plots=all;
class ProblemType Secretary SoftwareType;
model Time = ProblemType Secretary SoftwareType;
output out=Resids r=residual;
lsmeans SoftwareType / adjust = tukey lines; run; quit;
