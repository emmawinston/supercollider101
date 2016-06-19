//rests

(
a = [0, 1, 2, 3, 4, 5];

Pbind(
	\degree, Pseq(a, inf),
	\dur, Prand([1, 0.5, Rest(0.5)], inf),
	\amp, 0.2
).trace.play;
)