Script_givepoke2: ; 0x97932
; script command 0x2d
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)
;     item (ItemLabelByte)
;     move0 (DecimalParam)
;     move1 (DecimalParam)
;     move2 (DecimalParam)
;     move3 (DecimalParam)
;     Hidden Power Type (DecimalParam)

	call GetScriptByte
	ld [CurPartySpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	call GetScriptByte
	ld [CurItem], a
	call GetScriptByte
	ld [CurMove0], a
	call GetScriptByte
	ld [CurMove1], a
	call GetScriptByte
	ld [CurMove2], a
	call GetScriptByte
	ld [CurMove3], a
	call GetScriptByte
	ld [HPType], a
	ld a, 0
	ld b, a
	callba GivePoke2
	ld a, b
	ld [ScriptVar], a
	ret
; 0x97968
