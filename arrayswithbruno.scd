// arrays with bruno

Array.fill(4, { rrand(0, 100); });

a= Array.fill(10, { rrand(440, 880)})

a;

a.do({arg item, count; [item, count].postln });

a.do({arg item, count; ("Item " ++ count ++ " is " ++ item ++ " Hz. Closest midi note is " ++ item.cpsmidi.round).postln});

a.do({arg item; { SinOsc.ar(freq: item) * 0.2 }.play});

4.do({ "nando".scramble.postln });