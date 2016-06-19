
(
~myPbind = Pbind(
	\freq, 270,
	\amp, 0.3,
	\dur, 0.2
).play;
)


~myPbind.stop;
~myPbind.pause;
~myPbind.play;
~myPbind.reset;


//pseries

(
~myPseries = Pbind(
	\freq, Pseries(100, 100, 10), //start then step then length in hz
	\dur, 0.6
).play
)

(1..10) //list from 1-10
(1,3..10) //list from 1-10 by 3s

//searching for syntactic sugar will tell you other idiosyncratic stuff like this

(
~myPbind1 = Pbind(
	\freq, Pgeom(100, 1.5, 4),
	\amp, 0.3,
	\dur, 1
).trace.play;
)

(
~myPbind2 = Pbind(
	\freq, Pn(Pgeom(100, 1.5, 4), inf),
	\amp, 0.3,
	\dur, 0.5
).trace.play;
)

(
~myPbind3 = Pbind(
	\freq, Pn(440,3),
	\amp, 0.3,
	\dur, 0.5
).trace.play;
)

Pxrand // never repeats twice in a row

(
~myPbind4 = Pbind(
	\freq, Pwrand([440, 110, 660],[0.3,0.4,0.8].normalizeSum,inf),
	\amp, 0.1,
	\dur, 0.1
).play;
)


// DONT UNDERSTAND ANY OF THIS ASK DURING LABS
a = (100, 110 .. 660);
w = (0.2, 0.4, 1);
a.normalizeSum;

(
~myPbind1 = Pbind(
	\freq, Pwrand(a, w, inf),
	\amp, 0.1,
	\dur, 0.1
).trace.play;
)
//END BIT I DON'T UNDERSTAND