// create synthdef

(
SynthDef("wow", { arg freq = 415, amp = 0.4;

	var snd;
	snd = Pulse.ar(freq: freq + MouseX.kr(-10, 10), mul: amp);

	// Send OUT to speaker 0 (left) this thing (sine wave)
	Out.ar(0, [snd, snd]) // or snd ! 2
}).add;
)

//play it
~note1 = Synth("wow", [\freq, 440]);
~note2 = Synth("wow", [\freq, 128]);

//set new values for parameters
~note1.set(\freq, 1000, \amp, 0.2);
~note2.set(\freq, 1100, \amp, 0.1);

//stop that synth specifically
~note1.free;
~note2.free;

//view node tree
s.plotTree;

s.makeWindow;