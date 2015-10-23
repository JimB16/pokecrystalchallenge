NewGame_own: ; 5b6b
	xor a
	ld [wc2cc], a
	call ResetWRAM
	call Function5b44
	call AreYouABoyOrAreYouAGirl
	call OakSpeech_own
	call InitializeWorld
	ld a, 1
	ld [wc2d8], a

	ld a, SPAWN_HOME
	ld [wd001], a

	ld a, $f1
	ld [$ff9f], a
	jp Function5e5d
; 5b8f

OakSpeech_own: ; 0x5f99
	callba Function90672
	call Function4dd
	call ClearTileMap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call Function4a3
	call FadeToWhite
	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Function619c

	ld b, $1c
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText1_
	call PrintText
	call FadeToWhite
	call ClearTileMap

	ld a, SNORLAX
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call Function3786

	xor a
	ld [TempMonDVs], a
	ld [TempMonDVs + 1], a

	ld b, $1c
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2_
	call PrintText
	ld hl, OakText4_
	call PrintText
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Function619c

	ld b, $1c
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText5_
	call PrintText
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	callba DrawIntroPlayerPic

	ld b, $1c
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText6_
	call PrintText
	call NamePlayer
	ld hl, OakText7_
	call PrintText
	ret

OakText1_: ; 0x6045
	text_jump _OakText1
	db "@"

OakText2_: ; 0x604a
	text_jump _OakText2
	start_asm
	ld a,SNORLAX
	call PlayCry
	call WaitSFX
	ld hl,OakText3
	ret

OakText3_: ; 0x605b
	text_jump _OakText3
	db "@"

OakText4_: ; 0x6060
	text_jump _OakText4
	db "@"

OakText5_: ; 0x6065
	text_jump _OakText5
	db "@"

OakText6_: ; 0x606a
	text_jump _OakText6
	db "@"

OakText7_: ; 0x606f
	text_jump _OakText7
	db "@"
