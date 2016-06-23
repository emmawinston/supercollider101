{Pulse.ar(freq: LFNoise2.kr(1).range(300, 400), mul: 0.1 )}.scope;

{SinOsc.ar(415).poll }.play;

{ Pulse.ar(freq: LFPulse.kr(MouseX.kr(5, 10)).range(180, 600) + MouseY.kr(100, 144), mul: SinOsc.kr(2.4).range(0.1, 0.5) )
}.scope;

//NOISE
(
{BPF.ar(
	in: WhiteNoise.ar(0.2), // what sound is the source you want me to filter
	freq: MouseX.kr(100, 1000),
	rq: 0.01
)
}.scope;
)