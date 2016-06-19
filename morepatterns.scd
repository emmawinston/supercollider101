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
).trace.play //allows you to see what's happening in the post window
)

Scale.directory

//Pbind scales
(
Pbind(
	\scale, Scale.major, //only works if using key degree
	\root, 0,
	\mtranspose, 1, //uses same scale but shifted up one - modal transpose
	\ctranspose, [1, 5, 9], //actually transposes to d major - chromatic transpose
	\degree, Pseq([0,1,2,3,4,5,6,7], inf),
	\dur, 0.2,
	\amp, 0.2
).play
)