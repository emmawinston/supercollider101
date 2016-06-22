//OSC - open sound control

~destination = NetAddr("192.168.180.192", 57120);

~destination.sendMsg("/test/number", "(ﾉ^ヮ^)ﾉ*:・ﾟ✧");


(
OSCdef(
	key: \anything,
	func: {arg ...msg; msg.postln; },
	path:'/test/number')
)