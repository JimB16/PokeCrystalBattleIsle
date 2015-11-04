BattleIsleBetaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger, $0000

.MapCallbacks:
	db 0

.Trigger
	end

NurseScript_0x18db28_:
	jumpstd pokecenternurse

GentlemanScript_0x18db2b_:
	jumptextfaceplayer GentlemanText_01

GentlemanText_01:
; In my active days Alakazam was unbeatable. Psychic #MON were so strong back then. Nowadays they can be beaten so easily.
;   line "created the system"
	text "In my active days"
	line "Alakazam was"
	cont "unbeatable."

	para "Psychic #MON"
	line "were so strong"
	cont "back then."

	para "Nowadays they can"
	line "be beaten easily."
	done

BattleIsleBetaPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, BATTLEISLE_BETA
	warp_def $7, $4, 1, BATTLEISLE_BETA
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x18db28_, -1
	person_event SPRITE_GENTLEMAN, 10, 13, $4, 1, 0, -1, -1, 0, 0, 0, GentlemanScript_0x18db2b_, -1
;	person_event SPRITE_FISHING_GURU, 5, 10, $6, 0, 0, -1, -1, 0, 0, 0, FishingGuruScript_0x18db2e_, -1
;	person_event SPRITE_POKEFAN_F, 8, 5, $2, 2, 1, -1, -1, 0, 0, 0, PokefanFScript_0x18db31_, -1
