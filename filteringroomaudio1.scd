{Out.ar(0, SinOsc.ar(567)) }.play;

(
//effect - a filter
f = {
	Out.ar(0, BPF.ar(
		in: In.ar(55),
		freq: MouseY.kr(1000, 5000),
		rq: 0.1)
	)
}.play;

//source
n = { Out.ar(55, WhiteNoise.ar(0.5)) }.play;
)