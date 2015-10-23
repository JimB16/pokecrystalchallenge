Function_LoadOpponentTrainerAndPokemons170b44_Own: ; 0x170b44
	callba Function_LoadOpponentTrainerAndPokemons_Own
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, wd10a
	ld a, [hl]
	dec a
	ld c, a
	ld b, $0
	pop af
	ld [rSVBK], a
	ld hl, Unknown_170b90
	add hl, bc
	ld a, [hl]
	ld [wcd49], a

;	ld a, [ScriptVar]
	ret
; 170b90

