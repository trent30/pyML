# To export pyML to C, you need to add the type in the line just below the declaration
# This new line must begin by `type :` and the separator is `:`
# the first type is the type returned by the function (like in C).

fuc inc g
	# type : int : int
	g+1

# The trick to write C code directly is to comment with `"""`
# The same trick to write the `main` function (see below).

"""
#include <stdio.h>
"""

# Except the type declaration, all the stuff is the same.

fuc fac foc
	# type : int : int
	1 if foc==1 
	foc*fac(foc-1)

fuc fuck
	# type : int
	42

fuc fib onacci
	# type : int : int
	1 if onacci==1
	1 if onacci==2
	fib(onacci-1)+fib(onacci-2)

# be careful with mutually recursive functions
# To avoid the warning: implicit declaration of function ‘b’ we need to declare it before

"""
int b(int p);
"""

fuc a p
	# type : int : int
	1 if p==0
	b(p-1)

fuc b p
	# type : int : int
	0 if p==0
	a(p-1)

# The following lines will be useful for the python interpreter only
# The C interpreter don't give a shit

b2s = lambda i : "odd" if i==0 else "even"
print("inc(42)==%d" % inc(42))
print("fac(6)==%d" % fac(6))
for i in range(10): print("%i is %s" % (i, b2s(a(i))))
fist(fuck())

# And this `main` function below will be useful for the C interpreter only
# The Python interpreter don't give a shit
"""
int main() {
	printf("inc(42)==%d\n", inc(42));
	printf("fac(6)==%d\n", fac(6));
	for(int i=0; i < 10; i++) {
		if (a(i) == 0) {
			printf("%d is odd\n", i);
		} else {
			printf("%d is even\n", i);
		}
	}
	printf("%d\n", fuck());
	return 0;
}
"""

# Now we can compare the result.
# $ ./compile_to_C.sh examples_to_C.l > test_export.c
# $ gcc -Wall test_export.c 
# $ ./a.out 
# inc(42)==43
# fac(6)==720
# 0 is even
# 1 is odd
# 2 is even
# 3 is odd
# 4 is even
# 5 is odd
# 6 is even
# 7 is odd
# 8 is even
# 9 is odd
# 42
# $ ./run.sh examples_to_C.l
# inc(42)==43
# fac(6)==720
# 0 is even
# 1 is odd
# 2 is even
# 3 is odd
# 4 is even
# 5 is odd
# 6 is even
# 7 is odd
# 8 is even
# 9 is odd
# 42
