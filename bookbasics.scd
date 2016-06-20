"Hello World".postln;

{SinOsc.ar}.play;

{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;

s.volume.gui;

(freq: 1000).play;

{RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar([0.3, 0.2]).range(100, 3000), 0.02)}.play;

{RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar([300, 200]).range(100, 3000), 0.02)}.play;

(
"first line".postln;
"second line".postln;
(2+2).postln;
3+3;
"done".postln;
)

100.do({"print me".scramble.postln});