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

//run together


(
a = [0, 1, 2, 3, 4, 5];
t = TempoClock(190/60);

Pbind(
	\degree, Pseq(a, inf) + 10,
	\dur, 1,
	\amp, 0.2,
).play(t);

Pbind(
	\degree, Pseq(a, inf) + -5,
	\dur, 1,
	\amp, 0.2,
).play(t);

t.tempo = 239/60; //this is a method

)

//what's an object? Pbind, pattern, family is an object, tempoclock is too