//maths

//parentheses
//code block
(
"hello".postln;
1+1;
)
// precedence is not like proper arithmetic - it works from left to right
8 + 4 * 4;
//but you can force it
8 + ( 4 * 4 ); // 8 is the receiver, + is the message, block (4 * 4) is the argument. I'm not totally sure I understand this but kind of.

8 + 4 * 4.squared; // the method actually does take precedence over operators - it's left to right unless there's a method in which case it's right to left, it's 4 that's being squared here.

(1 + 2).squared; //forces precedence


//Square brackets
//mean an array (lists, collections of items)
[1, 6, 4, 5, "hello", [3, 4, 5, 5], "etc"]

//curly braces
//think function - a collection of instructions executed sequentially by the computer
{  }.fork

a = { "hello".postln };
a.value;

//double quotes
//strings of characters
"hello i'm a string".postln;