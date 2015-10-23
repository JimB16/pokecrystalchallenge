
PpUp_Own: ; f5bf
; parameter: a: Nr of Pkmn (0-5)
;    ld a, PP_UP
;    ld [CurItem], a

;	ld a, [CurItem]
;	ld [wd002], a

;    ld a, 2 ; Which Pkmn?
;	ld [CurPartyMon], a

.asm_f5c5
;	ld b, $1
;	call Functionf1f9
;	jp c, Functionf6e0

.restart_func
;	ld a, [wd002]
;	cp MAX_ELIXER
;	jp z, Functionf6af
;	cp ELIXER
;	jp z, Functionf6af

;	ld hl, TextJump_RaiseThePPOfWhichMove
;	ld a, [wd002]
;	cp PP_UP
;	jr z, .asm_f5e7
;	ld hl, TextJump_RestoreThePPOfWhichMove
;.asm_f5e7
;	call PrintText

	ld a, [CurMoveNum]
	push af
;	xor a
;	ld [CurMoveNum], a
;	ld a, $2
;	ld [wd235], a
;	callba MoveSelectionScreen
	pop bc

    ld a, 4
.AttackLoop
    dec a
    push af
;    ld a, 2 ; Which Move?
    ld [wcfa9], a
    
	;ld a, b
	ld [CurMoveNum], a
.PPUpToMaxLoop
	ld a, [CurMoveNum]
	;jr nz, .asm_f5c5
	ld hl, PartyMon1Moves
	ld bc, PartyMon2 - PartyMon1
	call Add_CurPartyMon_Times

;	push hl
;	ld a, [hl]
;	ld [wd265], a
;	call GetMoveName
;	call CopyName1
;	pop hl

;	ld a, [wd002]
;	cp PP_UP
;	jp nz, Functionf6a7

	ld a, [hl]
	cp $a6
	jr z, .pp_is_maxed_out

	ld bc, $0015
	add hl, bc
	ld a, [hl]
	cp $c0
	jr c, .increase_pp

.pp_is_maxed_out
;	ld hl, TextJump_PPIsMaxedOut
;	call PrintText
	jr .Functionf64c_ ; .restart_func

.increase_pp
	ld a, [hl]
	add $40
	ld [hl], a
	ld a, $1
	ld [wd265], a
	call Functionf84c
;	call Play_SFX_FULL_HEAL
    jp .PPUpToMaxLoop

;	ld hl, TextJump_PPsIncreased
;	call PrintText

.Functionf64c_ ; f64c
;	call ClearPalettes
;	jp Functionf795

    pop af
    or a
    jp nz, .AttackLoop

    ret
; f652


PPUPParty: ; c658
	xor a
	ld [CurPartyMon], a
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr z, .next

	push hl
    call PpUp_Own
	;call HealPartyMon
	pop hl

.next
	ld a, [CurPartyMon]
	inc a
	ld [CurPartyMon], a
	jr .loop

.done
	ret
; c677
