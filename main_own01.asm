
AddPkmnToParty2: ; Check if to copy wild Pkmn or generate new Pkmn
	ld de, PartyCount
	ld a, [MonType]
	and $f
	jr z, IfMonType0_
	ld de, OTPartyCount
IfMonType0_:
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc				; return if Party is full

	ld [de], a
	ld a, [de]
	ld [$ffae], a
	add e
	ld e, a
	jr nc, .asm_d8a7_
	inc d
.asm_d8a7_
	ld a, [CurPartySpecies]
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	ld hl, PartyMonOT
	ld a, [MonType]
	and $f
	jr z, .asm_d8bc_
	ld hl, OTPartyMonOT
.asm_d8bc_
	ld a, [$ffae]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [MonType]
	and a
	jr nz, .asm_d8f0_
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PartyMonNicknames
	ld a, [$ffae]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_d8f0_
	ld hl, PartyMon1Species
	ld a, [MonType]
	and $f
	jr z, .asm_d8fd_
	ld hl, OTPartyMon1Species
.asm_d8fd_
	ld a, [$ffae]
	dec a
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
Functiond906_: ; d906
	ld e, l
	ld d, h
	push hl
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDexNo]
	ld [de], a
	inc de
	ld a, [IsInBattle]
	and a
	ld a, $0
	jr z, .asm_d922_
	ld a, [EnemyMonItem]
.asm_d922_
	ld [de], a
	inc de
	push de
	ld h, d
	ld l, e

NewPkmnWithoutMoves_:
	ld a, [CurMove0]
	ld [hli], a
	ld a, [CurMove1]
	ld [hli], a
	ld a, [CurMove2]
	ld [hli], a
	ld a, [CurMove3]
	ld [hl], a

	pop de
rept 4
	inc de
endr
	ld a, [PlayerID]
	ld [de], a
	inc de
	ld a, [PlayerID + 1]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab Function50e47
	pop de
	ld a, [hMultiplicand]
	ld [de], a
	inc de
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de
; Set Experience Values of Pkmn
	ld a, $ff
	ld b, 2*5
.asm_d97a_
	ld [de], a
	inc de
	dec b
	jr nz, .asm_d97a_
	pop hl
	push hl
	ld a, [MonType]
	and $f
	jr z, .asm_d992_
	push hl
	callba GetTrainerDVs
	pop hl
	jr .asm_d9b5_

.asm_d992_
	ld a, [CurPartySpecies]
	ld [wd265], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon
	pop de
	pop hl
	push hl
	ld a, [IsInBattle]
	and a
	jr nz, .asm_d9f3_
; GetRandom Values for DV values
	;call Random
	push hl
	ld a, [HPType]
	ld c, a
	ld b, 0
	;ld bc, a
	ld hl, HiddenPowerDVs
	add hl, bc
	ld a, [hl]
	ld b, a
	pop hl
	
	;ld b, $ff
	;call Random
	ld c, $ff

.asm_d9b5_
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	push hl
	push de
rept 2
	inc hl
endr
	call FillPP
	pop de
	pop hl
rept 4
	inc de
endr
	ld a, $46
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld bc, $000a
	add hl, bc
	ld a, $1
	ld c, a
	ld b, $0
	call Functione17b
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de
	jr .asm_da29_

.asm_d9f3_
	ld a, [EnemyMonDVs]
	ld [de], a
	inc de
	ld a, [EnemyMonDVs + 1]
	ld [de], a
	inc de

	push hl
	ld hl, EnemyMonPP
	ld b, NUM_MOVES
.asm_da03_
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_da03_
	pop hl

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	ld hl, EnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

.asm_da29_
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_da3b_
	ld hl, EnemyMonMaxHP
	ld bc, 2*6
	call CopyBytes
	pop hl
	jr .asm_da45_

.asm_da3b_
	pop hl
	ld bc, 2*5
	add hl, bc
	ld b, $1 ; changed to 1
	call Functione167

.asm_da45_
	ld a, [MonType]
	and $f
	jr nz, .asm_da6b_
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .asm_da6b_
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	predef GetUnownLetter
	callab Functionfba18

.asm_da6b_
	scf
	ret
; da6d


