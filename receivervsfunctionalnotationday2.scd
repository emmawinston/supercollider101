// receiver.message(argument);

// this is the typical structure for supercollider code

// receiver.message;

// is also a thing

// message = method

[1, 2, 3, 4, "wow"].reverse;
//the list is the receiver


//example of polymorphism
"hello".dup(4); //hello is a string
//4 is the argument
1.dup(4); //1 is just a number, dup is fine with both

3.145.round(0.1);
//the decimal point doesn't mess it up, it knows it's still part of the receiver

100.rand;

100.0.rand.round(0.01).dup(4);
//rand becomes the receiver of round

5.dup(20); //Receiver notation
dup(5, 20) //functional notation

// Receiver.message(argument);
// same as
// message(Receiver, argument)

3.145.round(0.1); //Receiver notation
round(3.145, 0.1); //Functional notation

rrand(33, 67);
//this feels more natural than this:
33.rrand(67);

100.0.rand.round(0.01).dup(4); //receiver
//convert to functional
dup(round(rand(100.0), 0.01), 4);

// cmd+d for documentation takes you to help file when cursor is over the word.
