BattleIsleBeta_MapScriptHeader:
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

BattleIsleBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 11, 8, 1, BATTLEISLE_BETA_POKECENTER_1F
	warp_def 7, 16, 1, BATTLEISLE_BETA_DEVHOUSE

.XYTriggers:
	db 0
;	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016, $0, $0
;	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041, $0, $0

.Signposts:
	db 3
	signpost 11, 10, SIGNPOST_READ, JumpText_BattleIsleBetaPokeCenterSign
	signpost 13, 3, SIGNPOST_READ, JumpText_BattleIsleBetaGameVersionSign
	signpost 9, 17, SIGNPOST_READ, JumpText_BattleIsleBetaDevHouseSignOut
;	signpost 14*2+1, 17*2+1, SIGNPOST_READ, JumpText_BattleIsleBetaHotel
;	signpost 22*2+1, 11*2+1, SIGNPOST_READ, JumpText_BattleIsleBetaCompound

.PersonEvents:
	db 8
	; $2 walk randomly around (up/down/left/right)
	; $3 Stand at the same place and rotate
	; $4 walk randomly around (up/down)
	; $5 walk randomly around (left/right)
	; $6 look down
	; $7 look up
	; $8 look left
	; $9 look right
	person_event SPRITE_COOLTRAINER_M, 0+4, 5+4, $6, 0, 0, -1, -1, PAL_OW_RED, 0, 0, BattleIsleBeta_CoolTrainerScript, -1
	person_event SPRITE_COOLTRAINER_M, 0+4, 6+4, $6, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, BattleIsleBeta_CoolTrainer2Script, -1
	person_event SPRITE_COOLTRAINER_M, 0+4, 7+4, $6, 0, 0, -1, -1, PAL_OW_GREEN, 0, 0, BattleIsleBeta_CoolTrainer3Script, -1
	person_event SPRITE_COOLTRAINER_F, 0+4, 8+4, $6, 0, 0, -1, -1, PAL_OW_GREEN, 0, 0, ReceptionistScript_0x9e3e2_, -1
	person_event SPRITE_POKE_BALL, 5+4, 0+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslePokeBallScript, -1
	person_event SPRITE_POKE_BALL, 4+4, 0+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslePokeBallScript02, -1
	person_event SPRITE_POKE_BALL, 3+4, 0+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslePokeBallScript03, -1
	person_event SPRITE_POKE_BALL, 2+4, 0+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslePokeBallScript04, -1

;	person_event SPRITE_TEACHER, 15*2, 9*2, $3, 0, 1, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_FISHER, 15*2+4, 9*2+4, $2, 2, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_SILVER, 6, 7, $9, 0, 0, -1, -1, 0, 0, 0, SilverScript_0x1a809e, EVENT_RIVAL_NEW_BARK_TOWN
;	person_event SPRITE_COOLTRAINER_M, 13*2+4, 20*2+4+2+1, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_GRAMPS, 21*2+4, 12*2+4, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_GRANNY, 17*2+4+1, 14*2+4+1, $9, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_TAUROS, 23*2+4+1, 11*2+4+1, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
	
;	person_event SPRITE_RED, 16*2+4, 8*2+4+2, $2, 1, 1, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_BLUE, 18*2+4, 8*2+4+3, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_PIKACHU, 18*2+4, 8*2+4+4, $6, 0, 0, -1, -1, 0, 0, 0, BattleIsland_TeacherScript, -1
;	person_event SPRITE_POKE_BALL, 23*2+4, 6*2+4, $1, 0, 0, -1, -1, 0, 0, 0, MapBattleIslandSignpost4Script, -1


MapBattleIslePokeBallScript02: ; Borat Team
	loadfont
	writetext BattleIslandOwnText3
	keeptextopen
	givepoke2 RAIKOU, 100, LEFTOVERS, REFLECT, REST, ROAR, THUNDERBOLT, NORMAL
	givepoke2 MAROWAK, 100, THICK_CLUB, EARTHQUAKE, REST, ROCK_SLIDE, SWORDS_DANCE, NORMAL
	givepoke2 SKARMORY, 100, LEFTOVERS, CURSE, DRILL_PECK, REST, WHIRLWIND, NORMAL
	givepoke2 SNORLAX, 100, LEFTOVERS, BELLY_DRUM, BODY_SLAM, EARTHQUAKE, REST, NORMAL
	givepoke2 SUICUNE, 100, LEFTOVERS, ICE_BEAM, REST, SLEEP_TALK, SURF, NORMAL
	givepoke2 MILTANK, 100, LEFTOVERS, BODY_SLAM, GROWL, HEAL_BELL, MILK_DRINK, NORMAL
	jumptext BattleIslandOwnText2

