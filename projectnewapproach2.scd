//drums

//Drums

(
~hihat = Pbind(
        \instrument, "hihat",
        \dur, Prand([

		Pseq([Rest(1/4), 1/4], 4),
		Pseq([Rest(1/4), 1/4], 4),
		Pseq([Rest(1/8), 1/4], 4),
		Pseq([Rest(1/4), 1/8], 4),
		Pseq([1/16], 4),
		Pseq([Rest(1/8), 1/8], 4),
		Pseq([Rest(1/8), 1/8], 4)

	], inf),
        \ffreq, 9000,
        \rel, 0.1,
        \amp, 1
    );

~kick = Pbind(
        \instrument, "kick",
        \dur, 1/2,
        \amp, 1,
        \rel, 0.12,
        \glissf, 0.99
);

~snare = Pbind(
        \instrument, "snare",
	\dur, Prand([
		Pseq([Rest(1/2), 1/2], 4),
		Pseq([Rest(1/2), 1/4], 4),
		Pseq([Rest(1/4), 1/2], 4),
		Pseq([Rest(1/2), 1/2], 4),
		Pseq([Rest(1/2), 1/4], 4),
		Pseq([Rest(1/4), 1/2], 4),
		Pseq([Rest(1/4), 1/4], 2)
	], inf),
        \amp, 1,
        \rel, 0.1
    );
)

//chords


c = [0, 4, 7];
d = [2, 5, 9];
e = [4, 7, 11];
f = [0, 5, 9];
g = [-1, 2, 7];
~g7 = [-1, 2, 5, 7];
a = [0, 4, 9];
b = [-1, 2, 5];
)

(
~list = List.new;
~instrument = "cowbell";
~key = 0;
~current = c;
~list.add(~current);

~instrument = ["flute", "cowbell", "prophet5", "default", "cowbell", "prophet5", "default"].choose;
~key = [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11].choose;

for (1, 3, {

	case

	{ ~current == c } { ~current = [f, f, f, g, g, g, a].choose; ~list.add(~current) }

	{ ~current == f } { ~current = [f, g, g, g, c, c, d, d, a].choose; ~list.add(~current) }

	{ ~current == g } { ~current = [f, f, a, a, d, c, b ].choose; ~list.add(~current) }

	{ ~current == d } { ~current = [g, g, a, a, f].choose; ~list.add(~current); ~list.postln };

 });

~list.add([~g7, g, g, g, f, f, f ].choose);

~list.postln;

~loop = Pbind(
	\ctranspose, ~key,
	\instrument, ~instrument,
	\legato, 1,
	\note, Pseq(~list, 4) //second arg is number of repeats
);

~end = Pbind(
	\ctranspose, ~key,
	\instrument, ~instrument,
	\note, Pseq([c], 1),
	\dur, 4
);

Pspawner({ arg sp;

	~drums1 = sp.par(~hihat);
	~drums2 = sp.par(~kick);
	~drums3 = sp.par(~snare);
	sp.wait(2);

	~player = sp.seq(~loop);
	~lastplayer = sp.seq(~end);

	sp.suspend(~drums1);
	sp.suspend(~drums2);
	sp.suspend(~drums3);
	"wow".postln;

}
).play(quant: 1);
)
