BattleIslandTS03_MapScriptHeader:
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
;	setflag ENGINE_FLYPOINT_NEW_BARK
;	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

BattleIslandTS03_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 24*2+1, 7*2, 1, NEW_BARK_TOWN;FUCHSIA_CITY;ROUTE_19___FUCHSIA_GATE;ELMS_LAB
	warp_def 17*2+1, 3*2, 1, BLACKTHORN_POKECENTER_1F

.XYTriggers:
	db 0
;	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016, $0, $0
;	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041, $0, $0

.Signposts:
	db 3
	signpost 22*2+1, 8*2+1, SIGNPOST_READ, JumpText_BattleIslandTS03WelcomeSign
	signpost 14*2+1, 17*2+1, SIGNPOST_READ, JumpText_BattleIslandTS03Hotel
	signpost 22*2+1, 11*2+1, SIGNPOST_READ, JumpText_BattleIslandTS03Compound

.PersonEvents:
	db 5+4+1+1
	; $2 walk randoml around (up/down/left/right)
	; $3 Stand at the same place and rotate
	; $4 walk randomly around (up/down)
	; $5 walk randomly around (left/right)
	; $6 look down
	; $7 look up
	; $8 look left
	; $9 look right
;	person_event SPRITE_TEACHER, 15*2, 9*2, $3, 0, 1, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_FISHER, 15*2+4, 9*2+4, $2, 2, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_SILVER, 6, 7, $9, 0, 0, -1, -1, 0, 0, 0, SilverScript_0x1a809e, EVENT_RIVAL_NEW_BARK_TOWN
	person_event SPRITE_COOLTRAINER_M, 13*2+4, 20*2+4+2, $9, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_COOLTRAINER_M, 13*2+4, 20*2+4+2+1, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_GRAMPS, 21*2+4, 12*2+4, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_GRANNY, 17*2+4+1, 14*2+4+1, $9, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_TAUROS, 23*2+4+1, 11*2+4+1, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	
	person_event SPRITE_RED, 16*2+4, 8*2+4+2, $2, 1, 1, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_BLUE, 18*2+4, 8*2+4+3, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_PIKACHU, 18*2+4, 8*2+4+4, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	person_event SPRITE_POKE_BALL, 23*2+4, 6*2+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslandSignpost4Script, -1
	
	
;	person_event SPRITE_ELM, 6, 9, $6, 0, 0, -1, -1, 0, 0, 0, ProfElmScript, -1
;	person_event SPRITE_SCIENTIST, 13, 6, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
;	person_event SPRITE_POKE_BALL, 7, 10, $1, 0, 0, -1, -1, 0, 0, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
;	person_event SPRITE_POKE_BALL, 7, 11, $1, 0, 0, -1, -1, 0, 0, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
;	person_event SPRITE_POKE_BALL, 7, 12, $1, 0, 0, -1, -1, 0, 0, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
;	person_event SPRITE_OFFICER, 7, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	person_event SPRITE_RECEPTIONIST, 23*2+4, 8*2+4+1, $6, 0, 0, -1, -1, 0, 0, 0, Script_BattleRoom__, -1

