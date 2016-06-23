(

c = [
	[0, 4, 7], // I
	[2, 5, 9], // ii
	[4, 7, 11], // iii
	[0, 5, 9], // IV
	[-1, 2, 7], // V
	[0, 4, 9], // vi
	[-1, 2, 5] //vii
];
)


(

//Drums

~hihat = Pbind(
        \instrument, "hihat",
        \dur, Pseq([Rest(1/4), 1/4], inf),
        \ffreq, 9000,
        \rel, 0.1,
        \amp, 0.2
    );

~kick = Pbind(
        \instrument, "kick",
        \dur, 1/2,
        \amp, 0.4,
        \rel, 0.12,
        \glissf, 0.99
);

~snare = Pbind(
        \instrument, "snare",
        \dur, Pseq([Rest(1/2), 1/2], inf),
        \amp, 0.1,
        \rel, 0.1
    );

a = List.new;

//state machine for chords
p = Pfsm([
    #[0], // entry states

    // I (== state 0)

    Pbind(
		\dur, 1,
		\note, Pseq([c[0]], 1)
	),
    #[0, 1, 3, 3, 3, 4, 4, 4, 4],

    //ii (== state 1)
    Pbind(
		\dur, 1,
		\note, Pseq([c[1]], 1)
	),
    #[3, 3, 4, 4, 5],

    //iii (== state 2)
   Pbind(
		\dur, 1,
		\note, Pseq([c[2]], 1)
	),
    #[0],

    //IV (== state 3)
    Pbind(
		\dur, 1,
		\note, Pseq([c[3]], 1)
	),
    #[0, 4, 4, 5],

    //V (== state 4)
    Pbind(
		\dur, 1,
		\note, Pseq([c[4]], 1)
	),
    #[0, 0, 5, 5],

    //vi (== state 5)
    Pbind(
		\dur, 1,
		\note, Pseq([c[5]], 1),
		\array, Pfunc({ a.add(5) })
	),
    #[2, 4],

    //vii (== state 6)
    Pbind(
		\dur, 1,
		\note, Pseq([c[6]], 1),
		\array, Pfunc({ a.add(6) })
	),
    #[1],

    // terminal state
    nil, nil
]);

)



// last chord
t = Pbind(
	\instrument, ~instrument,
	\note, Prand([[0, 5, 9],[-1, 2, 7]], 1));

(
Pspawner({ arg sp;

	~drums1 = sp.par(~hihat);
	~drums2 = sp.par(~kick);
	~drums3 = sp.par(~snare);
	sp.wait(2);
	~player = sp.par(p);
	sp.wait(8);
	sp.suspend(~player);
	sp.seq(t);
	sp.suspend(~drums1);
	sp.suspend(~drums2);
	sp.suspend(~drums3);
	"wow".postln;

}
).play(quant: 1);
)
