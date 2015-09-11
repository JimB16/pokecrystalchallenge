AToStringbuffer:
	push af
	ld c, $f0
	and c
	srl a
	srl a
	srl a
	srl a
	ld c, a
	ld b, 0
	ld hl, HexTable
	add hl, bc
	ld d, [hl]
	pop af

	ld c, $f
	and c
	ld c, a
	ld b, 0
	ld hl, HexTable
	add hl, bc
	ld e, [hl]

	ret

HexTable:
	db "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"

OutputTCAIAttr:
	ld hl, TrainerClassAttributes + 3
;	ld a, [TrainerClass]
;	dec a
;	ld bc, 7 ; Trainer2AI - Trainer1AI
;	call AddNTimes
	ld a, BANK(TrainerClassAttributes)
	call GetFarByte
	
;	ld a, [wcfc0]

	call AToStringbuffer
	
	ld hl, StringBuffer1
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl

	ld a, "@"
	ld [hl], a

	ld hl, BattleText_Debug0
	call StdBattleTextBox

	ret

OutputAIMoveScores:
;	ld hl, TrainerClass
	ld c, 0
.String_loop
	ld b, 0
	ld hl, Buffer1
	add hl, bc
	ld a, [hl]
	push bc
	call AToStringbuffer
	pop bc
	
	ld hl, StringBuffer1
	push bc
	sla c
	add hl, bc
	pop bc
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl

	inc c
	ld a, c
	cp 4
	jr nz, .String_loop

	ld a, "@"
	ld [hl], a

	ld hl, BattleText_Debug0
	call StdBattleTextBox

	ret


OutputAIHealthStatus:
	callba AICheckEnemyMaxHP
	jr nc, EnemyHasNotMaxHP
	ld a, $99
	jp PrintHP
EnemyHasNotMaxHP:
	
	callba AICheckEnemyHalfHP
	jr nc, EnemyHasNotHalfHP
	ld a, $50
	jp PrintHP
EnemyHasNotHalfHP:

	callba AICheckEnemyThreeEighthHP
	jr nc, EnemyHasNotThreeEighthHP
	ld a, $37
	jp PrintHP
EnemyHasNotThreeEighthHP:
	
	callba AICheckEnemyQuarterHP
	jr nc, EnemyHasNotQuarterHP
	ld a, $25
	jp PrintHP
EnemyHasNotQuarterHP:

	callba AICheckEnemyEighthHP
	jr nc, EnemyHasNotEighthHP
	ld a, $12
	jp PrintHP
EnemyHasNotEighthHP:

	ld a, $ff

PrintHP:
	call AToStringbuffer
	
	ld hl, StringBuffer1
;	push bc
;	sla c
;	add hl, bc
;	pop bc
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl

	ld a, "@"
	ld [hl], a

	ld hl, BattleText_Debug1
	call StdBattleTextBox

	ret
