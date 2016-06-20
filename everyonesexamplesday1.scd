LAB SESSION

AROUND 3:00 PM - wrap up your Pbind code
AROUND 3:10 PM - let's play everyone's demos!

// Create a short musical fragment (one minute) using Pbinds. You may try to:

* Create a sequence using fork
* Create a sequence using Pspawner
* Create a bunch of Pbinds that you can turn on/off at will (and maybe even QUANT them...)
* Pseq, Prand, Pwhite, Pser, Pxrand, Pwrand, Pshuf, Pslide, Pseries, Pgeom, Pn... (see pp. 25-28)
* Chords, scales, transposition, microtones, changing tempo, rests, legato, etc

80 minutes to create your Patterns
20-30 minutes to play them all to each other
BREAK


// Use some of the synths / examples provided.

//  Possible starting points:
http://sccode.org/1-4UI
http://sccode.org/1-4Vn

... more options: see drum synths below:

// Basic drum kit

SynthDef("hihat", {arg out = 0, amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0;
    var snd = WhiteNoise.ar(amp);
    var env = Env.perc(att, rel).kr(doneAction: 2);
    snd = HPF.ar(snd * env, ffreq);
    Out.ar(out, Pan2.ar(snd, pan));
}).add;

SynthDef("snare", {arg out = 0, amp = 0.1, sinfreq = 180, att = 0.01, rel = 0.2, ffreq = 2000, pan = 0;
    var snd1 = WhiteNoise.ar(amp);
    var snd2 = SinOsc.ar(sinfreq,0,amp);
    var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
    var sum = HPF.ar(snd1 * env, ffreq)+(snd2*env);
    Out.ar(out, Pan2.ar(sum, pan));
}).add;

SynthDef("kick", {arg out = 0, amp = 0.3, sinfreq = 60, glissf = 0.9, att = 0.01, rel = 0.45, pan = 0;
    var gliss = XLine.kr(sinfreq, sinfreq*glissf, rel);
    var snd = SinOsc.ar(gliss);
    var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
    snd = snd * env * amp;
    Out.ar(out, Pan2.ar(snd, pan));
}).add;



// Example
(
Ppar([
    Pbind(
        \instrument, "hihat",
        \dur, Pseq([Rest(1/4), 1/4], inf),
        \ffreq, 9000,
        \rel, 0.1,
        \amp, 0.2
    ),
    Pbind(
        \instrument, "kick",
        \dur, 1/2,
        \amp, 0.9,
        \rel, 0.12,
        \glissf, 0.99
    ),
        Pbind(
        \instrument, "snare",
        \dur, Pseq([Rest(1/2), 1/2], inf),
        \amp, 0.25,
        \rel, 0.1
    )
]).play;
)


// copy your stuff here on top with your name

// N

//Elliott

(

// Train
~train = Pbind(
        \degree, Pseq([[1, 2, 5, 6, 10, 9, 8], [3, 5, 8], [2, 3, 4], [1, 2, 3]], inf),
        \octave, 3,
        \dur, 0.12,
        \legato, 0.1
);


// Iraq scale
~iraq = Pbind(
        \scale, Scale.iraq,
        \degree, Pseq([1, 8, 4, Pwhite(0, 8, 1), 6, 7, 8], inf),
//        \octave, Pseq([3, 3, 3, 5], inf),
        \dur, Pseq([0.8, Rest(3), 0.67, 0.5, 0.42], inf),
        \legato, 0.1
);

)

(

var it = TempoClock(180/60);

{
        ~tr = ~train.play(it);
        5.wait;
        ~ir = ~iraq.trace.play(it);
        15.wait;
        ~ir.stop;
        ~tr.stop;

}.fork;
)



//james

(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1;

var env, snd;
env = Env.linen(0, decay, 0).kr(doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: dampen);
    Out.ar(0, [snd, snd]);
}).add;
)

{
                SynthDef("noise-quneo-2", {arg freq = 1000, pulseFreq = 10, amp = 0.1, rq = 0.001, att = 0.01, dec = 0.3, sus = 1, rel = 1, gate = 1;
                        var snd, env;
                        env = EnvGen.kr(Env.adsr(att, dec, sus, rel), gate: gate, doneAction: 2);
                        snd = BPF.ar(
                                in: WhiteNoise.ar(Select.ar(In.kr(whichBus),
                                        [
                                                Impulse.ar(pulseFreq),
                                                LFPulse.ar(pulseFreq,0,0.5) * 0.01
                                        ]
                                )),
                                freq: freq,
                                rq: Lag.kr(rq, 1));
                        snd = snd * env * Lag.kr(amp, 1) * 100;
                        snd = Clip.ar(snd, -0.5, 0.5);
                        Out.ar(0, [snd, snd]);
                }).add;

                SynthDef(\amp, {arg inbus=0, amp = 0.1;
                        ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
                }).add;

                // Wait for SynthDefs to be added...
                s.sync;

                // Now call the Master Out Synth:
                masterOut = Synth("amp", addAction: \addToTail);

        }.fork;
