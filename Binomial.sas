*Probbnml(??,n,m)
*where ?? is the probability of a success,
*n is the number of independent Bernoulli trials
*m is the number of successes.;

data a;
prob18ormore=1-probbnml(0.85,20,17);
prob17orfewer=probbnml(0.85,20,17);
run;
proc print data=a; run; quit;

data a;
do s = 0 to 20 by 1;
prob_cummulative=probbnml(0.85,20,s);
prob_exact=pdf('BINOMIAL',s,0.85,20);
output;
end;
run;
