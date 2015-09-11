AI_BATTLETOWER::
; Don't do anything redundant:
;  -Using status-only moves if the player can't be statused
;  -Using moves that fail if they've already been used

	ld a, SNORLAX
	call AICheckEnemySpecies
	call z, AI_Smart_Snorlax
	call AI_Aggressive
	ret

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1

.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a

	ld a, b
	cp 4
	jr z, .checkmove
	jr .discourage

.discourage
	call AIDiscourageMove
	jr .checkmove


AICheckEnemySpecies:
; Return zero if enemy species equals species in 'a'

	push bc
	ld b, a
	ld a, [EnemyMonSpecies]
	cp b
	pop bc
	ret


AICheckPlayerSpecies:
; Return zero if player species equals species in 'a'

	push bc
	ld b, a
	ld a, [BattleMonSpecies]
	cp b
	pop bc
	ret




AI_Smart_Snorlax:
	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, .table_AI_Snorlax
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .nextmove

	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	jr .checkmove

;	db DOUBLE_EDGE, CURSE, REST, EARTHQUAKE
.table_AI_Snorlax
;	dbw EFFECT_SLEEP,            AI_Smart_Sleep			; LOVELY_KISS
;	dbw EFFECT_EXPLOSION,        AI_Smart_Explosion		; SELFDESTRUCT
	dbw EFFECT_HEAL,             AI_Smart_Heal			; REST
;	dbw EFFECT_PARALYZE_HIT,     AI_Smart_Paralyze_Hit	; BODY_SLAM
;	dbw EFFECT_SLEEP_TALK,       AI_Smart_SleepTalk		; SLEEP_TALK
	dbw EFFECT_CURSE,            AI_Smart_Curse_Snorlax	; CURSE
;	dbw EFFECT_BELLY_DRUM,       AI_Smart_BellyDrum		; BELLY_DRUM
;	dbw EFFECT_EARTHQUAKE,       AI_Smart_Earthquake	; EARTHQUAKE
;	dbw EFFECT_RECOIL_HIT,       AI_Smart_Recoil_Hit	; DOUBLE_EDGE
;	dbw EFFECT_BURN_HIT,         AI_Smart_Burn_Hit		; FIRE_BLAST
;	dbw EFFECT_RETURN,           AI_Smart_Return		; RETURN
	db $ff

AI_Smart_Curse_Snorlax:
	call AICheckEnemyHalfHP
	jr nc, .asm_38e93

	ld a, [EnemyAtkLevel]
;	cp 7+4
;	jr nc, .asm_38e93
	cp 7+5 ; 7+2
	jr nc, .asm_38e90

	;call AI_80_20
	;ret c
rept 2
	dec [hl]
endr
	ret

.asm_38e90
rept 2
	inc [hl]
endr
.asm_38e92
	inc [hl]
.asm_38e93
	inc [hl]
	ret



AICheckEnemyEighthHP:
	push hl
	push de
	push bc
	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
rept 2
	inc hl
endr
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret


AICheckPlayerEighthHP:
	push hl
	ld hl, BattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
rept 2
	inc hl
endr
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret


AICheckEnemyThreeEighthHP:
	push hl
	push de
	push bc
	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	push hl
	ld h, b
	ld l, c
	sla c
	rl b
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	
rept 2
	inc hl
endr
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret
