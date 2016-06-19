//variables

(
x = 30;

a = -10;

x + a;

//don't use s - it's assigned to the server when you open supercollider
)

~myLongVariableName = 2;

a + ~myLongVariableName

//variables work for this working session.

//global variables
a = 9;
~hello_ccrma_california = 10;


//local variable
(
var banana = 88, apple = 100;
banana + apple;
)

//local variables

(
var wow = 100;
Pbind(\emma, (wow).postln).play //doesn't do anything
)


(
var wow = 100;
Pbind(\bruno, Pfunc({wow.postln})).play
)

