//first we load file into a buffer

b = Buffer.read(s, "/Users/emmawinston/Desktop/Moon Maps.wav");

//How many channels?
b.numChannels;

//Then play it:
(
{ PlayBuf.ar(
	numChannels: b.numChannels,
	bufnum: b,
	rate: MouseX.kr(-1, 4),
	loop: 0.01
)}.play
)