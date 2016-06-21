// function {}

//create a function
f = { 2 + 2};
f = {arg num; num * 2 };
f = {arg num = 2; num * 2};

// use it

f.value(555);

(
f = { arg num = 2;
	var partialResult;
	partialResult = num * 2;
	"good night".postln;
	(num * partialResult).postln;
	partialResult;
};
)

f.value(2);

//simpler version
g = {Pbind(\degree, Pwhite(0,10)).play};

g.value;

//complex version
g = { arg myDegree = 0; Pbind(\degree, myDegree).play };

g.value(10);
//the thing in the brackets becomes whatever is set as the arg in the original variable.

g.value;

//read page 55-61 of gentle introduction before evening lecture