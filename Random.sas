data GreenHouse; do block = 1 to 5;
input variety $ yield @@;
output;
end;
cards;
X 34.0 W 37.0 X 31.5 W 31.0 X 24.5
Z 39.5 Z 33.0 W 35.5 X 28.0 W 30.5
W 39.5 X 29.5 Z 31.0 Z 25.5 Z 25.0
;
proc Glm data=Greenhouse; Class Variety Block;
model yield = Block Variety;
Random Block;
means Variety / lsd;
lsmeans Variety / stderr pdiff; run;
