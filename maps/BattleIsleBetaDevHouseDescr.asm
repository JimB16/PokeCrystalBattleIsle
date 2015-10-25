BattleIsleBetaDevHouse_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger, $0000

.MapCallbacks:
	db 0

.Trigger
	end

BattleIsleBetaDevHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 11, 8, 2, BATTLEISLE_BETA
	warp_def 11, 9, 2, BATTLEISLE_BETA

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 10, 7, SIGNPOST_READ, JumpText_BattleIsleBetaDevHouseSign
	signpost 5, 0, SIGNPOST_READ, JumpText_BattleIsleBetaDevHouseShelf01

.PersonEvents:
	db 1
	person_event SPRITE_COOLTRAINER_M, 6+4, 5+4, $7, 0, 0, -1, -1, PAL_OW_RED, 0, 0, BattleIsleBeta_DeveloperScript, -1
;	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x18db28_, -1
;	person_event SPRITE_GENTLEMAN, 10, 13, $4, 1, 0, -1, -1, 0, 0, 0, GentlemanScript_0x18db2b_, -1
;	person_event SPRITE_FISHING_GURU, 5, 10, $6, 0, 0, -1, -1, 0, 0, 0, FishingGuruScript_0x18db2e_, -1
;	person_event SPRITE_POKEFAN_F, 8, 5, $2, 2, 1, -1, -1, 0, 0, 0, PokefanFScript_0x18db31_, -1

JumpText_BattleIsleBetaDevHouseSign:
	jumptext Text_BattleIsleBetaDevHouseSign

Text_BattleIsleBetaDevHouseSign:
	text "Development Corner"

	para "Here is the place"
	line "where the"
    cont "programmer works"
    cont "on this game."
	done

JumpText_BattleIsleBetaDevHouseShelf01:
	jumptext Text_BattleIsleBetaDevHouseShelf01

Text_BattleIsleBetaDevHouseShelf01:
	text "There are some"
    line "books about"
    cont "programming."
	done

BattleIsleBeta_DeveloperScript:
	faceplayer
	loadfont
	writetext DeveloperText_01
	closetext
	loadmovesprites
	end

DeveloperText_01:
	text "Don't interrupt"
    line "me."
    
    para "I'm trying to fix"
	line "a bug at the"
    cont "moment."
	done
