Music_Pkmn001: ; eb808
	dbw $c0, Music_Pkmn001_Ch1
	dbw $01, Music_Pkmn001_Ch2
	dbw $02, Music_Pkmn001_Ch3
	dbw $03, Music_Pkmn001_Ch4
; eb814

; notetype $c, $a7
; notetype speed of fading (smaller=faster $0..$1f), ?
Music_Pkmn001_Ch1: ; eb814
    
; 16th note length (in frames) = 1 * 6 (note length) * 0.625 (tempo = 0.160) = 30 frames = 30/3600 = 0.0083 minutes
; 220/256 = 0.859
    

; 240 bpm = 4bps = 0.25 spb = 15 fpb = 0.066 bpf
; 170 bpm = 2.83bps = 0.353 spb = 21.2 fpb = 0.047 bpf

    
; try 01
; 240 bpm / 3600 fpm = 0.0666 beats per frame
; 170 bpm / 3600 fpm = 0.0472 beats per frame
; / 3583.8 fpm
; 3600 fpm / 240 bpm = 15.0 frames per beat
; 3600 fpm / 170 bpm = 21.18 frames per beat

; 3600 fpm / (6 tickets per row * 4 row per beat) / 240 bpm = 0.625 frames per tick
; 0.625 frames per tick * 256 = 160

; 222 / 256 = 0.867 fpb
	tempo 158 ; = 240 bpm  ; 220
	;tempo 222 ; = 170 bpm
	volume $77
	dutycycle $1
	tone $0000
	vibrato $10, $12
	stereopanning $f0
	notetype $6, $a7
;	notetype $6, $a<<4 | 0<<3 | 7<<0

	intensity 2 << 4 | 1 << 3 | 4
	octave 3
	note __, 12
	note E_, 8

	notetype $6, $a7
	octave 3
	note G_, 8
	note F#, 12
	note D_, 4
	note E_, 8
	octave 2
	note B_, 16

	octave 3
	note E_, 8
	note G_, 8
	note F#, 12
	note D_, 4
	note E_, 4
	note G_, 4
	note B_, 12 ; after 8 start ch2
	note __, 4

	octave 4
	note E_, 8
	note D_, 8
	octave 3
	note B_, 8
	note G_, 4
	note G_, 1
	note A_, 1
	note B_, 2
	note A_, 8
	note E_, 12
	note __, 12

	note E_, 8
	note B_, 8
	note A_, 8
	note D_, 8
	note F#, 4
	note G_, 2
	note F#, 2
	note E_, 4
	note D_, 4
	note E_, 16
	note __, 4
    
    jumpchannel Music_Pkmn001_Ch1
    
; try 03
	tempo 180
	volume $77
	dutycycle $3
	tone $0000
	vibrato $c, $12
	stereopanning $f0
	notetype $15, $a7

	intensity $a0
	octave 3
	note __, 4

	intensity $a7
	octave 3
	note E_, 8
	note G_, 8
	note F#, 8
	note __, 8
	note __, 8
    
; try 02
	tempo 180
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $12
	stereopanning $f0
	notetype $8, $a7

	intensity $a0
	octave 3
	note __, 4

	intensity $a7
	octave 2
	note E_, 8
	note G_, 8
	note F#, 8
	note __, 8
	note __, 8
    
    
    
    
    
    
    

	octave 3
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note C_, 4
	octave 2
	note B_, 1
	note __, 2
	octave 3
	note C_, 1
	octave 2
	note B_, 8
	note A_, 4
	note A_, 1
	note __, 2
	note B_, 1
	octave 3
	note C_, 6
	note E_, 4
	note F#, 2
	stereopanning $ff
	octave 4
	note G_, 1
	stereopanning $f0
	octave 3
	note D_, 5
	octave 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	intensity $b7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 3
	note D_, 6
	note E_, 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a0
	octave 2
	note B_, 6
	notetype $8, $a7
	note B_, 6
	notetype $8, $a7
	octave 3
	note F_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a0
	note D_, 6
	notetype $8, $a7
	note D_, 6
	notetype $8, $a7
	note __, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 3
	note D_, 3
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 9
	note F_, 9
	note C_, 6
	note D_, 9
	notetype $c, $b7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 9
	notetype $8, $b7
	note G_, 3
	note A_, 4
	note G_, 4
	note F_, 4
	note F_, 6
	note E_, 6
	note D_, 9
	note F_, 3
	note G_, 3
	note D_, 6
	note G_, 3
	notetype $8, $54
	octave 2
	note G_, 3
	note B_, 3
	notetype $8, $94
	octave 3
	note D_, 3
	note G_, 3
	tempo 136
	notetype $8, $b4
	note F_, 3
	note A_, 3
	notetype $8, $d4
	octave 4
	note C_, 3
	note F_, 3
	tempo 138
	notetype $8, $b4
	note D_, 9
	note C_, 9
	octave 3
	note A#, 6
	notetype $c, $b7
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 4
	octave 4
	note D_, 4
	note F_, 4
	note E_, 6
	octave 3
	note G_, 2
	notetype $8, $b7
	note A_, 4
	note G_, 4
	note F_, 4
	note G_, 12
	octave 4
	note C_, 6
	tempo 136
	note C#, 6
	tempo 134
	callchannel Music_Pkmn001_branch_eb96d
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_Pkmn001_branch_eb96d
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_Pkmn001_branch_eb96d
	octave 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $c, $a0
	note D_, 6
	notetype $c, $a7
	note D_, 10
	intensity $a0
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $a0
	octave 2
	note B_, 8
	intensity $a7
	note B_, 8
	octave 3
	note C_, 8
	octave 2
	note B_, 8
	octave 3
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note F_, 8
	note A_, 8
	note G_, 6
	note G_, 1
	note F#, 1
	note F_, 8
	note E_, 8
	intensity $a0
	note D_, 16
	intensity $a7
	note D_, 16
	intensity $a3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $b2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note F#, 2
	notetype $c, $b7
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; eb96d

