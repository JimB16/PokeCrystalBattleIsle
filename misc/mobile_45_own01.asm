StoreTextOwn:: ; 11c000
; paramter:
; c contains byte from script (for BattleTower = 1)
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
IF DEF(CRYSTAL11)
	ld hl, wd10a
ELSE
	ld hl, wd105
ENDC
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, Unknown_11f2f0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_11c026
;	ld a, [hRandomAdd]
	ld a, 1		; load the second text for win and lose a battle
	and $1f
	cp $19
	jr c, .asm_11c021
	sub $19

.asm_11c021
	ld hl, BTTrainerTexts
	jr .asm_11c033

.asm_11c026
	ld a, [hRandomAdd]
	and $f
	cp $f
	jr c, .asm_11c030
	sub $f

.asm_11c030
	ld hl, Unknown_11f3ce

.asm_11c033
	ld b, 0
	dec c
	jr nz, .asm_11c03d
	ld [wd000 + $200], a
	jr .asm_11c040

.asm_11c03d
	ld a, [wd000 + $200]

.asm_11c040
	push af
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	pop af
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld l, c
	ld h, a
	bccoord 1, 14
	pop af
	ld [rSVBK], a
	call PlaceWholeStringInBoxAtOnce
	ret
; 11c05d
