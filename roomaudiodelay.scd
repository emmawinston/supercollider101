{Out.ar(0, SinOsc.ar(567)) }.play;

(
//filter
f = {
	Out.ar(0, DelayC.ar(
		in: In.ar(55),
		maxdelaytime: 3,
		delaytime: 3
	)
	)
}.play;

//source
n = { Out.ar(55, In.ar(8) ) }.play;

)