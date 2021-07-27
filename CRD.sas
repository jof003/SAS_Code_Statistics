Data Fruit;
Do V = "V1", "V2", "V3";
Do Rep = 1, 2;
Do P = "P1", "P2", "P3", "P4";
input Yield @@;
output;
end; end; end; cards;
49 50 43 53 39 55 38 48 55 67 53 85 41 58 42 73 66 85 69 85 68 92 62 99
;
Proc Glm Data=Fruit plots=all; Class V P;
Model Yield = V P V*P;
means V P V*P / tukey lines;
lsmeans V P V*P / adjust=tukey lines; run;

data GreenHouse;
do block = 1 to 5;
input variety $ yield @@;
output;
end;
cards;
X 34.0 W 37.0 X 31.5 W 31.0 X 24.5
Z 39.5 Z 33.0 W 35.5 X 28.0 W 30.5
W 39.5 X 29.5 Z 31.0 Z 25.5 Z 25.0

title "CRD Analysis";
proc glm data=Greenhouse; Class variety;
model yield = variety;
means variety / lsd; run;
