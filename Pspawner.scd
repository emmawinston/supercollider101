// Pspawner examples
// One clear advantage is that the spawner *knows* when a pattern has finished.
// (... as opposed to sequencing patterns inside a {}.fork)
// (older examples are at the end of file)


// ===================================
// Define a bunch of "score snippets"
// ===================================

(
~scale = [ 0, 1, 2, 3, 4, 5, 6, 7 ];

~one = Pbind(
	\degree, [0, 7],
	\octave, 7,
	\dur, 0.2,
	\legato, 0.1,
	\db, Pseq([-20, -24, -22, -24], inf));

~two = Pbind(
	\degree, Pseq(~scale.mirror),
	\dur, 0.2);

~three = Pbind(
	\degree, Pseq(~scale.mirror),
	\dur, 0.2,
	\octave, 4);

~four = Pbind(
	\degree, Pseq(~scale.reverse.mirror),
	\dur, 0.2);

~five = Pbind(
	\degree, Pseq(~scale.mirror),
	\dur, 0.2,
	\mtranspose, [0, 2, 4, 6, 8, 10, 12, 14]);

) // end of Pbind definitions

// ============
// Quick test
// ============

~one.play;
~two.play;
~three.play;
~four.play;
~five.play;

// =====================
// Sequencing & playing
// =====================

// Simple example first

(
Pspawner({ | sp |
	// scales in sequence, one right after the other
	sp.seq(~three);
	sp.seq(~two);
	// with a little pause in between
	sp.wait(0.4);
	sp.seq(~four);
	sp.wait(1);
	sp.seq(~two);
	sp.wait(1);
	// Now two of them in paralell:
	sp.seq(Ppar([~three, ~four]));

	sp.suspendAll;

}).play
)


// A more complex example
(
Pspawner({ | sp |

	// parallel pulses will run throughout the example (like "In C")
	sp.par(~one);

	// scales in sequence with pauses
	sp.seq(~two);

	sp.wait(0.4);

	sp.seq(Ppar([~three, ~four]));

	sp.wait(3);

	sp.seq(~five);

	// scales overlaped at 0.4 second intervals
	10.do {
		sp.par(~two);
		sp.wait(0.4)
	};

	sp.wait(1.6);

	sp.suspendAll;

}).play
)

























// Pspawner example
// One clear advantage is that the spawner *knows* when a pattern has finished.
// (... as opposed to sequencing patterns inside a {}.fork)

(
Pspawner({ | sp |

	// parallel in-c'ish pulses will run throughout the example
	sp.par(
		Pbind(
			\degree, [0, 7],
			\octave, 7,
			\dur, 0.2,
			\legato, 0.1,
			\db, Pseq([-20, -24, -22, -24], inf)));

	// scales in sequence with pauses
	sp.seq(
		Pbind(
			\degree, Pseq((0..7).mirror),
			\dur, 0.2));

	sp.wait(0.4);

	sp.seq(
		Ppar([
			Pbind(
				\degree, Pseq((0..7).mirror),
				\dur, 0.2,
				\octave, 4),
			Pbind(
				\degree, Pseq((0..7).reverse.mirror),
				\dur, 0.2)
	]));

	sp.wait(3);

	sp.seq(
		Pbind(
			\degree, Pseq((0..7).mirror),
			\dur, 0.2,
			\mtranspose, (0,2..14))
	);

	// scales overlaped at 0.4 second intervals
	10.do {
		sp.par(
			Pbind(
				\degree, Pseq((0..7).mirror),
				\dur, 0.2)
		);
		sp.wait(0.4)
	};

	sp.wait(1.6);

	sp.suspendAll;

}).play
)










(
~one =         Pbind(
	\degree, [0, 7],
	\octave, 7,
	\dur, 0.2,
	\legato, 0.1,
	\db, Pseq([-20, -24, -22, -24], inf));

~two = Pbind(
	\degree, Pseq((0..7).mirror),
	\dur, 0.2);

~three = Pbind(
	\degree, Pseq((0..7).mirror),
	\dur, 0.2,
	\octave, 4);

~four = Pbind(
	\degree, Pseq((0..7).reverse.mirror),
	\dur, 0.2);

~five = Pbind(
	\degree, Pseq((0..7).mirror),
	\dur, 0.2,
	\mtranspose, (0,2..14));



Pspawner({ | sp |

	// parallel in-c'ish pulses will run throughout the example
	sp.par(~one);

	// scales in sequence with pauses
	sp.seq(~two);

	sp.wait(0.4);

	sp.seq(Ppar([~three, ~four]));

	sp.wait(3);

	sp.seq(~five);

	// scales overlaped at 0.4 second intervals
	10.do {
		sp.par(~two);
		sp.wait(0.4)
	};

	sp.wait(1.6);

	sp.suspendAll;

}).play
)