Function170215OwnSpecial: ; 170215
	ld c, $1
	callba StoreTextOwn ; load Win- and Loss-Text

	xor a
	ld [wcf63], a
	call Function17022cOwn
	ret

Function17022cOwn: ; 17022c
.asm_17022c_
	call Function17023aOwn
	call DelayFrame
	ld a, [wcf63]
	cp $1
	jr nz, .asm_17022c_
	ret

Function17023aOwn: ; 17023a
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_170249Own
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_170249Own:
	dw Function17024dOwn
	dw SkipBattleTowerBattle

Function17024dOwn: ; 17024d
	ld a, [Options]
	push af
	ld hl, Options
	set 6, [hl]
	ld a, [InBattleTowerBattle]
	push af
	or $1
	ld [InBattleTowerBattle], a
	xor a
	ld [InLinkBattle], a
	callba Mobile_HealParty
	callba HealParty
	call Function1702b7Own
	call Function170bf7
	predef StartBattle
;	callba LoadPokemonData
	callba HealParty
	ld a, [wd0ee]
	ld [ScriptVar], a
	and a
	jr nz, .asm_1702a9_
	ld a, $1
	call GetSRAMBank
	ld a, [$be46]
	ld [wcf64], a
	call CloseSRAM
	ld hl, StringBuffer3
	ld a, [wcf64]
	add $f7
	ld [hli], a
	ld a, $50
	ld [hl], a

.asm_1702a9_
	pop af
	ld [InBattleTowerBattle], a
	pop af
	ld [Options], a
	ld a, $1
	ld [wcf63], a
	ret
; 1702b7

; Initialise the BattleTower-Trainer and his Pkmn
Function1702b7Own: ; 1702b7
	call CopyBTTrainer_FromBT_OTrainer_TowBT_OTTempCopyOwn
	ld de, $c643
	ld c, $b
	callba Function17d073
	jr nc, .asm_1702db
	ld a, [wBT_OTTempCopy + 11]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c643
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_1702db
	ld de, $c67e
	ld c, $b
	callba Function17d073
	jr nc, .asm_1702fc
	ld a, [$c64e]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c67e
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_1702fc
	ld de, $c686 + 51
	ld c, $b
	callba Function17d073
	jr nc, .asm_17031d
	ld a, [$c689]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c686 + 51
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_17031d
	ld a, $50
	ld [$c64d], a
	ld [$c688], a
	ld [$c68a + 57], a
	call Function170c98
	ld de, wBT_OTTempCopy
	ld c, $a
	callba Function17d073
	jr nc, .asm_17033d
	ld hl, String_170426
	jr .asm_170340

.asm_17033d
	ld hl, wBT_OTTempCopy ; 0xc608

.asm_170340
	ld de, wd26b
	ld bc, $000a
	call CopyBytes

	ld a, $50
	ld [de], a
	ld hl, wBT_OTTempCopy + wBT_OTTempCopy_TrainerClass
	ld a, [hli]
	ld [OtherTrainerClass], a
	ld a, $ea
	ld [BGMapBuffer], a
	ld a, $d3
	ld [wcd21], a
	ld de, OTPartyMon1Species
	ld bc, OTPartyCount

	push hl
	ld hl, Own_PkmnNrOfTeam
	ld a, [hl]
	pop hl
	
	;ld a, $6 ; Number of Pkmn the BattleTower-Trainer has
	ld [bc], a
	inc bc

	; Copy Pkmn into Memory from the address in hl
.asm_170367
;	push hl ;;
	push af
	ld a, [hl]
	ld [bc], a
	inc bc
	push bc
	ld bc, $0030
	call CopyBytes
	push de
	ld a, [BGMapBuffer]
	ld e, a
	ld a, [wcd21]
	ld d, a
	ld bc, $000b
	call CopyBytes
	ld a, e
	ld [BGMapBuffer], a
	ld a, d
	ld [wcd21], a
	pop de
	pop bc
	pop af
;	pop hl ;;
	dec a
	and a
	jr nz, .asm_170367
	ld a, $ff
	ld [bc], a
	ret
; 170394

CopyBTTrainer_FromBT_OTrainer_TowBT_OTTempCopyOwn: ; 1704a2
; copy the BattleTower-Trainer data that lies at 'BT_OTrainer' to 'wBT_OTTempCopy'
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, BT_OTrainer ; $d100
	ld de, wBT_OTTempCopy ; $c608
	ld bc, $a + $1 + 6*$3b ; BT_OTrainerEnd - BT_OTrainer ; $e0 = $a + $1 + 3*$3b + $24
                                        ;	  = $a + $1 + BATTLETOWER_NROFPKMNS * (BATTLETOWER_PKMNSTRUCTLENGTH + PKMN_NAME_LENGTH) + BATTLETOWER_TRAINERDATALENGTH
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, $2
	ld [s1_be45], a
	ld hl, sNrOfBeatenBattleTowerTrainers
	inc [hl]
	call CloseSRAM
SkipBattleTowerBattleOwn: ; 1704c9
	ret
; 1704ca

Function_LoadOpponentTrainerAndPokemons170b44_Own: ; 0x170b44
	callba Function_LoadOpponentTrainerAndPokemons_Own
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, wd10a
	ld a, [hl]
	dec a
	ld c, a
	ld b, $0
	pop af
	ld [rSVBK], a
	ld hl, Unknown_170b90
	add hl, bc
	ld a, [hl]
	ld [wcd49], a

;	ld a, [ScriptVar]
	ret
; 170b90

