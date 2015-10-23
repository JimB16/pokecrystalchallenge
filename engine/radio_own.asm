DevTalk1: ; b8742 (2e:4742)
	ld a, $5
	ld [wd006], a
	call StartRadioStation
	ld hl, UnknownText_0xb8820_
	ld a, $b
	jp NextRadioLine

DevTalk2: ; b8752 (2e:4752)
	ld hl, UnknownText_0xb8825_
	ld a, $c
	jp NextRadioLine

DevTalk3: ; b875a (2e:475a)
	ld hl, UnknownText_0xb882a_
	ld a, $d
	jp NextRadioLine

UnknownText_0xb8820_: ; 0xb8820
	; MARY: PROF.OAK'S
	text_jump UnknownText_0x1bc81a_
	db "@"

UnknownText_0xb8825_: ; 0xb8825
	; #MON TALK!
	text_jump UnknownText_0x1bc82d_
	db "@"

UnknownText_0xb882a_: ; 0xb882a
	; With me, MARY!
	text_jump UnknownText_0x1bc83a_
	db "@"

