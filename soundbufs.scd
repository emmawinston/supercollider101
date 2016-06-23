//first we load file into a buffer

b = Buffer.read(s, "/Users/emmawinston/Desktop/actively-developed.wav");

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


//then we play it
(
{ BPF.ar(
	in: PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate:[-0.4, 0.4],
		loop: 1
),
	freq: MouseX.kr(100,6000),
	rq: MouseY.kr(0.1,5)
)
}.play
)