; Source: http://www.psypokes.com/gsc/dvguide.php
HiddenPowerDVs:
	db $ff ;NORMAL
	db $cc ;FIGHTING
	db $cd ;FLYING
	db $ce ;POISON
	db $cf ;GROUND
	db $dc ;ROCK
	db $00 ;BIRD
	db $dd ;BUG
	db $de ;GHOST
	db $df ;STEEL
	db $00 ;TYPE_10
	db $00 ;TYPE_11
	db $00 ;TYPE_12
	db $00 ;TYPE_13
	db $00 ;TYPE_14
	db $00 ;TYPE_15
	db $00 ;TYPE_16
	db $00 ;TYPE_17
	db $00 ;TYPE_18
	db $00 ;CURSE_T
	db $ec ;FIRE
	db $ed ;WATER
	db $ee ;GRASS
	db $ef ;ELECTRIC
	db $fc ;PSYCHIC
	db $fd ;ICE
	db $fe ;DRAGON
	db $ff ;DARK


SentPkmnIntoBoxOwn: ; de6e
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld de, sBoxCount
	ld a, [de]
	cp MONS_PER_BOX
	jp nc, Functiondf42
	inc a
	ld [de], a
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	ld c, a
.asm_de85_
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .asm_de85_
	call GetBaseData
	call ShiftBoxMon
	ld hl, PlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld de, sBoxMonNicknames
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, EnemyMon
	ld de, sBoxMon1
	ld bc, 1 + 1 + NUM_MOVES ; species + item + moves
	call CopyBytes
	
	ld a, [CurItem]
	ld hl, sBoxMon1Item
	ld [hl], a
	
	ld hl, CurMove0
	ld de, sBoxMon1Moves
	ld bc, NUM_MOVES
	call CopyBytes
	
	ld hl, PlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab Function50e47
	pop de
	ld a, [hMultiplicand]
	ld [de], a
	inc de
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de

; Load Experience Values	
;	xor a
	ld a, $ff
	ld b, 2*5
.asm_dee5_
	ld [de], a
	inc de
	dec b
	jr nz, .asm_dee5_

	; load DVs
	ld a, [HPType]
	ld c, a
	ld b, 0
	ld hl, HiddenPowerDVs
	add hl, bc
	ld a, [hl]

	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc de
	
	ld hl, EnemyMonPP
	ld b, NUM_MOVES ; DVs and PP ; EnemyMonHappiness - EnemyMonDVs
.asm_deef_
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_deef_

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a

	ld a, [CurPartySpecies]
	dec a
	call SetSeenAndCaughtMon

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .asm_df20_
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callab Functionfba18
.asm_df20_

	ld hl, sBoxMon1Moves
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, sBoxMon1PP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	ld b, 0
	call Functiondcb6

	call CloseSRAM
	scf
	ret
; df42


GivePoke2:: ; e277
	push de
	push bc
	xor a
	ld [MonType], a
	call AddPkmnToParty2
	jr nc, .asm_e2b0_
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, $0
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, NoItemToSet_
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	ld a, [CurItem]
	ld [hl], a
	jr NoItemToSet_

.asm_e2b0_
	ld a, [CurPartySpecies]
	ld [TempEnemyMonSpecies], a
	callab LoadEnemyMon
	call SentPkmnIntoBoxOwn
	jp nc, Functione3d4_
	ld a, $2
	ld [MonType], a
	xor a
	ld [CurPartyMon], a
	ld de, wd050
	pop bc
	ld a, b
	ld b, $1
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, NoItemToSet_
	ld a, [CurItem]
	ld [sBoxMon1Item], a

NoItemToSet_:
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [TempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jp z, .asm_e390_
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [ScriptBank]
	call GetFarHalfword
	ld bc, PKMN_NAME_LENGTH
	ld a, [ScriptBank]
	call FarCopyBytes
	pop hl
rept 2
	inc hl
endr
	ld a, [ScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .asm_e35e_
	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.asm_e32f_
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .asm_e32f_
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	ld a, $3
	ld [hli], a
	ld [hl], $e9
	pop bc
	callba SetPkmnCaughtData
	jr DontGiveANickname_

.asm_e35e_
	ld a, $1
	call GetSRAMBank
	ld de, sBoxMonOT
.asm_e366_
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp $50
	jr nz, .asm_e366_
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	callba Function4db92
	jr DontGiveANickname_

.asm_e390_
	pop de
	pop bc
	push bc
	push de
	ld a, b
	and a
	jr z, .asm_e3a0_
	callba Function4db83
	jr .asm_e3a6_

.asm_e3a0_
	callba Function4db49

.asm_e3a6_
	callba GiveANickname_YesNo
	pop de
	jr c, DontGiveANickname_
	call Functione3de
DontGiveANickname_:
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, $1
	call GetSRAMBank
	ld hl, wd050
	ld de, sBoxMonNicknames
	ld bc, $000b
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret
; e3d4

Functione3d4_: ; e3d4
	pop bc
	pop de
	ld b, $2
	ret
; e3d9