MapBattleIslandSignpost4Script:
	loadfont
	writetext BattleIslandOwnText3
	keeptextopen
	giveitem PP_UP, 10
	givepoke2 NIDOKING, 100, LEFTOVERS, EARTHQUAKE, LOVELY_KISS, ICE_BEAM, THUNDERBOLT, NORMAL
	givepoke2 CHARIZARD, 100, LEFTOVERS, BELLY_DRUM, EARTHQUAKE, FIRE_BLAST, ROCK_SLIDE, NORMAL
	givepoke2 MAROWAK, 100, THICK_CLUB, EARTHQUAKE, ROCK_SLIDE, HIDDEN_POWER, SWORDS_DANCE, BUG
	givepoke2 STARMIE, 100, LEFTOVERS, SURF, RAPID_SPIN, RECOVER, PSYCHIC_M, NORMAL
	givepoke2 ZAPDOS, 100, LEFTOVERS, THUNDERBOLT, HIDDEN_POWER, REST, SLEEP_TALK, ICE

	givepoke2 FORRETRESS, 100, LEFTOVERS, EXPLOSION, RAPID_SPIN, REFLECT, SPIKES, NORMAL
	givepoke2 GENGAR, 100, LEFTOVERS, EXPLOSION, ICE_PUNCH, MEAN_LOOK, THUNDERBOLT, NORMAL
	givepoke2 SNORLAX, 100, LEFTOVERS, CURSE, DOUBLE_EDGE, LOVELY_KISS, REST, NORMAL
	givepoke2 TYRANITAR, 100, LEFTOVERS, CURSE, PURSUIT, ROAR, ROCK_SLIDE, NORMAL
	givepoke2 VAPOREON, 100, LEFTOVERS, GROWTH, REST, SLEEP_TALK, SURF, NORMAL
	givepoke2 EXEGGUTOR, 100, LEFTOVERS, EXPLOSION, HIDDEN_POWER, PSYCHIC_M, STUN_SPORE, FIRE
	jumptext BattleIslandOwnText2

BattleIslandOwnText3:
	text "Now you get sth."
	done
	
BattleIslandOwnText2:
	text "Hello, <PLAYER>."

	para "Now you got every-"
	line "thing you need,"
	cont "to fight in this"
	cont "game."
	done

Script_BattleRoom__: ; 0x9f421
;	jump UnknownScript_0x9e39d
;	applymovement PLAYER, MovementData_0x9e58c
; beat all 7 opponents in a row
;Script_BattleRoomLoop: ; 0x9f425
	writebyte $2
	special Function_LoadOpponentTrainerAndPokemons170b44_Own
;	appear $2
;	warpsound
;	waitbutton
;	applymovement $2, MovementData_0x9e592
;	loadfont
;	storetext 1 ; Random Text of opponent trainer
;	keeptextopen
;	loadmovesprites
	special Function170215OwnSpecial ; calls predef startbattle
	special FadeBlackBGMap
	reloadmap
;	if_not_equal $0, UnknownScript_0x9f4c2
;	copybytetovar wcf64
;	if_equal $7, Script_BeatenAllTrainers
;	applymovement $2, MovementData_0x9e597
;	warpsound
;	disappear $2
;	applymovement $3, MovementData_0x9e59c
;	applymovement PLAYER, MovementData_0x9e5a7
;	loadfont
;	writetext Text_YourPkmnWillBeHealedToFullHealth
;	closetext
;	loadmovesprites
;	playmusic MUSIC_HEAL
;	special FadeBlackBGMap
;	special LoadMapPalettes
;	pause 60
;	special FadeInBGMap
;	special RestartMapMusic
;	loadfont
;	writetext Text_NextUpOpponentNo
;	yesorno
;	iffalse Script_DontBattleNextOpponent
;Script_ContinueAndBattleNextOpponent: ; 0x9f477
;	loadmovesprites
;	applymovement PLAYER, MovementData_0x9e5a9
;	applymovement $3, MovementData_0x9e5a1
;	jump Script_BattleRoomLoop
	end


JumpText_BattleIslandTS03Hotel:
	jumptext Text_BattleIslandTS03Hotel

Text_BattleIslandTS03Hotel:
	text "BATTLE ISLAND"
	line "HOTEL"

	para "We do everything"
	line "for our guests."
	cont "Really!"
	done

JumpText_BattleIslandTS03WelcomeSign:
	jumptext Text_BattleIslandTS03WelcomeSign

Text_BattleIslandTS03WelcomeSign:
	text "Welcome to ..."

	para "BATTLE ISLAND."
	done

JumpText_BattleIslandTS03Compound:
	jumptext Text_BattleIslandTS03Compound

Text_BattleIslandTS03Compound:
	text "Wild Pokemon"

	para "Be careful."
	done

BattleIsland_TeacherScript:
	end
