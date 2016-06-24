//synthdef with adsr
SynthDef("quick2", { arg freq = 440, amp = 0.1, gate = 1;
	var snd, env;
	env = Env.adsr(0.01, 0.1, 0.3, 2, amp).kr(2, gate);
	snd = Saw.ar([freq, freq*1.5], env);
	Out.ar(0,snd)

}).add;

//play it

(
var noteArray = Array.newClear(128); //array has one slot per midi note

MIDIdef.noteOn\
)

//this is all in the midi chapter so make sure you finish it!