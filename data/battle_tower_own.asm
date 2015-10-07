Function_LoadOpponentTrainerAndPokemons_Own: ; 1f8000
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	xor a
	ld hl, w3_d100
	ld bc, $00e0
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [BT_OTPkmn1Item], a
	ld [BT_OTPkmn2Item], a
	ld [BT_OTPkmn3Item], a

	; de = address, were everything following gets copied to
	ld de, w3_d100

;	ld a, [hRandomAdd]
	ld a, 0
	ld b, a
.asm_1f8022 ; loop to find a random trainer
	call Random
;	ld a, [hRandomAdd]
;	ld a, 0
;	ld hl, TeamNr
	ld a, [ScriptVar]
	add b
	ld b, a ; b contains the nr of the trainer
IF DEF(CRYSTAL11)
	and $7f
	cp $46
ELSE
	and $1f
	cp $15
ENDC
;	jr nc, .asm_1f8022
	ld b, a
	ld a, BANK(sbe46)
	call GetSRAMBank
	
	ld c, $7
	ld hl, sBTTrainers
.asm_1f803a
	ld a, [hli]
	cp b
;	jr z, .asm_1f8022
	dec c
;	jr nz, .asm_1f803a ; c <= 7  initialise all 7 trainers?
	ld hl, sBTTrainers
	ld a, [sbe46]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	
	ld a, [ScriptVar]
;	push hl
;	ld hl, TeamNr
;	ld a, [hl]
;	pop hl
	
	ld [hl], a
	call CloseSRAM

	push af
	ld hl, BattleTowerTrainersOwn
	ld bc, BattleTowerTrainersOwn_Length
	call AddNTimes
	ld bc, 11
	call CopyBytes

	call Function_LoadRandomBattleTowerPkmn_Own
	pop af

	; load last 0x24 of the trainer into wram
	ld hl, BattleTowerTrainerData
	ld bc, $0024
	call AddNTimes
	ld bc, $0024
.asm_1f8070
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_1f8070
	
	pop af
	ld [rSVBK], a
	ret


Function_LoadRandomBattleTowerPkmn_Own: ; 1f8081
	ld a, [ScriptVar]
	ld hl, BattleTowerTrainersOwn
	ld bc, BattleTowerTrainersOwn_Length
	call AddNTimes

	ld a, BattleTowerTrainersOwn_NrPkmns
	add l
	ld l, a
	xor a
	add h
	ld h, a
	ld a, [hli]
	ld c, a
;	ld c, 6

	push hl
	ld hl, Own_PkmnNrOfTeam
	ld [hl], a
	
	ld a, $0
	ld hl, InitPkmnLoop
	ld [hl], a
	pop hl

.loop
	push hl
	push bc
	ld a, $1 ; BANK(sBTPkmnOfTrainers)
	call GetSRAMBank

	ld a, [InitPkmnLoop]
	sla a
	ld c, l
	ld b, h
;	ld bc, hl
	add c
	ld c, a
	xor a
	adc b
	ld b, a
	ld h, b
	ld l, c
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c

	;ld a, 0;;
;	ld bc, $3b
;	call AddNTimes

	ld a, [InitPkmnLoop]
	inc a
	ld [InitPkmnLoop], a
	
	ld bc, $3b
	call CopyBytes
	ld a, [wd265]
	push af
	push de
	ld hl, -$3b
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ld bc, $0030
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop de
	pop af
	ld [wd265], a
	pop bc
	pop hl
	dec c
	jp nz, .loop

	call CloseSRAM
	ret


Battle_Tower_Own:

	db LANTURN
	db QUICK_CLAW
	db SURF, RAIN_DANCE, ZAP_CANNON, CONFUSE_RAY
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $57 ; DVs
	db 15, 5, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 425 ; HP
	bigdw 425 ; Max HP
	bigdw 178 ; Atk
	bigdw 176 ; Def
	bigdw 192 ; Spd
	bigdw 214 ; SAtk
	bigdw 214 ; SDef
	db "RANTA-N@@@@"

Charizard01:
; 006
; Charizard @ Leftovers
; Belly Drum, Earthquake, Fire Blast, Rock Slide
	db CHARIZARD
	db LEFTOVERS
	db EARTHQUAKE, BELLY_DRUM, FIRE_BLAST, ROCK_SLIDE
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 10, 10, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 359 ; HP
	bigdw 359 ; Max HP
	bigdw 266 ; Atk
	bigdw 254 ; Def
	bigdw 298 ; Spd
	bigdw 268 ; SAtk
	bigdw 268 ; SDef
	db "RANTA-N@@@@"

Nidoking01:
; 034
; Nidoking @ Leftovers
; Earthquake, Lovely Kiss, Ice Beam, Thunder/Thunderbolt
	db NIDOKING
	db LEFTOVERS
	db EARTHQUAKE, LOVELY_KISS, ICE_BEAM, THUNDER
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 10, 10, 10, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 282 ; Atk
	bigdw 252 ; Def
	bigdw 268 ; Spd
	bigdw 268 ; SAtk
	bigdw 248 ; SDef
	db "RANTA-N@@@@"

