#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rm_space as rm


def function_name_args ( l, l2):
	l = rm.remove_double_space(l[4:])
	name = l
	args = []
	if " " in l:
		p = l.find(" ")
		args = rm.remove_space( l[ p+1 : ] ).split(" ")
		name = l[ : p]
	l2 = rm.remove_double_space(l2).replace(" ", "").split(":")[1:]
	if len(args) != len(l2) - 1:
		print("Error : wrong number of type in function %s" % name)
		exit(-1)
	r = l2.pop(0) + " " + name + "("
	for i in l2:
		r += i + " " + args.pop() + ", "
	if r[-1] == "(":
		return r + ") {\n"
	return r[:-2] + ") {\n"

def rt( t ):
	return t.replace("\t", "")

def parse_other( t ):
	if len(t) == 0:
		return ""
	if t[:8] == "#include":
		return t
	if t[0] == "#":
		return "//" + t[1:]
	if t[:3] == '"""':
		return "//" + t
	return t

def parse_function( l ):
	if len(l) == 0:
		return ""
	r = function_name_args(l[0], l[1])
	i = 2
	while i < len(l):
		if "if" in l[i]:
			g, d = l[i].split("if")
			r += "\tif (%s) { return %s ; }\n" % (d, g)
		else:
			r+= "\treturn %s ;\n}\n" % l[i]
		i += 1
	return r
