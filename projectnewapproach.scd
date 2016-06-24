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
)

a = List.new;


//instead - create a counter. count up 1 through 4.
//create a variable for current chord
//while counter is less than 4 progress to next chord


(
//state machine for chords
p = Pfsm([
    #[0], // entry states

    // I (== state 0)

	a.add([0, 4, 7]), //I

    #[3],

    //ii (== state 1)

	a.add([2, 5, 9]), //ii

    #[3, 3, 4, 4, 5],

    //iii (== state 2)

	a.add([4, 7, 11]), // iii

    #[0],

    //IV (== state 3)

	a.add([0, 5, 9]), // IV

    #[4],

    //V (== state 4)

	a.add([-1, 2, 7]), // V

    #[0, 0, 5, 5],

    //vi (== state 5)

	a.add([0, 4, 9]), // vi

    #[2, 4],

    //vii (== state 6)

	a.add([-1, 2, 5]), //vii

    #[1],

    // terminal state
    nil, nil
]);

)

a.postln;

(
~loop = Pbind(
	\note, Pseq([a[0], a[1], a[2], a[3], a[4]], 4)
).play;
)

// last chord
t = Pbind(\note, Prand([[0, 5, 9],[-1, 2, 7]], 1));

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
