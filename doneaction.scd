//doneaction - will not stop running at end of envelope without this - 2 is a particular convention within the program

{ SinOsc.ar(freq: rrand(100, 1500), mul: Env.perc.kr(doneAction:2)) }.play;

s.plotTree;