Music_Pkmn001_branch_eb96d: ; eb96d
	notetype $c, $c3
	note D_, 1
Music_Pkmn001_branch_eb971: ; eb971
	note __, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 1
	octave 2
	note D_, 1
	loopchannel 5, Music_Pkmn001_branch_eb971
	note __, 1
	note D_, 1
	octave 1
	note A_, 1
	notetype $8, $b7
	endchannel
; eb984

Music_Pkmn001_Ch2: ; eb984
	dutycycle $3
	vibrato $14, $12
	notetype $6, $a0
	intensity $a0
	octave 2
	note __, 12
;	note __, 104 ; 116-12
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note E_, 4
	note D_, 4
	note C_, 16
	octave 1
	note G_, 16
	note A_, 8
	note A_, 4
	note B_, 4
	octave 2
	note C_, 8
	octave 1
	note B_, 2
	note A_, 2
	note G_, 4
	note B_, 16
	octave 2
	note D_, 16
	note D_, 16
	note E_, 16
	note __, 4
    
    jumpchannel Music_Pkmn001_Ch2

	endchannel

	dutycycle $3
	vibrato $14, $12
	notetype $c, $c7
	intensity $a4
	octave 1
	note G_, 1
	octave 2
	note D_, 1
	note G_, 1
	octave 3
	note C_, 1
	intensity $c2
	octave 3
	note B_, 1
	note __, 2
	note A_, 1
	intensity $b0
	note G_, 6
	intensity $b7
	note G_, 6
	note __, 16
	note __, 16
	intensity $c7
	octave 4
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note F#, 2
	note E_, 1
	note F#, 1
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 4
	note F_, 4
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 6
	octave 3
	note C_, 2
	stereopanning $f
	intensity $a3
	octave 4
	note D_, 4
	note D_, 2
	note C_, 4
	note C_, 2
	octave 3
	note B_, 4
	stereopanning $ff
	intensity $c7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 2
	note F_, 4
	note A_, 2
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note D_, 12
	stereopanning $f0
	notetype $8, $b7
	octave 2
	note A_, 9
	stereopanning $f
	notetype $c, $c7
	note G_, 1
	note A_, 1
	note B_, 6
	note E_, 1
	note F#, 1
	note G_, 4
	notetype $c, $4b
	note A_, 4
	stereopanning $ff
	notetype $c, $c7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 2
	note F_, 6
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 3
	note C_, 2
	octave 2
	note A_, 6
	note B_, 6
	note G_, 2
	notetype $8, $c7
	note F_, 4
	note G_, 4
	note F_, 4
	stereopanning $ff
	octave 3
	note G_, 9
	note B_, 3
	octave 4
	note D_, 12
	stereopanning $f0
	notetype $8, $a7
	octave 3
	note D_, 4
	note C_, 4
	note D_, 4
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 9
	note A#, 3
	notetype $c, $b0
	note G_, 8
	notetype $c, $b7
	note G_, 8
	intensity $c6
	note A_, 4
	intensity $5d
	note A_, 4
	intensity $c7
	note A#, 6
	intensity $c3
	note F_, 2
	intensity $c7
	note F_, 8
	intensity $a7
	octave 3
	note A#, 8
	intensity $c7
	octave 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 6
	intensity $c3
	octave 4
	note G_, 2
	intensity $c7
	note G_, 8
	intensity $a7
	octave 3
	note E_, 8
	intensity $c7
	octave 5
	note C_, 4
	note C#, 4
	tone $0001
	stereopanning $f
	callchannel Music_Pkmn001_branch_ebae7
	note C#, 4
	callchannel Music_Pkmn001_branch_ebae7
	note C#, 4
	callchannel Music_Pkmn001_branch_ebae7
	octave 4
	note A_, 4
	stereopanning $ff
	tone $0000
	notetype $c, $b0
	octave 3
	note B_, 6
	notetype $c, $b7
	note B_, 10
	intensity $c7
	note A_, 8
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	intensity $b0
	note G_, 8
	intensity $b7
	note G_, 8
	intensity $c7
	note F_, 8
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note A_, 6
	note F_, 1
	note A_, 1
	intensity $b0
	note G_, 16
	intensity $b7
	note G_, 16
	intensity $c2
	octave 4
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	intensity $90
	note G_, 4
	notetype $8, $c2
	octave 3
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F#, 2
	notetype $c, $c7
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 11
	endchannel
