(
t = TempoClock(120/60);
{
	"hi".postln;
	1.wait;

	Pbind(
		\scale, Scale.minor,
		\note, Pseq([0,2,3,5], 32),
		\dur, 0.2
	).play;

	1.wait;
	"bye".postln;
}.fork(t);
)