MapBattleIslePokeBallScript03: ; poke god Team
	loadfont
	writetext BattleIslandOwnText3
	keeptextopen
	givepoke2 TYRANITAR, 100, LEFTOVERS, CRUNCH, DYNAMICPUNCH, PURSUIT, THUNDERBOLT, NORMAL
	givepoke2 MAROWAK, 100, THICK_CLUB, EARTHQUAKE, REST, ROCK_SLIDE, SWORDS_DANCE, NORMAL
	givepoke2 SKARMORY, 100, NO_ITEM, DRILL_PECK, REST, THIEF, WHIRLWIND, NORMAL
	givepoke2 SNORLAX, 100, LEFTOVERS, BELLY_DRUM, BODY_SLAM, CURSE, REST, NORMAL
	givepoke2 STARMIE, 100, LEFTOVERS, PSYCHIC_M, RAPID_SPIN, RECOVER, SURF, NORMAL
	givepoke2 MILTANK, 100, LEFTOVERS, BODY_SLAM, GROWL, HEAL_BELL, MILK_DRINK, NORMAL
	jumptext BattleIslandOwnText2

MapBattleIslePokeBallScript04: ; Borats later Team
	loadfont
	writetext BattleIslandOwnText3
	keeptextopen
	givepoke2 ZAPDOS, 100, LEFTOVERS, DRILL_PECK, REST, SLEEP_TALK, THUNDER, NORMAL
	givepoke2 CLOYSTER, 100, LEFTOVERS, EXPLOSION, SPIKES, SURF, TOXIC, NORMAL
	givepoke2 SNORLAX, 100, LEFTOVERS, BELLY_DRUM, DOUBLE_EDGE, LOVELY_KISS, REST, NORMAL
	givepoke2 TYRANITAR, 100, LEFTOVERS, CRUNCH, PURSUIT, ROAR, ROCK_SLIDE, NORMAL
	givepoke2 VAPOREON, 100, LEFTOVERS, GROWTH, REST, SLEEP_TALK, SURF, NORMAL
	givepoke2 EXEGGUTOR, 100, LEFTOVERS, EXPLOSION, LEECH_SEED, PSYCHIC, STUN_SPORE, NORMAL
	jumptext BattleIslandOwnText2

MapBattleIslePokeBallScript:
	loadfont
	writetext BattleIslandOwnText3
	keeptextopen
;	giveitem PP_UP, 10
;	givepoke2 NIDOKING, 100, LEFTOVERS, EARTHQUAKE, LOVELY_KISS, ICE_BEAM, THUNDERBOLT, NORMAL
;	givepoke2 CHARIZARD, 100, LEFTOVERS, BELLY_DRUM, EARTHQUAKE, FIRE_BLAST, ROCK_SLIDE, NORMAL
;	givepoke2 MAROWAK, 100, THICK_CLUB, EARTHQUAKE, ROCK_SLIDE, HIDDEN_POWER, SWORDS_DANCE, BUG
;	givepoke2 STARMIE, 100, LEFTOVERS, SURF, RAPID_SPIN, RECOVER, PSYCHIC_M, NORMAL
	givepoke2 ZAPDOS, 100, LEFTOVERS, THUNDERBOLT, HIDDEN_POWER, REST, SLEEP_TALK, ICE

;	givepoke2 FORRETRESS, 100, LEFTOVERS, EXPLOSION, RAPID_SPIN, REFLECT, SPIKES, NORMAL
;	givepoke2 GENGAR, 100, LEFTOVERS, EXPLOSION, ICE_PUNCH, MEAN_LOOK, THUNDERBOLT, NORMAL
;	givepoke2 SNORLAX, 100, LEFTOVERS, DOUBLE_EDGE, CURSE, REST, LOVELY_KISS, NORMAL
;	givepoke2 SNORLAX, 100, LEFTOVERS, BELLY_DRUM, BODY_SLAM, EARTHQUAKE, REST, NORMAL
;	givepoke2 TYRANITAR, 100, LEFTOVERS, CURSE, PURSUIT, ROAR, ROCK_SLIDE, NORMAL
;	givepoke2 VAPOREON, 100, LEFTOVERS, GROWTH, REST, SLEEP_TALK, SURF, NORMAL
;	givepoke2 EXEGGUTOR, 100, LEFTOVERS, EXPLOSION, HIDDEN_POWER, PSYCHIC_M, STUN_SPORE, FIRE
	
	givepoke2 PIKACHU, 100, LIGHT_BALL, THUNDERBOLT, SURF, SING, HIDDEN_POWER, FIRE
	givepoke2 MEWTWO, 100, LEFTOVERS, CURSE, RECOVER, SUBMISSION, THUNDERBOLT, NORMAL
	givepoke2 MEW, 100, LEFTOVERS, SWORDS_DANCE, SUBMISSION, SOFTBOILED, SHADOW_BALL, NORMAL
	jumptext BattleIslandOwnText2

