Special_Menu_ChallengeExplanationCancel_: ; 17d224
	ld a, [ScriptVar]
	and a
	jr nz, .asm_17d234
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_17d26a
	jr .asm_17d23c

.asm_17d234
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_17d28f_

.asm_17d23c
	call LoadMenuDataHeader
	call Function17d246
	call WriteBackup
	ret
; 17d246

MenuDataHeader_17d28f_: ; 17d28f
	db $40 ; flags
	db  0,  0 ; start coords
	db  7, 14 ; end coords
	dw MenuData2_17d297_
	db 1 ; default option

MenuData2_17d297_: ; 17d297
	db $a0 ; flags
	db 3
	db "Tiers@"
	db "Clauses@"
	db "Cancel@"
; 17d2b6



