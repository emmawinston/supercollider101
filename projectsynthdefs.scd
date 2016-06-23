// project synthdefs

(
SynthDef("cowbell", {arg freq = 440, amp = 0.1;
	var env, snd;
	env = Env.perc.kr(doneAction:2);
	snd = Saw.ar(freq: freq * [1], mul: env);
	Out.ar([0,1], snd);
}).add;

SynthDef("flute", { arg scl = 0.2, freq = 440, ipress = 0.9, ibreath = 0.09, ifeedbk1 = 0.4, ifeedbk2 = 0.4, dur = 1, gate = 1, amp = 2;

	var kenv1, kenv2, kenvibr, kvibr, sr, cr, block;
	var poly, signalOut, ifqc;
	var aflow1, asum1, asum2, afqc, atemp1, ax, apoly, asum3, avalue, atemp2, aflute1;
	var fdbckArray;

	sr = SampleRate.ir;
	cr = ControlRate.ir;
	block = cr.reciprocal;

	ifqc = freq;

	// noise envelope
	kenv1 = EnvGen.kr(Env.new(
		[ 0.0, 1.1 * ipress, ipress, ipress, 0.0 ], [ 0.06, 0.2, dur - 0.46, 0.2 ], 'linear' )
	);
	// overall envelope
	kenv2 = EnvGen.kr(Env.new(
		[ 0.0, amp, amp, 0.0 ], [ 0.1, dur - 0.02, 0.1 ], 'linear' ), doneAction: 2
	);
	// vibrato envelope
	kenvibr = EnvGen.kr(Env.new( [ 0.0, 0.0, 1, 1, 0.0 ], [ 0.5, 0.5, dur - 1.5, 0.5 ], 'linear') );

	// create air flow and vibrato
	aflow1 = LFClipNoise.ar( sr, kenv1 );
	kvibr = SinOsc.ar( 5, 0, 0.1 * kenvibr );

	asum1 = ( ibreath * aflow1 ) + kenv1 + kvibr;
	afqc = ifqc.reciprocal - ( asum1/20000 ) - ( 9/sr ) + ( ifqc/12000000 ) - block;

	fdbckArray = LocalIn.ar( 1 );

	aflute1 = fdbckArray;
	asum2 = asum1 + ( aflute1 * ifeedbk1 );

	//ax = DelayL.ar( asum2, ifqc.reciprocal * 0.5, afqc * 0.5 );
	ax = DelayC.ar( asum2, ifqc.reciprocal - block * 0.5, afqc * 0.5 - ( asum1/ifqc/cr ) + 0.001 );

	apoly = ax - ( ax.cubed );
	asum3 = apoly + ( aflute1 * ifeedbk2 );
	avalue = LPF.ar( asum3, 2000 );

	aflute1 = DelayC.ar( avalue, ifqc.reciprocal - block, afqc );

	fdbckArray = [ aflute1 ];

	LocalOut.ar( fdbckArray );

	signalOut = avalue;

	OffsetOut.ar( 0, [ signalOut * kenv2, signalOut * kenv2 ] );

}).add;

SynthDef("prophet5", {
	arg out = 0, pan = 0.0, freq = 440, amp = 1.0, gate = 1, att = 0.01, rel = 0, sus = 1, dec = 0.5, lforate = 10, lfowidth = 0.5, cutoff = 12000, rq = 0.5;

	var lfo, pulse, filter, env;
	lfo = LFTri.kr(lforate * [1, 1.01], Rand(0, 2.0) ! 2);
	pulse = Pulse.ar(freq * [1, 1.01], lfo * lfowidth + 0.5);
	filter = RLPF.ar(pulse, cutoff, rq);
	env = EnvGen.ar(
		envelope: Env.adsr(att, dec, sus, rel, amp),
		gate: gate,
		doneAction: 2);
	Out.ar(out, Pan2.ar(
		in: Mix(filter) * env * 0.5,
		pos: pan)
	);
}).add;


)