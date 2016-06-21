//cmd+d inside a word to get documentation on classes and methods
rrand(10, 1000)

//without using argument names
{ SinOsc.ar(440, 0, 1, 0) }.play;

//with argument names
{SinOsc.ar( freq: 440,
	phase: 0,
	mul: 1,
	add: 0) }.play;

//The numbers inside this are 'instance variables'