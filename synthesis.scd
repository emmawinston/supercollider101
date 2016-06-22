// synthesis

//theremin
{SinOsc.ar(freq: MouseX.kr(300, 2500, 1, 0), mul: MouseY.kr(0, 1))}.scope;

{SinOsc.ar}.plot;
{Saw.ar}.plot;
{Pulse.ar}.plot;

//ar is audio rate, kr is control rate and is a low freq/slowly changing control signal. kr produces one sample per control cycle so less processing power.
//kr doesn't go to your speakers but is used to control parameters

//poll method
{SinOsc.kr(1).poll}.play;
{LFPulse.kr(1).poll}.play;

{LFNoise0.ar(1).poll}.play;


//scaling ranges
{SinOsc.ar(freq: LFNoise0.kr(1).range(500, 1500), mul: 0.1)}.play;

//broken down
{LFNoise0.kr(1).poll}.play;
{LFNoise0.kr(1).range(500, 1500).poll}.play;
{LFNoise0.kr(10).range(500, 1500).poll}.play;

//EXERCISE: Write a line of code that plays a sine wave, frequency controlled by an LFPulse.kr with appropriate arguments. Then use range to scale the output of LFPulse.

{SinOsc.ar(freq: LFPulse.kr(30).range(440,1600))}.play;
