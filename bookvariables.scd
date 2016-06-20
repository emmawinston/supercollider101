//variables page 12

x = 10;
y = 660;
y;
x;
x + y;
y - x;

a = "hello";
b = [0, 1, 2, 3];
c = Pbind(\note, Pwhite(0,10), \dur, 0.1);

//use these variables
a.postln;
b + 100;
c.play;
d = b * 5

~freqs = [415, 220, 440, 220, 990];
~durs = [0.1, 0.2, 0.4, 0.2, 0.1];



//environment variables
~apples = 4;
~oranges = 5;
~limes = 2;
~plantains = 1;

["citrus", ~oranges + ~limes];
["not citrus", ~plantains + ~apples];

//local variables
(
var apples = 4, oranges = 3, lemons = 8, bananas = 10;
["Citrus", oranges + lemons].postln;
["Non-citrus", bananas + apples].postln;
"End".postln;
)

~apples;
apples'

//reassignment

//assign a variable
a = 10 + 3;
a.postln;
a = 999;
a.postln;

//variable used in own reassignment
x = 10;
x = x + 1;
x.postln;