(
b = Pbind(
        \instrument, "noise-quneo-2",
        \scale, Scale.partch_o1,
        \degree, Pwhite(10, -10),
        \amp, 1,
        \legato, 10
)
);

(
c = Pbind(
        \degree, Pwhite(-20, -10),
        \scale, Scale.partch_o1,
        \amp, 0.4,
        \legato, 10,
        \dur, 10,
        \reverb, 5
)
);


(
d = Pbind(
                \instrument, "noise-quneo-2",
        \scale, Scale.partch_o1,
        \degree, Pwhite(10, 20) + Pwrand([0, 10], [0, 5], inf),
                \pulseFreq, Pwhite(5,20),
                \dur, 0.5,
                \amp, 0.03,
                \rq, 0.02,
        \legato, 4,
        \reverb, 10

)
);

(
e = Pbind(
                \instrument, "noise-quneo-2",
        \scale, Scale.partch_o1,
        \degree, Pwhite(10, 20) + Pwrand([0, 12], [0.5, 0.5], inf),
                \pulseFreq, Pwhite(5,20),
                \dur, 0.1,
                \amp, 0.2,
                \rq, 0.02,
        \reverb, 10

);
)

(
f = Pbind(
    \instrument, "plucking",
        \scale, Scale.partch_o1,
    \freq, Pwhite(10, 20),
    \amp, 0.03,
    \decay, 10,
    \dampen, 0.1,
    \dur,5
);
)

//melodic
x = b.play(quant: 1);
x.pause;
x.resume;

//bass
z = c.play(quant: 6);
z.pause;
z.resume;

//clicky
j = d.play(quant: 4);
j.pause;
j.resume;

//click faster
k = e.play(quant: 4);
k.pause;
k.resume;

//"bell"
l = f.play(quant: 6);
l.pause;
l.resume;



//sequence?

(
k.play;
)

(
k.pause;
)

(
l.play(quant: 8);
z.play(quant: 8);
)

(
j.play(quant: 2);
)

(
j.pause;
)

(
l.play(quant: 8);
x.play(quant: 8);
j.play(quant: 10);
)

(
x.pause;
j.play(quant: 2);
)

(
j.pause;
l.play(quant: 8);
)

(
z.pause;
)

(
l.pause;
)

//Emil
(
{

Pbind(
    \instrument, "plucking",
    \freq, 880,
    \amp, 0.1,
    \decay, 3,
    \dampen, 0.5,
        \dur, Pgeom(1, 0.9, 100)
).play;

        10.wait;

Pbind(
        \degree, 6,
        \dur, Pseq([0.009], 1500),
        \amp, 0.05
).play;


Pbind(
        \degree, 2,
        \dur, Pseq([0.0095], 1500),
        \amp, 0.05
).play;

        2.wait;

Pbind(
        \instrument, "plucking",
        \freq, 230 + (Pwhite( 0, 10.0) * Prand([-1, 1], inf)),
        \amp, 0.15,
        \dampen, 0.5,
        \dur, Pgeom(1, 0.95, 150)
).play;

        5.wait;

Pbind(
        \instrument, "plucking",
        \freq, Pwrand([60, 120, 180, 240, 300], [0.3, 0.2, 0.2, 0.1, 0.1], 25),
        \amp, 0.1,
        \decay, 5,
        \dur, Prand([0.5, 1], inf)
).play;

        10.wait;

Pbind(
        \instrument, "plucking",
        \freq, 900 + (Pwhite( 0, 10.0) * Prand([-1, 1], inf)),
        \amp, 0.1,
        \dur, Pgeom(1, 0.9, 150)
).play;


Pbind(
        \degree, Pslide([0, 3, 5, 4, 6 , 7, 2, 1, 5, -1], 5, 10, -1),
        \legato, 5,
        \octave, 9,
        \dur, 0.2
).play;

}.fork;
)

