(
SynthDef("wow", {arg freq = 440, amp = 0.1;
	var env, snd;
	env = Env.perc.kr(doneAction:2);
	snd = Saw.ar(freq: freq * [1, 1.5], mul: env);
	Out.ar(0, snd);
}).add;
)

//you may not need this construct
x = Synth("wow", [\freq, 500]);

//and just play it from Pbinds:
(
Pbind(
	\instrument, "wow",
	\amp, Pwhite(0.1, 0.5),
	\dur, Pseq([0.5, 0.25, 0.25], inf)
).play;
)