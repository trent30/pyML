#!/usr/bin/env python
# -*- coding: utf-8 -*-

def remove_double_space( t ):
	while ( "  " in t ):
		t = t.replace("  ", " ")
	return t

def remove_space( t ):
	if len(t) == 0 or t == "\t\n":
		return " "
	while ( "\t\t" in t ):
		t = t.replace("\t\t", "\t")
	return t.rstrip(" ").lstrip(" ")