BattleIslandOwnText3:
	text "Hello, <PLAYER>."
	line "Now you get sth."
	done
	
BattleIslandOwnText2:
	text "Now you got every-"
	line "thing you need,"
	cont "to fight in this"
	cont "game."
	done

Script_BattleRoom__: ; 0x9f421
;	jump UnknownScript_0x9e39d
;	applymovement PLAYER, MovementData_0x9e58c
; beat all 7 opponents in a row
;Script_BattleRoomLoop: ; 0x9f425

;	loadvar TrainerNr, 0
;	loadvar TeamNr, 1

;	writebyte 1
;	special Function_LoadOpponentTrainerAndPokemons170b44_Own
    
;	appear $2
;	warpsound
;	waitbutton
;	applymovement $2, MovementData_0x9e592
;	loadfont
;	storetext 1 ; Random Text of opponent trainer
;	keeptextopen
;	loadmovesprites
;	storetext 1 ; Random Text of opponent trainer
;	winlosstext Text_Win, Text_Loss

;	special Function170215OwnSpecial ; calls predef startbattle

;	ld c, a
;	callba StoreText
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

Text_Win:
	text "You've won."
	line "Incredible!"
	done

Text_Loss:
	text "I've won."
	line "Yippie!"
	done

JumpText_BattleIsleBetaHotel:
	jumptext Text_BattleIsleBetaHotel

Text_BattleIsleBetaHotel:
	text "BATTLE ISLAND"
	line "HOTEL"

	para "We do everything"
	line "for our guests."
	cont "Really!"
	done

JumpText_BattleIsleBetaPokeCenterSign:
	jumptext Text_BattleIsleBetaPokeCenterSign

Text_BattleIsleBetaPokeCenterSign:
	text "#MON Center"

	para "The only one on"
	line "this isle."
	done

JumpText_BattleIsleBetaGameVersionSign:
	jumptext Text_BattleIsleBetaGameVersionSign

Text_BattleIsleBetaGameVersionSign:
	text "#MON Crystal:"
    line "Battle Isle"

	para "Version 0.01"
	line "Built: 25.10.2015"

	para "Developer:"
	line "JimB"
	done

JumpText_BattleIsleBetaDevHouseSignOut:
	jumptext Text_BattleIsleBetaDevHouseSignOut

Text_BattleIsleBetaDevHouseSignOut:
	text "The Developer"
    line "House"

	para "Home of the"
	line "Programmer JimB"
	done

JumpText_BattleIsleBetaWelcomeSign:
	jumptext Text_BattleIsleBetaWelcomeSign

Text_BattleIsleBetaWelcomeSign:
	text "Welcome to ..."

	para "BATTLE ISLAND."
	done

JumpText_BattleIsleBetaCompound:
	jumptext Text_BattleIsleBetaCompound

Text_BattleIsleBetaCompound:
	text "Wild Pokemon"

	para "Be careful."
	done

BattleIsleBeta_CoolTrainerScript:
	faceplayer
	loadfont
	showemote EMOTE_QUESTION, $2, 15
	writetext CoolTrainerText_01
	closetext
	loadmovesprites
    
	writebyte 0
	special Function_LoadOpponentTrainerAndPokemons170b44_Own
	special Function170215OwnSpecial ; calls predef startbattle
	special FadeBlackBGMap
	reloadmap
	end

BattleIsleBeta_CoolTrainer2Script:
	faceplayer
	loadfont
	writetext CoolTrainerText_01
	closetext
	loadmovesprites
    
	writebyte 1
	special Function_LoadOpponentTrainerAndPokemons170b44_Own
	special Function170215OwnSpecial ; calls predef startbattle
	special FadeBlackBGMap
	reloadmap
	end

