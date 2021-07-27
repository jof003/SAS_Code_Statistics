data power;
input mean beta power;
cards;
33 .9500 .0500
34 .8266 .1734
35 .5935 .4065
36 .3200 .6800
37 .1206 .8794
38 .0301 .9699
39 .0049 .9951
40 .0005 .9995
41 .0001 .9999
;
symbol1 value=point color=black i=spline w=3;
proc gplot data=power;
plot beta*mean;
plot power*mean;
run; quit;
