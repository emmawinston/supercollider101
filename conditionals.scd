//Conditionals

//if/else
//if(condition, {}, {});
//if(condition, {else}, {that});

if(100 > 50, {"wow".postln}, {"bleh".postln});

if(100.rand > 50, { "wow".postln; }, { "bleh".postln; });

//boolean is just true or false
90 == 90;
1 > 9;
33.odd;
40 <= 10;

//case

case
{1==9} {"wow1".postln}
{3==3} {"wow2".postln}
{99.odd} {"wow3".postln}
{true} {"wow4".postln};
//each pair is a condition then a function. You have to write case at the top. If everything is false nothing will happen. If everything is true it will execute the first one.