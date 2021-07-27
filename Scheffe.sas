proc Glm data=A; class floor;
model temp = floor;
Means floor / scheffe; run;
