/* how to connect a midi device





*/

// run once at beginning to open midi connections
MIDIIn.connectAll;

MIDIFunc.trace(false); //allows you to troubleshoot because it prints everything coming in, when true

MIDIdef.noteOn(\banana, { arg vel, note; [vel, note].postln }); //note is the note number, vel is how hard is it pressed. capture all the note on messages, take their velocity and note info and do something with it.

//play a pbind
(
MIDIdef.noteOn(\banana, { arg vel, note;
	var list = note * [1, 1.05, 1.2, 1.1, 1.54, 1.45];
	Pbind(
		\midinote, note,
		// \midinote, Pseries(note, 2, 10), // allows it to become a whole phrase per key
		\dur, 1
	).play;
	[vel, note].postln;

});
)

b = Buffer.read(s, "path/to/file");
b.play;
(
MIDIdef.noteOn(\banana, {arg vel, note;
	{PlayBuf.ar(1, b, rate: note.linlin(0, 127, 0.2, 4)) * vel.linlin(0, 127, 0, 1) * Env.perc.kr(doneAction: 2) }.play
});
) //0.2 and 4 are the slowed down version and fast version - whole chord transposed down.
//.range is used for rescaling things that are ugens - this is not a ugen but a simple number from the controller.

// for knobs and faders you use MIDIdef.cc, continuous control, rather than noteOn