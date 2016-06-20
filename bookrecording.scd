// QUICK RECORD
//Start recording

s.record;

//make sound
{Saw.ar(LFNoise0.kr([2,3]).range(100, 2000), LFPulse.kr([4,5]) * 0.1)}.play;

//stop
s.stoprecording;

//optional GUI
s.makeWindow;