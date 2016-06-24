//p102-105 - order of execution

//create audio bus
~fxBus = Bus.audio(s, 1);
~masterBus = Bus.audio(s, 1);
//Create synthdefs
(
SynthDef("noise", { Out.ar (~fxBus,
	WhiteNoise.ar(0.5))}).add;

SynthDef("filter", {Out. ar(~masterBus, BPF.ar(in:
	In.ar(~fxBus), fre: MouseY.kr(1000, 5000), rq: 0.1))}).add;

SynthDef("masterOut", {arg amp = 1; Out.ar(0, In.ar(~masterBus) * Lag.kr(amp,1))}).add;
)
//open node tree window:
s.plotTree;
//play synths (watch node tree)
m = Synth("masterout");
f = Synth("filter");
n = Synth("noise");
//Master volume
m.set(\amp, 0.1);

// last synth to be run is always placed at the top of the node tree


// or explicitly tell supercollider where to place those notes

n = Synth("noise", addAction: 'addToHead)
m = Synth("masterOut", addAction: 'addToTail');
f = Synth("filter", target: n, addAction: 'addAfter');
	