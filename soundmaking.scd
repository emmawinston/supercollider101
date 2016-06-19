//cmd + enter to run
(freq: 1000).play;

//how to stop?
//cmd + .
{SinOsc.ar(freq: 1002)}.play;

//cmd shift p clears the post window

// patterns

//pbind playing middle c
Pbind().play;

// pbind playing d
Pbind(\degree, 1).play;

// pbind playing e
Pbind(\degree, 2).play;

// pbind playing f
Pbind(\degree, 3, \dur, 0.2, \octave, 4).play;

// pbind playing f
Pbind(\degree, -5, \dur, 0.1, \octave, 5, \amp, 1).play;

//pbind chord
Pbind(\degree, [0,3,5,7,8], \amp, 0.2, \dur, 0.2).play;

//degree 2s or 2b works as sharp or flat

//using midi notes
Pbind(\midinote, 61).play;

//using microtones
Pbind(\midinote, 61.5).play;

//using frequency
Pbind(\freq, 440).play;

//using note treats C as 0
Pbind(\note, 0).play; 