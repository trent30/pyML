# pyML exemples

# Les lignes commençant par `#` sont des commentaires
# Ce fichier est donc interprétable pour profiter des exemples

# Les fonctions se déclare avec le mot réservé "fuc" comme FUnCtion, suivi du nom et des arguments
# fuc <nom> argument_1 argument_2 ... argument_n
# pas besoin de `=` ou de `:` en fin de ligne.
# 
# Le corps de la fonction doit impérativement être indenté par une tabulation (espace interdit) 
# la dernière ligne ne doit pas commencer par une tabulation
# cela permet à l'interpréteur de savoir qu'on quitte la fonction
# pas besoin de `;;` comme en Ocaml, c'est simple et élégant.

# Exemple d'une fonction qui incrémente de 1 la valeur passée en argument :

fuc inc g
	g+1

# L'appel d'une fonction se fait avec des parenthèses, s'il y a plusieurs arguments ils doivent être séparés par des virgules.
# La fonction `fist` est l'équivalent de la fonction `print` :

fist(inc(42))
# 43


# les fonctions récursives se déclarent comme n'importe quelle fonction
# le pattern-matching se fait avec un simple `if`
# la dernière ligne concerne tous les autres cas ( équivalent du `_` en Ocaml )
# La fonction factorielle est un exemple de fonction récursive :

fuc fac foc
	1 if foc==1 
	foc*fac(foc-1)

fist(fac(6))
# 720


# On peut cumuler les valeurs d'une liste :

fuc cum fist
	0 if len(fist) == 0
	fist[0] + cum(fist[1:])

fist(cum([1,2,3]))
# 6


# les arguments sont facultatifs :

fuc fuck
	42

fist(fuck())
# 42


# On peut définir la multiplication des entiers naturels ainsi :

fuc moule frite dessert
	0 if frite==0
	0 if dessert==0
	dessert if frite==1
	frite if dessert==1
	frite + moule(frite,dessert-1)

ti=6
plier=7
fist(moule(ti,plier))
# 42


# Pour rester dans l'efficacité des langages fonctionnels, voici la fonction puissance :

fuc puiss an ce
	1 if ce==0
	moule(an,puiss(an,ce-1))

fist(puiss(2,10))
# 1024


# fonction pour retourner une liste :

fuc doggy style
	[] if len(style)==0
	[style[-1]] + doggy(style[:-1])

fist(doggy([1,2,3]))
# [3, 2, 1]


# Utilisation de map :

fist(map(inc,[1,2,3]))
# [2, 3, 4]

# Attention, si vous utilisez python3 vous obtiendrez <map object at 0x7f2b84836828>
# Pour éviter cela vous pouvez utilisez la fonction `fap`
# L'utilisation de plus de 3 fap sur une même ligne est déconseillée par l'église.

fist(fap(inc,[1,2,3]))
# [2, 3, 4]


# La célèbre suite de Leonardo Fibonacci :

fuc fib onacci
	1 if onacci==1
	1 if onacci==2
	fib(onacci-1)+fib(onacci-2)

fist(fib(10))
# 55

# Si on veut la liste jusqu'à un certain rang :

fuc flist fist
	[] if fist==0
	flist(fist-1)+[fib(fist)]

fist(flist(10))
# [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# double récursivité, pour connaître la parité d'un entier

fuc anal fist
	"even" if fist==0
	double(fist-1)

fuc double fist
	"odd" if fist==0
	anal(fist-1)

fuc list fist
	[] if fist==0
	list(fist-1)+[(fist,anal(fist))]

fist(list(5))
# [(1, 'odd'), (2, 'even'), (3, 'odd'), (4, 'even'), (5, 'odd')]

# Ou de manière plus pythonique :
fist([(logic, anal(logic)) for logic in range(1,6)])
