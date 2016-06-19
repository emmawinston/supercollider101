//pbind practice

//Pseq, Prand, Pwhite

(
Pbind(
	\note, Pseq([0,3,5], inf),
	\dur, 0.2,
	\amp, 0.8
).play;
)

(
Pbind(
	\freq, 4590.3,
	\amp, 0.2,
	\dur, 0.1
).play;
)

Scale.directory

(
Pbind(
	\scale, Scale.superLocrian,
	\note, Pseq([0, 1, 2, 3, 4, 5, 6, 7])
).play;
)