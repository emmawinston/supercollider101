/*

Objects exist within classes, which are 'object factories', which always have capitals at the start

A list is an object. Even numbers are objects.

Everything in Supercollider is an object! It's a pure object oriented language. Derived from smalltalk which is also completely object oriented.

Everything receives messages because everything is an object.

Common behaviour is implemented in the classes to which the object belongs - inheritance. Allows generic behaviour which can be different for different classes of object but invoked by the same method name.

You can transpose a single number or a collection of numbers or an array of chords and the fine detail is different for each case, but for each object the method is slightly changed and still works.

Pseq is a class, Pbind is a class. Classes are also objects!

Help file shows you similar classes which will likely suggest other uses.

Search tutorials! Tutorials are the most useful when you don't understand much.

Pattern Guide 03 is good! do this before the end of the week.

You can combine different types of information in supercollider - so you can add an integer and a string as long as sc can figure out what the operator is. Each time you run your code it compiles and runs. It's different from most other languages and is much more flexible because you can put any type of info inside variables. There is no type checking - SC is dynamically typed.

Two types of methods - you can retrieve information or you can send instructions to the object. Instance variables which describe what an object has are all different for all objects.


c = Cat.new("persian", 1, "Sprinkles");

d = Dog.new(breed: "golden", age: 1, name: "bruno");

d.picture = "path/to/picture.jpg";

d.name;

d.bark;

d.meow; //probably won't work!

\degree etc is a symbol which has to be in pairs?



*/