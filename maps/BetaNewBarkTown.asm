NewBarkTownBeta_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

UnknownScript_0x1a8016_:
	playmusic MUSIC_MOM
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x1a8134_
	closetext
	loadmovesprites
	spriteface PLAYER, RIGHT
	applymovement $2, MovementData_0x1a80d4_
	loadfont
	writetext UnknownText_0x1a813e_
	closetext
	loadmovesprites
	follow $2, PLAYER
	applymovement $2, MovementData_0x1a80e0_
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e_
	closetext
	loadmovesprites
	special RestartMapMusic
	end

UnknownScript_0x1a8041_:
	playmusic MUSIC_MOM
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x1a8134_
	closetext
	loadmovesprites
	spriteface PLAYER, RIGHT
	applymovement $2, MovementData_0x1a80d9_
	spriteface PLAYER, UP
	loadfont
	writetext UnknownText_0x1a813e_
	closetext
	loadmovesprites
	follow $2, PLAYER
	applymovement $2, MovementData_0x1a80e6_
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e_
	closetext
	loadmovesprites
	special RestartMapMusic
	end

TeacherScript_0x1a806f_:
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x1a8095_
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x1a808f_
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x1a8089_
	writetext UnknownText_0x1a80f7_
	closetext
	loadmovesprites
	end

UnknownScript_0x1a8089_:
	writetext UnknownText_0x1a81c4_
	closetext
	loadmovesprites
	end

UnknownScript_0x1a808f_:
	writetext UnknownText_0x1a81f2_
	closetext
	loadmovesprites
	end

UnknownScript_0x1a8095_:
	writetext UnknownText_0x1a8236_
	closetext
	loadmovesprites
	end

FisherScript_0x1a809b_:
	jumptextfaceplayer UnknownText_0x1a8274_

SilverScript_0x1a809e_:
	loadfont
	writetext UnknownText_0x1a82a6_
	closetext
	loadmovesprites
	spriteface $4, LEFT
	loadfont
	writetext UnknownText_0x1a82cd_
	closetext
	loadmovesprites
	follow PLAYER, $4
	applymovement PLAYER, MovementData_0x1a80ed_
	stopfollow
	pause 5
	spriteface $4, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, MovementData_0x1a80f0_
	applymovement $4, MovementData_0x1a80f5_
	end

MapNewBarkTownBetaSignpost0Script:
	jumptext UnknownText_0x1a82e8_

MapNewBarkTownBetaSignpost1Script:
	jumptext UnknownText_0x1a8328_

MapNewBarkTownBetaSignpost2Script:
	jumptext UnknownText_0x1a8332_

MapNewBarkTownBetaSignpost3Script:
	jumptext UnknownText_0x1a8340_

MovementData_0x1a80d4_:
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x1a80d9_:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

MovementData_0x1a80e0_:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

MovementData_0x1a80e6_:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

MovementData_0x1a80ed_:
	turn_head_up
	step_down
	step_end

MovementData_0x1a80f0_:
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

MovementData_0x1a80f5_:
	step_right
	step_end

UnknownText_0x1a80f7_:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

UnknownText_0x1a8134_:
	text "Wait, <PLAY_G>!"
	done

UnknownText_0x1a813e_:
	text "What do you think"
	line "you're doing?"
	done

UnknownText_0x1a815e_:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

UnknownText_0x1a81c4_:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

UnknownText_0x1a81f2_:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

UnknownText_0x1a8236_:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

UnknownText_0x1a8274_:
	text "Yo, <PLAYER>!"

	para "I hear PROF.ELM"
	line "discovered some"
	cont "new #MON."
	done

UnknownText_0x1a82a6_:
	text $56

	para "So this is the"
	line "famous ELM #MON"
	cont "LAB…"
	done

UnknownText_0x1a82cd_:
	text "…What are you"
	line "staring at?"
	done

UnknownText_0x1a82e8_:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

UnknownText_0x1a8328_:
	text "<PLAYER>'s House"
	done

UnknownText_0x1a8332_:
	text "ELM #MON LAB"
	done

UnknownText_0x1a8340_:
	text "ELM'S HOUSE"
	done

NewBarkTownBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $3, $6, 1, ELMS_LAB
	warp_def $5, $d, 1, KRISS_HOUSE_1F
	warp_def $b, $3, 1, KRISS_NEIGHBORS_HOUSE
	warp_def $d, $b, 1, ELMS_HOUSE

.XYTriggers:
	db 2
	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016_, $0, $0
	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041_, $0, $0

.Signposts:
	db 4
	signpost 8, 8, SIGNPOST_READ, MapNewBarkTownBetaSignpost0Script
	signpost 5, 11, SIGNPOST_READ, MapNewBarkTownBetaSignpost1Script
	signpost 3, 3, SIGNPOST_READ, MapNewBarkTownBetaSignpost2Script
	signpost 13, 9, SIGNPOST_READ, MapNewBarkTownBetaSignpost3Script

.PersonEvents:
	db 3-3
;	person_event SPRITE_TEACHER, 12, 10, $3, 0, 1, -1, -1, 0, 0, 0, TeacherScript_0x1a806f_, -1
;	person_event SPRITE_FISHER, 13, 16, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FisherScript_0x1a809b_, -1
;	person_event SPRITE_SILVER, 6, 7, $9, 0, 0, -1, -1, 0, 0, 0, SilverScript_0x1a809e_, EVENT_RIVAL_NEW_BARK_TOWN