; ebae7

Music_Pkmn001_branch_ebae7: ; ebae7
	notetype $c, $b2
	note D_, 1
Music_Pkmn001_branch_ebaeb: ; ebaeb
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	note D_, 1
	loopchannel 5, Music_Pkmn001_branch_ebaeb
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	notetype $8, $b7
	octave 5
	note C_, 4
	note C_, 4
	endchannel
; ebb01

Music_Pkmn001_Ch3: ; ebb01
	endchannel

	stereopanning $f
	vibrato $10, $14
	tone $0001
	notetype $c, $16
	octave 3
	octave 3
	note __, 4
	octave 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note C_, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note __, 1
	note F_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note F_, 1
	note E_, 1
	note F_, 1
	note __, 1
	note A_, 2
	note F_, 2
	note A_, 4
	octave 3
	note C_, 2
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	note G_, 4
	note B_, 2
	note A_, 4
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	note D_, 6
	octave 2
	note A#, 6
	octave 3
	note F_, 4
	note A#, 6
	note F_, 6
	note D_, 4
	note E_, 6
	note C_, 6
	note E_, 4
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	note E_, 4
	note D_, 1
	note __, 1
	stereopanning $ff
	notetype $c, $16
	tone $0000
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note D_, 1
	note __, 2
	note E_, 1
	note F#, 4
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $16
	note D_, 1
	note __, 1
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note B_, 1
	note __, 2
	note A_, 1
	note A_, 4
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $16
	note D_, 1
	note __, 1
	notetype $c, $16
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note G_, 6
	note E_, 2
	note G_, 2
	note F#, 1
	note E_, 1
	note D_, 6
	tone $0001
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note E_, 2
	note F#, 2
	stereopanning $f
	notetype $c, $16
	note G_, 16
	note F_, 16
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 2
	note F_, 12
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 16
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $16
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note A_, 2
	notetype $c, $16
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; ebc5c

Music_Pkmn001_Ch4: ; ebc5c
	endchannel

	togglenoise $5
	stereopanning $f0
	notetype $c
	note __, 4
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 6
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 3
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 4
	note D#, 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_Pkmn001_branch_ebd77
	callchannel Music_Pkmn001_branch_ebd81
	callchannel Music_Pkmn001_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_Pkmn001_branch_ebd77
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	callchannel Music_Pkmn001_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	callchannel Music_Pkmn001_branch_ebd77
	callchannel Music_Pkmn001_branch_ebd81
	callchannel Music_Pkmn001_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_Pkmn001_branch_ebd77
	callchannel Music_Pkmn001_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 2
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	callchannel Music_Pkmn001_branch_ebd8b
	callchannel Music_Pkmn001_branch_ebd93
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_Pkmn001_branch_ebd8b
	callchannel Music_Pkmn001_branch_ebd93
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	callchannel Music_Pkmn001_branch_ebd8b
	callchannel Music_Pkmn001_branch_ebd93
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note G#, 16
Music_Pkmn001_branch_ebd40: ; ebd40
	note __, 16
	loopchannel 6, Music_Pkmn001_branch_ebd40
	note __, 12
	notetype $6
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 4
	notetype $8
	note C_, 2
	note C_, 2
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note B_, 4
	endchannel
; ebd77

Music_Pkmn001_branch_ebd77: ; ebd77
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd81

Music_Pkmn001_branch_ebd81: ; ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd8b

Music_Pkmn001_branch_ebd8b: ; ebd8b
	note C_, 2
	note C_, 1
	note C_, 1
	loopchannel 4, Music_Pkmn001_branch_ebd8b
	endchannel
; ebd93

Music_Pkmn001_branch_ebd93: ; ebd93
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	notetype $8
	note C_, 4
	note C_, 4
	endchannel
; ebd9e