// Karoline
(
SynthDef(\kalimba, {
    |out = 0, freq = 440, amp = 0.1, mix = 0.1|
    var snd, click;
    // Basic tone is a SinOsc
    snd = SinOsc.ar(freq) * EnvGen.ar(Env.perc(0.01, Rand(3.0, 4.0), 1, -7), doneAction: 2);
        snd = HPF.ar( LPF.ar(snd, 380), 120);
    // The "clicking" sounds are modeled with a bank of resonators excited by enveloped white noise
        click = DynKlank.ar(`[
        // the resonant frequencies are randomized a little to add variation
        // there are two high resonant freqs and one quiet "bass" freq to give it some depth
        [240*ExpRand(0.97, 1.02), 2020*ExpRand(0.97, 1.02), 3151*ExpRand(0.97, 1.02)],
        [-9, 0, -5].dbamp,
        [0.8, 0.07, 0.08]
        ], BPF.ar(PinkNoise.ar, 6500, 0.1) * EnvGen.ar(Env.perc(0.001, 0.01))) * 0.1;
        snd = (snd*mix) + (click*(1-mix));
        snd = Mix( snd );
    Out.ar(out, Pan2.ar(snd, 0, amp));
}).add;
)
(

t= TempoClock(120/60);
{

Pbind(
                \instrument, "kalimba",
                \degree, Pseq([0,3,5,7,9,11,14,17], inf),
            \octave, Prand([2,3,4], inf),
           \dur, 0.5,
                \amp, Pwhite(0.1, 0.5)

        ).play(t);

        8.wait;

Pbind(
        \instrument, "kalimba",
        \degree, Prand([0,3,5,7,9,11,14,17, [0,2,5]], inf),
        \octave, 7,
        \dur,0.5,
        \amp, Pwhite(0.6, 1)
    ).play(t);


12.wait;

Pbind(
                \instrument, "kalimba",
            \degree, Pseq([0,[3,5],7,[9,11],14,17], inf) + Pwrand([0, 5], [0.6, 0.1], inf),
                \dur, 0.5,
           \amp, Pwhite( 0.4, 0.6)

).play(t);

}.fork(t);

)

// Jackie:
(
// =================
// definitions
// =================

SynthDef("hihat", {arg out = 0, amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0;
        var snd = WhiteNoise.ar(amp);
        var env = Env.perc(att, rel).kr(doneAction: 2);
        snd = HPF.ar(snd * env, ffreq);
        Out.ar(out, Pan2.ar(snd, pan));
}).add;

// scale and tempo values
~scale = Scale.indian;
~chords = [1, [1, 3, 5], 2, [2, 5, 7], 3, [3, 6], 4, [4, 6, 2]];
t = 120/60;

// =================
// create Pbinds
// =================
a = Pbind( // scale and chords test
        \scale, ~scale,
        \degree, Pseq(~chords, inf),
        \dur, 1,
        \amp, 0.25,
        \tempo, t
);

b = Pbind( // improvisation
        \scale, ~scale,
        \degree, Pxrand((5..9), inf),
        \dur, Pwrand([Pseq([1/4], 5), Rest(1/2), 1/2, Rest(1), 2], [ 0.5, 0.2, 0.1, 0.1, 0.1], inf),
        \amp, 0.25,
        \tempo, t
);

c = Pbind( // bass pattern
        \scale, ~scale,
        \degree, Pxrand(~chords, inf),
        \dur, Pxrand([
                Pseq([1, Rest(1), 1, Rest(1), 1, 1, Rest(1/2), 1/2, 1/2, 1/2], inf),
                Pseq([1, Rest(1), 1, Rest(1), 1, 1, Rest(1/2), 1/2, Rest(1/2), 1/2], inf),
                Pseq([1, Rest(1), 1, Rest(1), 1, 1, 2/3, 2/3, 2/3], inf),
        ], inf),
        \amp, 0.25,
        \tempo, t
);

d = Pbind( // last chord
        \scale, ~scale,
        \degree, [0, 3, 5, 8],
        \dur, 2,
        \amp, 0.25,
        \tempo, t
);

e = Pbind( // percussion
        \instrument, "hihat",
        \dur, Pseq([Rest(1/2), Pseq([1/8], 4)], inf),
        \ffreq, 10000,
        \rel, 0.7,
        \amp, 0.1
);

// =================
// run piece
// =================
{
        //~test = a.play(quant: 1);
        ~perc = e.play(quant: 1);
        ~bass = c.play(quant: 1);
        (t*4).wait; // 2 measures
        ~improv = b.play(quant: 1);
        (t*20).wait; // 5 measures
        ~bass.stop;
        ~improv.stop;
        ~perc.stop;
        (t*0.2).wait;

        ~end = d.play; // end the piece
        (t).wait;
        ~end.stop;
}.fork;
)

//Emma W

// lab session 1

(
t = TempoClock(60/60);
{
         ~bells = Pbind(
                \scale, Scale.locrian,
                \degree, Pwhite(20, 30, 16),
                \octave, 3,
                \amp, Pseq([Pwhite(0.2, 0.4)]),
                \dur, Pwhite(1, 3.0),
                \legato, 20
        ).play(t, quant: 1);

        16.wait;

        ~bass = Pbind(
                \scale, Scale.locrian,
                \degree, Pwhite(20, 30, 8),
                \dur, Pwhite(1, 4),
                \legato, 10,
                \amp, 0.6,
                \octave, 0
        ).play(t, quant: 1);

        16.wait;

        ~ostinato = Pbind(
                \scale, Scale.locrian,
                \degree, Pseq([0, 5], 62),
                \dur, 0.2,
                \amp, 0.4
        ).play(t, quant: 1);

        12.wait;

        ~secondostinato = Pbind(
                \scale, Scale.locrian,
                \note, Pseq([[0,3],[5,8]], 64),
                \dur, 0.1,
                \amp, 0.3
        ).play(t, quant: 0.5);

        2.wait;

        ~bells.stop;
        ~bass.stop;
}.fork(t);
)


// Katie:

(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1;

var env, snd;
env = Env.linen(0, decay, 0).kr(doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: dampen);
    Out.ar(0, [snd, snd]);
}).add;
)


(
a = Pbind(
    \instrument, "plucking",
    \amp, Pwhite(0.2, 0.3),
    \dampen, Pseq([0.45, 0.3, 0.3, 0.2], inf),
    \dur, Prand([0.9, 0.8, 0.7], inf)
).play;
)

(
b = Pbind(
        \instrument, "plucking",
        \degree, Pseq([
                [-7, 20, 4], // chord 1
                [0, 3, 5] // chord 2
        ], inf),
    \amp, 0.5,
    \decay, 12,
    \dampen, 0.1,
);
)

(
c = Pbind(
                \instrument, "plucking",
                \degree, Prand([0,3,5,7,9], inf) - 20,
                \pulseFreq, Pwhite(1, 9),
                \dur, 0.3,
                \sustain, 0.1,
                \amp, 2,
);
)

(
d=Pbind(
                \instrument, "plucking",
                \degree, Pseq([0,3,5,7], inf),
                \pulseFreq, Pwhite(1, 2),
                \dur, 0.10,
                \amp, 1,
                \rq, 0.01);
);
)

(
f=Pbind(
                \instrument, "plucking",
                \scale, Scale.phrygian,
                \degree, Pseq([0,3,5,7,9,11,14,17], inf),
                \pulseFreq, Pwhite(3, 30),
                \dur, 0.33,
                \amp, 4,ning
represents a musical tuning
Source: /Users/katie_vida/Downloads/The Time Is Now_/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary/Common/Collections/Scale.sc
Inherits from: Object
See also: Scale
Description
Represents a musical tuning (e.g. equal temperament, just intonation, etc.). Used in conjunction with Scale to generate pitch information.
);
)

(
g=Pbind(
                \instrument, "plucking",
                \degree, Pseq([7,8,6,5,4], inf),
                \pulseFreq, 0.5,
                \dur, Pseq( (0.1!10) ++ (0.2!8)   , inf),
                \amp, 0.10,
                \rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));
);
)


(
{
        ~player1 = a.play;
        4.wait;
        ~player2 = b.play;
        10.wait;
        ~player3 = f.play;
        4.wait;
        ~player4 = c.play;
        3.wait;
        ~player5 = g.play;
        7.wait;
        ~player6 = d.play;
        10.wait;
        ~player1.stop;
        4.wait;
        ~player6.stop;
        ~player5.stop;
        2.wait;
        ~player4.stop;
        1.wait;
}.fork
)






// Emma

s.waitForBoot({

        var win, buttonArray, padsArray, patternArray, volumeSlider, menu, whichBus, masterOut = 0.1;

        padsArray = Array.newClear(4);
        patternArray = Array.newClear(4);

        /*~masterOut = 0.1;*/

        whichBus = Bus.control(s, 1);
        whichBus.value = 0;

        Window.closeAll;
        s.meter;
        win = Window.new("Subtractive Synthesis - Patterns of Filtered Noise", Rect(450, 160, 480, 200)).front;

        win.background = Color.black;
        win.alpha = 0.85;

        // Change the gaps and margins to see how they work
        win.view.decorator = FlowLayout(win.view.bounds, margin: 10@10, gap: 20@20 );

        buttonArray = Array.fill(4, {Button(win.view, 100@100)});

        buttonArray.do({arg item, count;
                item.states = [[], [[], Color.black, Color.rand]]});

        buttonArray.do({arg item, count;
                item.action = {arg state;
                        case
                        {state.value==1} {padsArray[count] = patternArray[count].play}
                        {state.value==0} {padsArray[count].stop}
        }});

        // subwin = CompositeView(win, Rect(0, 0, 460, 50));
        // subwin.background = Color.rand;

        // Noise Source menu
        // menu = PopUpMenu(win, 80 @ 35);
        // menu.items = ["Pop", "Rasp"];
        // menu.action = {arg menu;
        // case
        // {menu.value==0} {whichBus.set(0.0)}
        // {menu.value==1} {whichBus.set(1.0)}};

        volumeSlider = EZSlider(
                parent: win,
                bounds: 355 @ 35,
                label: "VOLUME",
                controlSpec: ControlSpec(-40, 3, \lin, 0.01, -12, "dB"),
                action: {|ez| masterOut.set(\amp, ez.value.dbamp)},
                unitWidth: 30)
        .setColors(
                stringColor: Color.green,
                sliderBackground: Color.grey(0.9),
                numNormalColor: Color.grey);


        // Patterns

        patternArray[0] = Pbind(
                \instrument, "noise-quneo-2",
                \freq, Pwhite(3000, 5000),
                \pulseFreq, Pwhite(5, 20),
                \dur,  Pwhite(0.3, 0.5),
                \amp, Pwhite(0.1, 0.5),
                \rq, Pwhite(0.05, 0.06));

        patternArray[1] =Pbind(
        \instrument, "kick",
                \dur, Pseq([Rest(1/16), Pwhite(1/8,1/32)], inf),
                \ffreq, Pwhite(100,300),
                \rel, Pwhite(0.6,0.9),
        \amp, Pwhite(0.2,0.8)
    );

        patternArray[2] = Pbind(
                \instrument, "noise-quneo-2",
                \degree, Prand([0,2,4,6,8,10,12,14], inf) - 12,
                \pulseFreq, Pwhite(1, 10),
                \dur, 0.5,
                \sustain, 0.9,
                \amp, 1,
                \rq, 0.1);

        patternArray[3] = Pbind(
                \instrument, "noise-quneo-2",
                \freq, Pwhite(5000, 10000),
                \pulseFreq, Pwhite(5, 20),
                \dur,  Pwhite(0.3, 0.5),
                \amp, Pwhite(0.1, 0.4),
                \rq, Pwhite(0.001, 0.001));

        // patternArray[5] = Pbind(
        // \instrument, "noise-quneo-2",
        // \scale, Scale.phrygian,
        // \degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
        // \pulseFreq, Pwhite(5, 19),
        // \dur, 0.33,
        // \amp, 1,
        // \rq, Pwhite(0.005, 0.01));

        // patternArray[6] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \scale, Scale.phrygian,
        //         \degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
        //         \pulseFreq, 0.5,
        //         \dur, Pseq( (0.1!60) ++ (0.2!8)   , inf),
        //         \amp, 1,
        // \rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));
        //
        // patternArray[7] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \freq, Pwhite(1000, 9500),
        //         \pulseFreq, Pwhite(5, 10),
        //         \dur, 0.3,
        //         \amp, Pwhite(0.1, 0.5),
        // \rq, Pwhite(0.001, 0.05));
        //
        // patternArray[8] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \degree, Pshuf([4,3,5,7,9,11,14,17], inf),
        //         \pulseFreq, Pwhite(1, 9),
        //         \dur, 0.3,
        //         \amp, 1,
        // \rq, 0.01);
        //
        // patternArray[9] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \note, Prand([0,3,5,7,9,11,14,17], inf),
        //         \pulseFreq, Pwhite(1, 9),
        //         \dur, 0.3,
        //         \sustain, 0.1,
        //         \amp, 1,
        // \rq, 0.1);
        //
        // patternArray[10] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \degree, Pxrand([0,3,5,7,9,11,14,17], inf) - 12,
        //         \pulseFreq, Pwhite(1, 9),
        //         \dur, Pseq([0.2, 0.1, 0.2, 0.4], inf) * Pwhite(1, 4),
        //         \sustain, 0.2,
        //         \amp, Pwhite(0.3, 0.6),
        // \rq, Prand([0.05, 0.1], inf));
        //
        // patternArray[11] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \scale, Scale.phrygian,
        //         \degree, Pseq([0,5,9,3,7,11], inf),
        //         \pulseFreq, Pwhite(5, 19),
        //         \dur, 0.3,
        //         \amp, 1,
        // \rq, Pwhite(0.005, 0.01));
        //
        // patternArray[12] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \scale, Scale.phrygian,
        //         \degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 12], [0.5, 0.5], inf),
        //         \pulseFreq, Pwhite(1, 19),
        //         \dur, 0.43,
        //         \amp, 1,
        // \rq, Pwhite(0.005, 0.01));
        //
        // patternArray[13] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \scale, Scale.locrian,
        //         \degree, Pseq([7,8,6,5,4,3,2,1,0,4], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
        //         \pulseFreq, 0.5,
        //         \dur, Pseq( (0.1!10) ++ (0.2!8)   , inf),
        //         \amp, 0.6,
        // \rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));
        //
        // patternArray[14] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \degree, Pxrand([1,3,4,7], inf) + 24,
        //         \pulseFreq, Pwhite(1, 9),
        //         \dur, Pseq([0.2, 0.3, 0.1, 0.4], inf) * Pwhite(2, 4),
        //         \sustain, 0.6,
        //         \amp, Pwhite(0.3, 0.6),
        // \rq, Prand([0.05, 0.1], inf));
        //
        // patternArray[15] = Pbind(
        //         \instrument, "noise-quneo-2",
        //         \scale, Scale.mixolydian,
        //         \degree, Pseq([0,7,5,3,9,11,0], inf) + 12,
        //         \pulseFreq, Pwhite(5, 19),
        //         \dur, 0.5,
        //         \amp, 0.5,
        // \rq, Pwhite(0.05, 0.09));

        // SynthDefs

        {
                SynthDef("noise-quneo-2", {arg freq = 1000, pulseFreq = 10, amp = 0.1, rq = 0.001, att = 0.01, dec = 0.3, sus = 1, rel = 1, gate = 1;
                        var snd, env;
                        env = EnvGen.kr(Env.adsr(att, dec, sus, rel), gate: gate, doneAction: 2);
                        snd = BPF.ar(
                                in: WhiteNoise.ar(Select.ar(In.kr(whichBus),
                                        [
                                                Impulse.ar(pulseFreq),
                                                LFPulse.ar(pulseFreq,0,0.5) * 0.01
                                        ]
                                )),
                                freq: freq,
                                rq: Lag.kr(rq, 1));
                        snd = snd * env * Lag.kr(amp, 1) * 100;
                        snd = Clip.ar(snd, -0.5, 0.5);
                        Out.ar(0, [snd, snd]);
                }).add;

                SynthDef(\amp, {arg inbus=0, amp = 0.1;
                        ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
                }).add;


                // Added synth defs (Emma)

                SynthDef("hihat", {arg out = 0, amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0;
                        var snd = WhiteNoise.ar(amp);
                        var env = Env.perc(att, rel).kr(doneAction: 2);
                        snd = HPF.ar(snd * env, ffreq);
                        Out.ar(out, Pan2.ar(snd, pan));
                }).add;


                SynthDef("snare", {arg out = 0, amp = 0.1, sinfreq = 180, att = 0.01, rel = 0.2, ffreq = 2000, pan = 0;
                        var snd1 = WhiteNoise.ar(amp);
                        var snd2 = SinOsc.ar(sinfreq,0,amp);
                        var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
                        var sum = HPF.ar(snd1 * env, ffreq)+(snd2*env);
                        Out.ar(out, Pan2.ar(sum, pan));
                }).add;

                SynthDef("kick", {arg out = 0, amp = 0.3, sinfreq = 60, glissf = 0.9, att = 0.01, rel = 0.45, pan = 0;
                        var gliss = XLine.kr(sinfreq, sinfreq*glissf, rel);
                        var snd = SinOsc.ar(gliss);
                        var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
                        snd = snd * env * amp;
                        Out.ar(out, Pan2.ar(snd, pan));
                }).add;


                // Wait for SynthDefs to be added...
                s.sync;

                // Now call the Master Out Synth:
                masterOut = Synth("amp", addAction: \addToTail);

        }.fork;

        win.onClose = {
                padsArray.do{ |item, count| padsArray[count].stop};
                Window.closeAll;
                //masterOut.free;
                "Done!".postln;
        };

        CmdPeriod.doOnce({Window.closeAll});

        "Subtractive Synthesis Demo 2".postln;
        "".postln;

        {
                2.wait;
                {buttonArray[0].valueAction=1}.defer;
                6.wait;
                {buttonArray[3].valueAction=1}.defer;
                6.wait;
                {buttonArray[3].valueAction=0}.defer;
                3.wait;
                {buttonArray[2].valueAction=1}.defer;
                6.wait;
                {buttonArray[1].valueAction=1}.defer;
                5.wait;
                {buttonArray[3].valueAction=1}.defer;
                5.wait;
                {buttonArray[1].valueAction=0}.defer;
                6.wait;
                {buttonArray.do({arg button; button.valueAction = 0})}.defer;

        }.fork;

}); // end of block








(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1;

var env, snd;
env = Env.linen(0, decay, 0).kr(doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: dampen);
    Out.ar(0, [snd, snd]);
}).add;
)

(
Pbind(
        \degree, Pseq([-10,-7],inf),
        \amp, Pseq([0.4,0.6],inf),
        \legato, 0.3,
        \dur, 0.5
).play(quant:0.25);
)

(
Pbind(
        \degree, Pseq([1,4],inf),
        \amp, 0.3,
        \legato, 0.3,
        \dur, 2
).play(quant:0.33);
)

(
Pbind(
        \freq, 66,
        \amp, 1,
        \dur, 50
).play(quant:0.25);
)





//========================================

)

(
~blinking=
Pbind(

        \instrument, "plucking",
        \freq, [50,80,100],
        \decay, 1,
        \amp, 0.1,
        \dampen, 0.9,
        \dur, 0.15
);
)




(
~blinking2=
Pbind(

        \instrument, "plucking",
        \freq, [300,600],
        \decay, 1,
        \amp, 0.1,
        \dampen, 0.9,
        \dur, 0.15
);)

(
~blinking3=
Pbind(

        \instrument, "plucking",
        \freq, [30,20],
        \decay, 1,
        \amp, 0.1,
        \dampen, 0.9,
        \dur, 0.12
);)




(
~highNote=
Pbind(
    \instrument, "plucking",
    \freq, Pwhite(1000, 2000),
        \decay, 4,
    \amp, 0.1,
    \dampen, 0.6,
    \dur, 0.1
);
)



~player1 = ~highNote.play;
~player1.stop;

~player2 = ~blinking2.play(TempoClock(70/100));
~player2.stop;


({
        ~player = ~blinking.play(TempoClock(100/60));
        1.wait;
        ~player.stop;
}.fork)

({
        ~player = ~blinking.play(TempoClock(100/60));
        0.5.wait;
        ~player.stop;
}.fork)


({
        ~player3 = ~blinking3.play(TempoClock(80/60));
        1.wait;
        ~player3.stop;
}.fork)



({
        ~player = ~blinking3.play(TempoClock(80/60));
        4.wait;
        ~player.stop;
}.fork)

// Shuqi

t = TempoClock(120/60);

        buttonArray.do({arg item, count;
                item.action = {arg state;
                        case
                        {state.value==1} {padsArray[count] = patternArray[count].play(t, quant:6.75)}
                        {state.value==0} {padsArray[count].stop}
        }});


patternArray[0] = Pbind(
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[1] = Pbind(
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                 \decay, Pwhite(7, 12),
        \dampen, Pwhite(0.01, 0.1),
                \letago, 3,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[2] = Pbind(
                \instrument, "plucking",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[3] = Pbind(
                \instrument, "basicFM",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[4] =  Pbind(
                \instrument, "plucking",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                 \decay, Pwhite(7, 12),
        \dampen, Pwhite(0.01, 0.1),
                \letago, 3,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[5] = Pbind(
                \instrument, "hihat",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[6] = Pbind(
                \instrument, "noise-quneo-2",
                \scale, Scale.phrygian,
                \degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
                \pulseFreq, 0.5,
                \dur, Pseq( (0.1!60) ++ (0.2!8)   , inf),
                \amp, 0.5,
                \rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));

        patternArray[7] = Pbind(
                \instrument, "kick",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[8] = Pbind(
                \instrument, "snare",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[9] = Pbind(
                \instrument, "noise-quneo-2",
                \note, Prand([0,3,5,7,9,11,14,17], inf),
                \pulseFreq, Pwhite(1, 9),
                \dur, 0.3,
                \sustain, 0.1,
                \amp, 0.5,
                \rq, 0.1);

        patternArray[10] = Pbind(
                \instrument, "plucking",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[11] = Pbind(
                \instrument, "noise-quneo-2",
                \scale, Scale.phrygian,
                \degree, Pseq([0,5,9,3,7,11], inf),
                \pulseFreq, Pwhite(5, 19),
                \dur, 0.3,
                \amp, 0.5,
                \rq, Pwhite(0.005, 0.01));

        patternArray[12] = Pbind(
                \instrument, "noise-quneo-2",
                \scale, Scale.phrygian,
                \degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 12], [0.5, 0.5], inf),
                \pulseFreq, Pwhite(1, 19),
                \dur, 0.43,
                \amp, 0.5,
                \rq, Pwhite(0.005, 0.01));

        patternArray[13] = Pbind(
                \instrument, "plucking",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 0.5,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[14] = Pbind(
                \instrument, "\scansynth1",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \amp, 1,
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf));

        patternArray[15] = Pbind(
                \instrument, "sillyVoice",
                \degree, Pseq([8, 7, 2, 3, 6, 5, 0, 1, 5, 4, -1, 1, 4] , inf),
                \dur, Pseq([Pseq([1/4, 1/2, 1/2, 1/2], 3),3/2],inf),
                \ctranspose, -14,
                \vibratoSpeed, Pwhite(5,7),
        \vibratoDepth, 4,
                \amp, 1);

        // SynthDefs

        {
                SynthDef("noise-quneo-2", {arg freq = 1000, pulseFreq = 10, amp = 0.1, rq = 0.001, att = 0.01, dec = 0.3, sus = 1, rel = 1, gate = 1;
                        var snd, env;
                        env = EnvGen.kr(Env.adsr(att, dec, sus, rel), gate: gate, doneAction: 2);
                        snd = BPF.ar(
                                in: WhiteNoise.ar(Select.ar(In.kr(whichBus),
                                        [
                                                Impulse.ar(pulseFreq),
                                                LFPulse.ar(pulseFreq,0,0.5) * 0.01
                                        ]
                                )),
                                freq: freq,
                                rq: Lag.kr(rq, 1));
                        snd = snd * env * Lag.kr(amp, 1) * 100;
                        snd = Clip.ar(snd, -0.5, 0.5);
                        Out.ar(0, [snd, snd]);
                }).add;

                SynthDef(\amp, {arg inbus=0, amp = 0.1;
                        ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
                }).add;

             SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1;
             var env, snd;
            env = Env.linen(0, decay, 0).kr(doneAction: 2);
            snd = Pluck.ar(
                in: WhiteNoise.ar(amp),
                trig: Impulse.kr(0),
                maxdelaytime: 0.1,
                delaytime: freq.reciprocal,
                decaytime: decay,
                coef: dampen);
                Out.ar(0, [snd, snd]);
         }).add;

                 SynthDef("hihat", {arg out = 0, amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0;
    var snd = WhiteNoise.ar(amp);
    var env = Env.perc(att, rel).kr(doneAction: 2);
    snd = HPF.ar(snd * env, ffreq);
    Out.ar(out, Pan2.ar(snd, pan));
}).add;

SynthDef("snare", {arg out = 0, amp = 0.1, sinfreq = 180, att = 0.01, rel = 0.2, ffreq = 2000, pan = 0;
    var snd1 = WhiteNoise.ar(amp);
    var snd2 = SinOsc.ar(sinfreq,0,amp);
    var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
    var sum = HPF.ar(snd1 * env, ffreq)+(snd2*env);
    Out.ar(out, Pan2.ar(sum, pan));
}).add;

SynthDef("kick", {arg out = 0, amp = 0.3, sinfreq = 60, glissf = 0.9, att = 0.01, rel = 0.45, pan = 0;
    var gliss = XLine.kr(sinfreq, sinfreq*glissf, rel);
    var snd = SinOsc.ar(gliss);
    var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
    snd = snd * env * amp;
    Out.ar(out, Pan2.ar(snd, pan));
}).add;

         SynthDef(\basicFM, {|out = 0, gate = 1, amp = 1, carFreq = 1000, modFreq = 100, modAmount = 2000, clipAmount = 0.1|
                var modEnv = EnvGen.ar(Env.adsr(0.5, 0.5, 0.7, 0.1, peakLevel: modAmount), gate);
                var mod = SinOsc.ar(modFreq) * modEnv;
                var car = SinOsc.ar(carFreq + mod);
                var ampEnv = EnvGen.ar(Env.adsr(0.1, 0.3, 0.7, 0.2, peakLevel: amp), gate, doneAction: 2);
                var clip = clipAmount * 500;
                Out.ar(out, (car * ampEnv * clip).clip(-0.7, 0.7) * 0.1);
        }).add;

                SynthDef(\scansynth1, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
    var in, ou;
    var spring = (0.12).dup(40);
    var damp = (0.0564812).dup(40);
    var springs;
    var sel;
    in = LPF.ar(LocalIn.ar(1), XLine.ar(1,10,0.3)) * 0.97 + (LPF.ar(Trig.ar(gate, 0.01),200) * WhiteNoise.ar.range(0.98,1));
    ou = in;
    springs = spring.collect { arg spr, i;
        ou = Spring.ar(ou, spr, damp[i]);
    };
    LocalOut.ar(ou);
    sel = VarSaw.ar(freq * [0.999,1,0.499,2,1.01] * 0.5, width: LFNoise2.ar(1/2).range(0.2,0.5)).range(0, spring.size-1);
    ou = Splay.ar(SelectX.ar(sel, springs), 1);
    ou = ou * EnvGen.ar(\adsr.kr(Env.adsr(0.3,0.1,0.8,0.1)),gate,doneAction:2);
    ou = Pan2.ar(ou, pan, amp);
    Out.ar(out, ou);
}).add;

                SynthDef(\sillyVoice, { arg
        freq = 220,
        amp = 0.5,
        vibratoSpeed = 6,
        vibratoDepth = 4,
        vowel = 0,
        att = 0.01,
        rel = 0.1,
        lag = 1,
        gate = 1;

        var in, vibrato, env, va, ve, vi, vo, vu, snd;

        vibrato = SinOsc.kr(vibratoSpeed, mul: vibratoDepth);
        in = Saw.ar(Lag.kr(freq, lag) + vibrato);
        env = EnvGen.kr(Env.asr(att, 1, rel), gate, doneAction: 2);

        va = BBandPass.ar(
                in: in,
                freq: [ 600, 1040, 2250, 2450, 2750 ],
                bw: [ 0.1, 0.067307692307692, 0.048888888888889, 0.048979591836735, 0.047272727272727 ],
                mul: [ 1, 0.44668359215096, 0.35481338923358, 0.35481338923358, 0.1 ]);

        ve = BBandPass.ar(
                in: in,
                freq: [ 400, 1620, 2400, 2800, 3100 ] ,
                bw: [ 0.1, 0.049382716049383, 0.041666666666667, 0.042857142857143, 0.038709677419355 ],
                mul: [ 1, 0.25118864315096, 0.35481338923358, 0.25118864315096, 0.12589254117942 ]);

        vi = BBandPass.ar(
                in: in,
                freq: [ 250, 1750, 2600, 3050, 3340 ] ,
                bw: [ 0.24, 0.051428571428571, 0.038461538461538, 0.039344262295082, 0.035928143712575 ],
                mul: [ 1, 0.031622776601684, 0.15848931924611, 0.079432823472428, 0.03981071705535 ] );

        vo = BBandPass.ar(
                in: in,
                freq:[ 400, 750, 2400, 2600, 2900 ] ,
                bw: [ 0.1, 0.10666666666667, 0.041666666666667, 0.046153846153846, 0.041379310344828 ],
                mul: [ 1, 0.28183829312645, 0.089125093813375, 0.1, 0.01 ]);

        vu = BBandPass.ar(
                in: in,
                freq: [ 350, 600, 2400, 2675, 2950 ],
                bw: [ 0.11428571428571, 0.13333333333333, 0.041666666666667, 0.044859813084112, 0.040677966101695 ],
                mul: [ 1, 0.1, 0.025118864315096, 0.03981071705535, 0.015848931924611 ]);
        snd = SelectX.ar(Lag.kr(vowel, lag), [va, ve, vi, vo, vu]);
        snd = Mix.new(snd);
        Out.ar(0, snd!2 * env * amp);
}).add;

