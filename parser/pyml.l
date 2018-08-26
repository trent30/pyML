# This file is an PyML interpreter written in PyML
# Usage :
#  python pyml.py pyml.l exemples.l
# or
# ./run.sh pyml.l exemples.l

import sys

RESERVED = { 	"function" 	:	 	"fuc",
				"print"		:		"fist",
				"map"		:		"fap",
				"indent" 	: 		"\t",
				"comment" 	: 		"#"
			}

fuc remove space
	space if "  " not in space
	remove(space.replace("  ", " "))

fuc strin g sep
	"" if len(g)==0
	g[0] + strin(g[1:],sep) if len(g)==1
	g[0] + sep + strin(g[1:],sep)

fuc tab ulation
	False if len(ulation)==0
	False if len(ulation[0])==0
	True if ulation[0][0] == RESERVED["indent"]
	False

fuc fun tion
	[] if not tab(tion)
	[tion[0]] + fun(tion[1:])

fuc addtab l
	[RESERVED["indent"] + l[0]] + l[1:]

fuc rm s
	[] if len(s)==0
	s if len(s)==1
	rm([s[0]] + s[2:]) if type(s[0])==list and s[1][0]==RESERVED["indent"]
	[s[0]] + rm(s[1:])

fuc all ml
	[] if len(ml)==0
	all(ml[1:]) if ml[0]==''
	all(ml[1:]) if ml[0][0]== RESERVED["comment"]
	[fun(addtab(ml))] + all(ml[1:]) if ml[0][:len(RESERVED["function"])] == RESERVED["function"]
	[ml[0]] + all(ml[1:])

fuc lamb da
	da[1]+" = lambda " + strin(da[2:],",") + ":"

fuc arg ument
	lamb(remove(ument[0]).split(" ")) + strin(ument[1:]," else ")

fuc g i
	[] if len(i)==0
	[arg(i[0])] + g(i[1:]) if type(i[0])==list
	[i[0]] + g(i[1:])

fuc main stream
	strin(g(rm(all(stream))),"\n")

r = main( open(sys.argv[-1]).read().split("\n"))
eval(compile(r, r, "exec"))
