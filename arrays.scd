// arrays
a = [10, 11, 12, 13, 14, 15, 16, 17];

a.reverse;
a.scramble;
a.choose; //pick at random
a.size; //return size
a.at(0); //retrieve at position
a[0]; //same
a.wrapAt[9]; //retrieve at position wrapping if > a.size
["wow", 99] ++ a; //concatenates arrays
a ++ \hi; //a symbol is just one character
a ++ 'hi'; //same
a ++ "hi"; //a string is a collection of characters
a.add(44); //create new array and add element to the end
a.insert(5, "wow"); //insert "wow" at position 5 but doesn't remove anything
a; //none of the options changed the array
a.put(2, "oops"); //put oops at position 2 and removes what's there
a.permute(3); //position 3 goes to 0, 0 goes to 3
a.mirror; //make it a palindrome
a.powerset; //returns all possible combinations of array's elements

//maths with arrays
[1, 2, 3, 4, 5] + 10;
[1, 2, 3, 4, 5] * 10;
([1, 2, 3, 4, 5,] / 7).round(0.01); // parentheses for precedence
x = 11; y = 12;
[x, y, 9] * 100;
// you can only do maths with proper numbers
[1, 2, 3, 4, "oops", 11] + 10;


//creating new arrays

//arithmetic series
Array.series(size:6, start:10, step:3);
//geometric series
Array.geom(size:10, start:1, grow:2)

//compare
Array.series(7,100,-10); //7 items, start at 100, step -10
Array.geom(7,100,0.9); //7 items, start at 100, multiply by 0.9 each time

//meet the fill method
Array.fill(10, "same");
//compare
Array.fill(10, rrand(1,10));
Array.fill(10, {rrand(1, 10)}); //re evaluates function 10 times

//fill function can take a default argument that is a counter
//argument name can be anything
Array.fill(10, {arg counter; counter * 10});
//generate list of harmonic frequencies
Array.fill(10, {arg wow; wow+1 * 440});
//.newClear method
a = Array.newClear(7); //empty array of given size
a[3] = "wow"; //same as a.put(3, "wow")

//shortcut notation
30!4;
//same as
30.dup(4);

"hello" ! 10;
//same as
"hello".dup(10);

//or
Array.fill(4, 30);
Array.fill(10, "hello");


//this generates an array with a series of numbers
(50..79);
//same as
series(50, 51, 79); //second number determines step
//or
Array.series(30, 50, 1);

//doing arrays
~myFreqs = Array.fill(10, {rrand(440, 880)});

//doing an action on each list item
~myFreqs.do({arg item, count; ("Item " ++ count ++ " is " ++ item ++ " Hz. Closest midinote is " ++ item.cpsmidi.round).postln });

//just one argument, no counter
~myFreqs.do({ arg item; {SinOsc.ar(item, 0, 0.1)}.play});
~myFreqs.do({ arg item; item.squared.postln });

//can simplify last one
~myFreqs.squared;