// supercollider structure

/*

The language

the language interpreter

the synthesis server

When you create a synthdef the language creates a lot of unit generators which transform samples.

Out is the jack, the sinosc is connected through that formula in a little packet which is sent to the synthesis server.

OSC operates at the network level and can send messages between the language and scsynth which talk back to one another.


server and language communicate via OSC

*/

//play it
~mysynth1 = Synth("wow");
~mysynth = Synth("wow");

//stop synth
~mysynth.free;

//view server and language structure
s.plotTree;
