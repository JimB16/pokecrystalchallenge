
	enum givepoke2_command
givepoke2: macro
	db givepoke2_command
	db \1 ; pokemon
	db \2 ; level
	db \3 ; item
	db \4 ; move0
	db \5 ; move1
	db \6 ; move2
	db \7 ; move3
	db \8 ; hidden power type
	endm
