SynthDef(
  \risset_bell,
	{ |freq=440, dur=4.0, out=0|
		var partial;

		partial = { |amplitude, rel_duration, rel_freq, detune|
			OffsetOut.ar(out,
				EnvGen.kr(
					Env.perc(0.05, dur*rel_duration, amplitude*0.1, -4),
					doneAction: 0
				) * SinOsc.ar(freq*rel_freq+detune)
			);
		};

		partial.(1, 1, 0.56, 0);
		partial.(0.67, 0.9, 0.56, 1);
		partial.(1, 0.65, 0.92, 0);
		partial.(1.8, 0.55, 0.92, 1.7);
		partial.(2.67, 0.325, 1.19, 0);

	}
).add;

a = (
	type: \note,
	instrument: \risset_bell,
	freq: 500,
	dur: 10.0
);
a.play;   // play the note