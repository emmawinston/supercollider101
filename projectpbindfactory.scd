(

c = [
	[],
	[0, 4, 7], // I
	[2, 5, 9], // ii
	[4, 7, 11], // iii
	[0, 5, 9], // IV
	[-1, 2, 7], // V
	[0, 4, 9], // vi
	[-1, 2, 5] //vii
];

d = [
	[4, 5, 1],
	[2, 5, 1],
	[2, 5, 6]
];

)



Pbind(\degree, Pseq([ [0, 3, 4, 5], [3, 4, 5, 5]    ])).play;

~factory =
~factory.value(num: 33);




{arg num = 99; num + 9}.value(22)



{ }



































(
~counter = 0;


Pfsm([
    #[0], // entry states

    // I (== state 0)
    Pbind(
		\dur, 1,
		\note, Pseq([c[0]], 1),
		\counter, Pfunc({ ~counter = ~counter+1 })
	),
	Pfunc({if(~counter < 4, { "yes".postln; #[0, 1] }, { "no".postln;  #[2] })}),

    //ii (== state 1)
    Pbind(
		\dur, 1,
		\note, Pseq([c[1]], 1),
		\counter, Pfunc({ ~counter = ~counter+1 })
	),
	Pfunc({ if(~counter < 4, { "yesB".postln; #[0, 1] }, { "noB".postln;  #[2] }) }),

    // terminal state
    nil, nil
]).play(quant:1);
)


/* // Drums
(
Ppar([
    Pbind(
        \instrument, "hihat",
        \dur, Pseq([Rest(1/4), 1/4], inf),
        \ffreq, 9000,
        \rel, 0.1,
        \amp, 0.2
    ),
    Pbind(
        \instrument, "kick",
        \dur, 1/2,
        \amp, 0.4,
        \rel, 0.12,
        \glissf, 0.99
    ),
        Pbind(
        \instrument, "snare",
        \dur, Pseq([Rest(1/2), 1/2], inf),
        \amp, 0.1,
        \rel, 0.1
    )
]).play(quant:1);
) */