Marowak01:
; 105
; Marowak @ Thick Club
; Earthquake, Rock Slide, Hidden Power Bug / Rest, Swords Dance
	db MAROWAK
	db THICK_CLUB
	db HIDDEN_POWER, EARTHQUAKE, ROCK_SLIDE, SWORDS_DANCE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $dd, $ff ; DVs
	db 10, 10, 15, 30 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 254 ; Atk
	bigdw 314 ; Def
	bigdw 188 ; Spd
	bigdw 198 ; SAtk
	bigdw 258 ; SDef
	db "RANTA-N@@@@"

Starmie01:
; 121
; Starmie @ Leftovers
; Surf, Rapid Spin, Recover, Psychic
	db STARMIE
	db LEFTOVERS
	db SURF, RAPID_SPIN, RECOVER, PSYCHIC_M
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 15, 40, 20, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 248 ; Atk
	bigdw 268 ; Def
	bigdw 328 ; Spd
	bigdw 298 ; SAtk
	bigdw 268 ; SDef
	db "RANTA-N@@@@"

Snorlax01:
; 143
; Snorlax @ Leftovers
; Double-Edge/Body Slam, Curse, Rest, Sleep Talk/Lovely Kiss/Earthquake/Fire Blast
	db SNORLAX
	db LEFTOVERS
	db DOUBLE_EDGE, CURSE, REST, EARTHQUAKE
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 15, 10, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 523 ; HP
	bigdw 523 ; Max HP
	bigdw 318 ; Atk
	bigdw 228 ; Def
	bigdw 158 ; Spd
	bigdw 228 ; SAtk
	bigdw 318 ; SDef
	db "CURSELAX@@@"

Snorlax01_50:
; 143
; Snorlax @ Leftovers
; Double-Edge/Body Slam, Curse, Rest, Sleep Talk/Lovely Kiss/Earthquake/Fire Blast
	db SNORLAX
	db LEFTOVERS
	db DOUBLE_EDGE, CURSE, REST, EARTHQUAKE
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 15, 10, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 523/2 ; HP
	bigdw 523/2 ; Max HP
	bigdw 318/2 ; Atk
	bigdw 228/2 ; Def
	bigdw 158/2 ; Spd
	bigdw 228/2 ; SAtk
	bigdw 318/2 ; SDef
	db "CURSELAX@@@"

Snorlax02:
; 143
; Snorlax @ Leftovers
; Belly Drum, Double-Edge/Body Slam/Return, Lovely Kiss/Earthquake/Curse, Rest/Lovely Kiss/Earthquake
	db SNORLAX
	db LEFTOVERS
	db BELLY_DRUM, BODY_SLAM, EARTHQUAKE, REST
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $ff, $ff ; DVs
	db 10, 15, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 523 ; HP
	bigdw 523 ; Max HP
	bigdw 318 ; Atk
	bigdw 228 ; Def
	bigdw 158 ; Spd
	bigdw 228 ; SAtk
	bigdw 318 ; SDef
	db "DRUMLAX@@@@"

Zapdos01:
; 145
; Zapdos @ Leftovers
; Thunder/Thunderbolt, Hidden Power Ice/Hidden Power Water, Rest, Sleep Talk
	db ZAPDOS
	db LEFTOVERS
	db THUNDER, HIDDEN_POWER, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $fd, $ff ; DVs
	db 5, 15, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 278 ; Atk
	bigdw 264 ; Def
	bigdw 298 ; Spd
	bigdw 348 ; SAtk
	bigdw 278 ; SDef
	db "RANTA-N@@@@"

Zapdos01_50:
; 145
; Zapdos @ Leftovers
; Thunder/Thunderbolt, Hidden Power Ice/Hidden Power Water, Rest, Sleep Talk
	db ZAPDOS
	db LEFTOVERS
	db THUNDER, HIDDEN_POWER, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	bigdw $ffff
	db $fd, $ff ; DVs
	db 5, 15, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 383/2 ; HP
	bigdw 383/2 ; Max HP
	bigdw 278/2 ; Atk
	bigdw 264/2 ; Def
	bigdw 298/2 ; Spd
	bigdw 348/2 ; SAtk
	bigdw 278/2 ; SDef
	db "RANTA-N@@@@"



BattleTowerTrainersOwn:
	db "JIMB@@@@@@", COOLTRAINERM
	db 6
	dw Charizard01, Nidoking01, Marowak01, Starmie01, Zapdos01, Charizard01
	db "JULIANB@@@", CHUCK
	db 3
	dw Snorlax01_50, Snorlax01_50, Zapdos01_50, Snorlax01, Charizard01, Nidoking01;, Marowak01;, Starmie01, Zapdos01;, Charizard01
