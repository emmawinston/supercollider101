// lab session 1

(
t = TempoClock(60/60);
{
	 ~bells = Pbind(
		\scale, Scale.locrian,
		\degree, Pwhite(20, 30, 16),
		\octave, 3,
		\amp, Pseq([Pwhite(0.2, 0.4)]),
		\dur, Pwhite(1, 3.0),
		\legato, 20
	).play(t, quant: 1);

	16.wait;

	~bass = Pbind(
		\scale, Scale.locrian,
		\degree, Pwhite(20, 30, 8),
		\dur, Pwhite(1, 4),
		\legato, 10,
		\amp, 0.6,
		\octave, 0
	).play(t, quant: 1);

	16.wait;

	~ostinato = Pbind(
		\scale, Scale.locrian,
		\degree, Pseq([0, 5], 62),
		\dur, 0.2,
		\amp, 0.4
	).play(t, quant: 1);

	12.wait;

	~secondostinato = Pbind(
		\scale, Scale.locrian,
		\note, Pseq([[0,3],[5,8]], 64),
		\dur, 0.1,
		\amp, 0.3
	).play(t, quant: 0.5);

	2.wait;

	~bells.stop;
	~bass.stop;
}.fork(t);
)