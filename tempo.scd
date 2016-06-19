(
Pbind(
	\degree, Pwhite(0, 10),
	\dur, 1/4,
	\amp, 0.2,
	\tempo, 120/60 //BEATS PER SECOND
).play
)

// the last tempo will always override
// threading tempos

(
a = [0, 1, 2, 3, 4, 5];

Pbind(
	\degree, Pseq(a, inf),
	\dur, 1,
	\amp, 0.2
).play(TempoClock(60/60));

Pbind(
	\degree, Pseq(a, inf),
	\dur, 1,
	\amp, 0.2
).play(TempoClock(120/60));
)

