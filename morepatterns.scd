// more patterns

//awesome minimalism
(
Pbind(
	\note, Pseq([0,5,-8,0,5],inf),  //or 3 for numerical repetition
	\dur, 0.2,
	\amp, 0.3,
	\octave, 6
).play
)

//chords
(
Pbind(
	\note, Pseq([
		[0,5,8],
		[0.6,10],
		[0,5,10]
	],
	inf),
	\dur, 0.2,
	\amp, 0.3
).play
)

(
Pbind(
	\note, Pseq([
		[0,5,8],
		[0.6,10],
		[0,5,10]
	],
	inf),
	\dur, 0.1,
	\amp, 0.2,
	\octave, 6
).play
)

// durations
(
Pbind(
	\note, Pseq([
		[0,5,8],
		[0.6,10],
		[0,5,10]
	],
	inf),
	\dur, Pseq([0.2, 0.1, 0.4], inf),
	\amp, Pseq([0.2, 0.2, 0.2], inf)
).play
)