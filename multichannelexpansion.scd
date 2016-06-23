~myBus1 = Bus.audio(s, 2);

(
//effect - a filter
r = { Out.ar(0, FreeVerb.ar(In.ar(60), mix: 0.5, room: 0.9)) }.play;

f = {
	Out.ar(~fx, DelayC.ar(
		in: In.ar(~source),
		maxdelaytime: 3,
		delaytime: 3
	)
	)
}.play;

//source
n = { Out.ar(~source, In.ar(8) ) }.play;
)

//multichannel expansion
{ Out.ar(0, Saw.ar(freq: [440, 1000], mul: 0.1)) }.scope;

{ Out.ar(0, Saw.ar(freq: LFNoise0.kr([4, 5]).range(100,500), mul: 0.1)) }.scope;

//mixing multichannel down

(
{
	var snd;
	snd = Saw.ar(
	freq: LFNoise0.kr([4, 5, 6]).range(100,500),
	mul: 0.3);
	snd = Mix.ar(snd);
	Out.ar([0,1], snd);
}.scope;
)


//panning
(
{
	var snd;
	snd = Saw.ar(
		freq: SinOsc.kr(freq:2).range(50, 1000),
		mul: 0.3);
	snd = Pan2.ar(in: snd, pos: MouseX.kr(-1, 1));
	Out.ar(0, snd)
}.scope;
)