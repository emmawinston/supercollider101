(
p = Pbind(
	\degree, Pwhite(10, 20) - 10,
	\legato, 10,
	\dur, 1/4,
	\amp, 0.5
);
)

(
t = TempoClock(30/60);
{
	"hi everyone".postln;
	2.wait;
	~bruno = p.play;
	4.wait;
	~bruno.stop;
	2.wait;
	"bye everyone".postln;
}.fork(t);
)

~bruno = p.play;

~bruno.stop;
~bruno.resume;
~bruno.pause;
~bruno.play;