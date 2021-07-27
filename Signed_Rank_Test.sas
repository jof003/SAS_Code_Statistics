*You can get a signed rank out of SAS in Proc Univariate, but you
have to first calculate the difference and then run Univariate on
that variable;
Data Grass;
length Brand $ 11;
do field = 1 to 20 by 1;
do Brand = "Brand A", " Brand D", "Difference";
input Clippings @@;
output;
end;
end;
cards;
211.
4 186.3 25.1 204.4 205.7 -1.3 202.0 184.4 17.6 201.9 203.6 -1.7
202.4 180.4 22.0 202.0 202.0 0 202.4 181.5 20.9 207.1 186.6 20.4
203.6 205.7 -2.1 216.0 189.1 26.9 208.9 183.6 25.3 208.7 188.7 20.0
213.8 188.6 25.2 201.6 204.2 -2.6 201.8 181.6 20.1 200.3 208.7 -8.4
201.8 181.5 20.3 201.5 208.7 -7.2 212.1 186.8 25.3 203.4 182.9 20.5
;
data GrassDiff; Set Grass; if Brand = "Difference"; run;
proc univariate data=GrassDiff normal; var Clippings;
qqplot Clippings / normal(mu=est sigma=est);
run; quit;
