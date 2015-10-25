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

FishingGuruScript_0x18db2e_:
	jumptextfaceplayer UnknownText_0x18dbee_

PokefanFScript_0x18db31_:
	jumptextfaceplayer UnknownText_0x18dc19_

GentlemanText_01:
; In my active days Alakazam was unbeatable. Psychic #MON were so strong back then. Nowadays they can be beaten so easily.
;   line "created the system"
	text "In my active"
	line "days Alakzam was"
	cont "unbeatable."

	para "Psychic #MON"
	line "were so strong"
	cont "back then."

	para "Nowadays they can"
	line "be beaten easily."
	done

UnknownText_0x18db88_:
	text "This BILL guy"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

UnknownText_0x18dbee_:
	text "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

UnknownText_0x18dc19_:
	text "Do you know about"
	line "APRICORNS?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#MON with it."

	para "Before # BALLS"
	line "were invented,"

	para "everyone used"
	line "APRICORNS."
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
