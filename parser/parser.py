#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import rm_space as rm

def main( filename, to):
	if to == "--compile-to-python":
		import to_python as parser
	d = open( filename ).read().split("\n")
	e = "def %s(fuck): print(fuck)\n\n" % RESERVED["print"]
	e += "%s = lambda fist, fuck : [i for i in map(fist, fuck)]\n\n" % RESERVED["map"]
	current_line_number = -1
	function = []
	
	while current_line_number < len(d) - 1:
		current_line_number += 1
		line = rm.remove_space(d[current_line_number])
			
		if line[:3] == RESERVED["function"]:
			function = [line]
			current_line_number += 1
			line = rm.remove_space(d[current_line_number])
			while line[0] == "\t":
				function.append( line )
				current_line_number += 1
				line = rm.remove_space(d[current_line_number])
			e += parser.parse_function( function )
		else:
			e += parser.parse_other(rm.remove_space(d[current_line_number])) + "\n"
	return e
	
if __name__ == "__main__":
	RESERVED = { 	"function" : "fuc",
					"print"	:	"fist",
					"map"	:	"fap" }
	
	if len(sys.argv) < 2:
		print ("Usage : %s <script>" % (sys.argv[0]) )
		exit(0)
	
	if sys.argv[1]=="--compile-to-python":
		print(main(sys.argv[2], "--compile-to-python"))
	else:
		e = main(sys.argv[1], "--compile-to-python")
		eval(compile(e, e, "exec"))
