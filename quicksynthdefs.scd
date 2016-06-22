~note3 = {arg freq = 415; Pulse.ar(freq: freq + MouseX.kr(-100, 100)) }.play;

~note3.set(\freq, 1000);

{ SinOsc.ar(415)}.play;
//is a shortcut to
{Out.ar(0, SinOsc.ar(415))}.play;
//is a shortcut to
SynthDef("temp", {Out.ar(0, SinOsc.ar(415)) }).play;

//define synth
SynthDef("temp", {Out.ar(0, SinOsc.ar(415)) }).add;
//then run a note
Synth("temp");

//not sure if understood or not