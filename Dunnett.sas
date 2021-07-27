proc Glm data=A; class floor;
model temp = floor;
means floor / dunnett('1');
means floor / dunnettl('1');
means floor / dunnettu('1');
run;
