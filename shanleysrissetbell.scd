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

		partial.(1, 1, 0.5, 0);
		partial.(2, 0.9, 0.5, 1);
		partial.(1, 0.65, 0.8, 0);

	}
).add;

a = (
	type: \note,
	instrument: \risset_bell,
	freq: 500,
	dur: 10.0
);
a.play;   // play the note