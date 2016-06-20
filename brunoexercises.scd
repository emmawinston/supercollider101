//Hanon 15 and 16 - Bruno's exercises

(
Pbind(
	\freq, Pseq( [1/1, 3/2, 4/3, 9/8, 16/9, 5/4, 8/5], 1) * 440,
	\dur, Prand([0.2, 0.4, 0.3], inf)
).play;
)


// * add a frequency offset to each note between 10 and 20 Hz each time
// * durations should be [0.2, 0.4] played twice, then [0.3, 0.3, 0.6] played once, repeat whole       sequence 3 times, then stop

(
Pbind(
	\freq, Pseq( [1/1, 3/2, 4/3, 9/8, 16/9, 5/4, 8/5], 1) * 440 + Pwhite(10.0, 20.0),
	\dur, Pseq([Pseq([0.2, 0.4], 2)], Pseq([0.3, 0.3, 0.6]), 3)
).play;
)


//


(
Pbind(
	\freq, Pseq( [1/1, 3/2, 4/3, 9/8, 16/9, 5/4, 8/5], 1) * 440,
	\dur, Prand([0.2, 0.4, 0.3], inf)
).play;
)

//play a bassline with the following durations [1/2. 1/2, 1/2, 1/2, 3/4, 3/4, 1/2]
//then play twice as fast
//then using legato make all notes staccato

(
Pbind(
	\freq, Pseq( [1/1, 3/2, 4/3, 9/8, 16/9, 5/4, 8/5], 1) * 440,
	\dur, Prand([0.2, 0.4, 0.3], inf)
).play;
)

