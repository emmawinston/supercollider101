(
p = Pbind(
	\degree, Pwhite(10, 20) - 10,
	\legato, 10,
	\dur, 1/4,
	\amp, 0.5
);
)

~bruno = p.play;

~bruno.stop;
~bruno.resume;
~bruno.pause;
~bruno.play;