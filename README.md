# PyML

PyML is a functional programming language.

## Usage

`./run script.l`  
Just run your script.

`./compyle.sh script.l > script.py`  
Compile your PyML script in Python script.


## Syntax & examples

The syntax is clean, the keyword `fuc` declare a function followed by name and argument(s) :
fuc <lt>name<gt> arg_1 arg_2 ... arg_n  
The function's body must be indent with tab :

    fuc hello_world_function  
        "hello world"  
    print(hello_world_function())

A recursive function with one argument :

    fuc fac n
        1 if n == 1 
        n * fac(n - 1)

    print(fac(6))
    720

A `if` on each line do the pattern-matching, no need on the last one (match all cases).

    fuc sum list
        0 if len(list) == 0
	    list[0] + sum(list[1:])  
    print(sum([1,2,3]))
    6

    fuc reverse list
	    [] if len(list)==0
	    [list[-1]] + reverse(list[:-1])   
    print(reverse([1,2,3]))
    [3, 2, 1]

See more example in [exemples.l](exemples.l)

## Types & operators

Sine the interpreter is in Python, all types/operators/functions/modules available in Python are available in PyML.
