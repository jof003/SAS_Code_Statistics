data flip;
nTT = 0; nTH = 0; nHT = 0; NHH = 0; ntot = 0;
Do While (ntot < 10000000); *this is simulation of ten million flips;
* Use of the negative value for the seed results in a different
outcome each time because the clock time is used. If you want the same
result each time you can use a positive value for the seed in RANUNI;
tosscoin1 = Ranuni(-3333);
tosscoin2 = Ranuni(-3333);
if tosscoin1 < .5 and tosscoin2 < .5 then do; nTT = nTT + 1; end;
if tosscoin1 < .5 and tosscoin2 > .5 then do; nTH = nTH + 1; end;
if tosscoin1 > .5 and tosscoin2 < .5 then do; nHT = nHT + 1; end;
if tosscoin1 > .5 and tosscoin2 > .5 then do; nHH = nHH + 1; end;
ntot = ntot + 1;
rfTT = nTT/ntot; rfTH = nTH/ntot; rfHT = nHT/ntot; rfHH = nHH/ntot;
rf1H = rfTH + rfHT; rf1T = rfTH + rfHT;
end;
file print;
put 'A Simulation of ' ntot 'Sets of 2 Coin Flips.';
put 'In other words, each set of coins is flipped ' ntot 'times';
put 'Number of Observed TT = ' nTT; put 'Relative Frequency of TT = ' rfTT; put ;
put 'Number of Observed TH = ' nTH; put 'Relative Frequency of TH = ' rfTH; put ;
put 'Number of Observed HT = ' nHT; put 'Relative Frequency of HT = ' rfHT; put ;
put 'Number of Observed HH = ' nHH; put 'Relative Frequency of HH = ' rfTT; put ;
put 'Relative Frequency of Exactly one Head = ' rf1H; put;
put 'Total Number of Sets of Flips = ' ntot;
run; quit;