BattleIsleBeta_CoolTrainer3Script:
	faceplayer
	loadfont
	writetext CoolTrainerText_01
	closetext
	loadmovesprites
    
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_MAP_CARD
    setflag ENGINE_POKEDEX
	end

text_own: MACRO
if STRLEN(\1) <= 18
    text \1
else
if STRSUB(\1,18,1) == ' '
    
endc
endc
	ENDM

CoolTrainerText_01:
	text "Come on."
	line "Let us fight."
	done

Text_BattleTowerWelcomesYou_: ; 0x9e5ab
	text "BATTLE TOWER"
	line "welcomes you!"

	para "I could show you"
	line "to a BATTLE ROOM."
	done

ReceptionistScript_0x9e3e2_:
;	writebyte $2
;	special Function170687
;	if_equal $3, BattleTowerBattleRoomScript_0x9f4e4
	loadfont
	writetext Text_BattleTowerWelcomesYou_
	keeptextopen
	writebyte $0
	special Function170687
	if_not_equal $0, Script_Menu_ChallengeExplanationCancel_
	;jump Script_Menu_ChallengeExplanationCancel_
	;jump Script_BattleTowerIntroductionYesNo
	end

Script_Menu_ChallengeExplanationCancel_:
;	writetext Text_WantToGoIntoABattleRoom
	;writebyte $1
	;special Special_Menu_ChallengeExplanationCancel_
    callasm Special_Menu_ChallengeExplanationCancel
	if_equal $1, Script_TiersRules
	if_equal $2, Script_ClausesRules
	jump UnknownScript_0x9e4b0_

UnknownScript_0x9e4b0_:
	writetext Text_WeHopeToServeYouAgain_
	closetext
	loadmovesprites
	end

Text_WeHopeToServeYouAgain_: ; 0x9ec09
	text "We hope to serve"
	line "you again."
	done

Script_TiersRules:
	writetext Text_TiersRules
UnknownScript_0x9e4a8_:
	writebyte $1
	special Function170687
	jump Script_Menu_ChallengeExplanationCancel_

Text_TiersRules:
;	text "BATTLE TOWER is a "   ; Text with max. length
; Tiers exist to promote balanced gameplay.
; OU stands for OverUsed and is the main metagame. It is the balanced tier that bans as few #MON as possible. In this game that means you can't use Mewtwo, Mew, Lugia and Ho-Oh. These #MON are seen as too strong and if they're allowed they would lead to an unbalanced metagame.
	text "Tiers exist to"
	line "promote balanced"
	cont "gameplay."
	para "OU stands for"
	line "OverUsed and is"
	cont "the main metagame."
	para "It is the balanced"
	line "tier that bans as"
	para "few #MON as"
	line "possible."
	
	para "In this game that"
	line "means you can't"
	para "use Mewtwo, Mew,"
	line "Lugia and Ho-Oh."
	para "These #MON are"
	line "seen as too strong"
	para "and if they're"
	line "allowed they would"
	para "lead to an"
	line "unbalanced"
	cont "metagame."
	done

	
Script_ClausesRules:
	writetext Text_ClausesRules
UnknownScript_0x9e4a8__:
	writebyte $1
	special Function170687
	jump Script_Menu_ChallengeExplanationCancel_
	
Text_ClausesRules:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

;Text_WantToGoIntoABattleRoom: ; 0x9e5ea
	text "Want to go into a"
	line "BATTLE ROOM?"
	done

Special_Menu_ChallengeExplanationCancel: ; 17d224
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_17d28f_

.asm_17d23c
	call LoadMenuDataHeader
	call Function17d246
	call WriteBackup
	ret
; 17d246

Function17d246: ; 17d246
	call InterpretMenu2
	jr c, .asm_17d264
	ld a, [ScriptVar]
	cp $5
	jr nz, .asm_17d25d
	ld a, [wcfa9]
	cp $3
	ret z
	jr c, .asm_17d25d
	dec a
	jr .asm_17d260

.asm_17d25d
	ld a, [wcfa9]

.asm_17d260
	ld [ScriptVar], a
	ret

.asm_17d264
	ld a, $4
	ld [ScriptVar], a
	ret
; 17d26a

MenuDataHeader_17d28f_: ; 17d28f
	db $40 ; flags
	db  0,  0 ; start coords
	db  7, 14 ; end coords
	dw MenuData2_17d297_
	db 1 ; default option

MenuData2_17d297_: ; 17d297
	db $a0 ; flags
	db 3
	db "Tiers", $1f, "a@"
	db "Clauses@"
	db "Cancel@"
; 17d2b6
