#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rm_space as rm

def function_name_args ( l ):
	l = rm.remove_double_space(l[4:])
	if " " in l:
		p = l.find(" ")
		args = rm.remove_space( l[ p+1 : ] ).replace(" ", ", ")
		return l[ : p] + " = lambda " + args  + " : "
	else:
		return l + " = lambda : "

def rt( t ):
	return t.replace("\t", "")

def parse_other( t ):
	return t

def parse_function( l ):
	if len(l) == 0:
		return ""
	r = function_name_args(l[0])
	i = 1
	while i < len(l):
		r += rt(l[i]) + " else "
		i += 1
	return r[:-6] + "\n"
