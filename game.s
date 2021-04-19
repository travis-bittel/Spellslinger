	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	damagePlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	damagePlayer, %function
damagePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	push	{r4, lr}
	bne	.L2
	ldr	r3, .L10
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L8
.L2:
	ldr	r2, .L10+4
	ldr	r3, [r2, #4]
	sub	r0, r3, r0
	cmp	r0, #0
	str	r0, [r2, #4]
	ble	.L9
	pop	{r4, lr}
	bx	lr
.L8:
	mov	r0, #37
	ldr	r3, .L10+8
	ldr	r1, .L10+4
	ldr	r2, [r3]
	ldr	lr, [r1]
	ldr	ip, [r3, #4]
	ldr	r3, .L10+12
	cmp	lr, #10
	sub	r2, r2, #8
	strh	r2, [r3, #8]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	movgt	r3, #10
	pop	{r4, lr}
	strgt	r3, [r1]
	bx	lr
.L9:
	ldr	r3, .L10+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	player
	.word	shadowOAM
	.word	goToLose
	.size	damagePlayer, .-damagePlayer
	.align	2
	.global	playerIsWithinRange
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerIsWithinRange, %function
playerIsWithinRange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, r2
	ldr	r5, .L17
	ldr	r3, [r5, #8]
	ldr	r6, [r5, #28]
	ldr	lr, [r5, #24]
	ldr	ip, [r5, #12]
	sub	sp, sp, #16
	str	r3, [sp, #4]
	str	r6, [sp, #12]
	add	r2, r1, r2, lsl #1
	str	lr, [sp, #8]
	mov	r1, r3
	str	ip, [sp]
	mov	r3, #10
	ldr	r6, .L17+4
	sub	r0, r4, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #0
	bne	.L12
	ldr	r0, [r5, #12]
	sub	r4, r4, r0
	cmp	r4, #0
	mvngt	r0, #0
	movle	r0, #1
.L12:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	collision
	.size	playerIsWithinRange, .-playerIsWithinRange
	.align	2
	.global	playerIsAtSameElevation
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerIsAtSameElevation, %function
playerIsAtSameElevation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	ldr	r3, [r3, #8]
	sub	r0, r3, r0
	eor	r3, r0, r0, asr #31
	sub	r3, r3, r0, asr #31
	cmp	r3, r1
	ble	.L21
	cmp	r0, #0
	movgt	r0, #1
	mvnle	r0, #0
	bx	lr
.L21:
	mov	r0, #0
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.size	playerIsAtSameElevation, .-playerIsAtSameElevation
	.align	2
	.global	currentEncounterIsCleared
	.syntax unified
	.arm
	.fpu softvfp
	.type	currentEncounterIsCleared, %function
currentEncounterIsCleared:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L30
	add	r1, r3, #320
.L27:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L28
	cmp	r3, r1
	bne	.L27
	mov	r0, #1
	bx	lr
.L28:
	mov	r0, #0
	bx	lr
.L31:
	.align	2
.L30:
	.word	walkers
	.size	currentEncounterIsCleared, .-currentEncounterIsCleared
	.align	2
	.global	spawnPlayerBolt
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnPlayerBolt, %function
spawnPlayerBolt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L44
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L43
.L33:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L33
.L43:
	push	{r4, lr}
	mov	r4, #1
	ldr	ip, .L44+4
	ldr	r2, .L44+8
	add	r3, r3, r3, lsl #3
	ldr	lr, [r2, #8]
	ldr	r2, [ip, #28]
	add	r3, r0, r3, lsl #2
	ldr	r0, [ip, #8]
	add	r2, r2, r2, lsr #31
	add	r2, r0, r2, asr r4
	cmn	lr, #1
	str	r2, [r3, #8]
	str	r1, [r3, #28]
	ldreq	r2, [r3, #16]
	ldr	r1, [ip, #12]
	ldrne	r2, [ip, #24]
	subeq	r2, r1, r2
	addne	r2, r2, r1
	str	r4, [r3, #32]
	str	lr, [r3, #24]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	playerBolts
	.word	player
	.word	.LANCHOR1
	.size	spawnPlayerBolt, .-spawnPlayerBolt
	.align	2
	.global	spawnShooterProjectile
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnShooterProjectile, %function
spawnShooterProjectile:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L55
	mov	ip, #0
	mov	lr, r5
.L50:
	ldr	r4, [lr, #32]
	cmp	r4, #0
	beq	.L54
	add	ip, ip, #1
	cmp	ip, #5
	add	lr, lr, #36
	bne	.L50
	pop	{r4, r5, lr}
	bx	lr
.L54:
	mov	lr, #1
	add	ip, ip, ip, lsl #3
	add	r3, r3, r3, lsr #31
	add	ip, r5, ip, lsl #2
	add	r3, r1, r3, asr lr
	cmn	r2, #1
	str	r3, [ip, #8]
	ldrne	r3, [sp, #12]
	addne	r0, r0, r3
	str	r4, [ip, #28]
	str	lr, [ip, #32]
	str	r2, [ip, #24]
	str	r0, [ip, #12]
	pop	{r4, r5, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	shooterProjectiles
	.size	spawnShooterProjectile, .-spawnShooterProjectile
	.align	2
	.global	spawnEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemy, %function
spawnEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, r5, r6, lr}
	beq	.L58
	cmp	r0, #2
	beq	.L59
	cmp	r0, #0
	beq	.L71
.L57:
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	ldr	r2, .L75
.L62:
	ldr	r3, [r2, r0, lsl #6]
	cmp	r3, #0
	lsl	ip, r0, #6
	add	r0, r0, #1
	beq	.L72
	cmp	r0, #5
	bne	.L62
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	ldr	r0, .L75+4
	mov	r3, #0
	mov	r2, r0
.L66:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L73
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #80
	bne	.L66
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	ldr	r0, .L75+8
	mov	r3, #0
	mov	r2, r0
.L64:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L74
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #72
	bne	.L64
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	mov	lr, #1
	mov	r0, #10
	ldr	r2, .L75+12
	ldr	r2, [r2, #4]
	add	r4, r2, r2, lsl #2
	add	r2, r2, r4, lsl lr
	ldr	r4, .L75+16
	ldr	r2, [r4, r2, lsl #4]
	add	r1, r2, r1
	ldr	r2, .L75+20
	add	ip, r2, ip
	str	r1, [ip, #12]
	str	r3, [ip, #60]
	str	r3, [ip, #48]
	str	r3, [ip, #44]
	str	lr, [ip, #52]
	str	r0, [ip, #56]
	b	.L57
.L74:
	mov	lr, #3
	mov	ip, #15
	ldr	r2, .L75+12
	ldr	r2, [r2, #4]
	add	r3, r3, r3, lsl lr
	add	r5, r0, r3, lsl lr
	ldr	r6, .L75+16
	add	r3, r2, r2, lsl #2
	add	r2, r2, r3, lsl #1
	ldr	r3, [r6, r2, lsl #4]
	add	r1, r3, r1
	str	r1, [r5, #12]
	ldr	r3, .L75+24
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L75+28
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #2
	sub	r0, r0, #10
	str	r4, [r5, #44]
	str	r0, [r5, #60]
	str	r1, [r5, #56]
	b	.L57
.L73:
	mov	lr, #3
	mov	ip, #15
	ldr	r2, .L75+12
	ldr	r2, [r2, #4]
	add	r3, r3, r3, lsl #2
	add	r5, r0, r3, lsl #4
	ldr	r6, .L75+16
	add	r3, r2, r2, lsl #2
	add	r2, r2, r3, lsl #1
	ldr	r3, [r6, r2, lsl #4]
	add	r1, r3, r1
	str	r1, [r5, #12]
	ldr	r3, .L75+24
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L75+32
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl r1
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl r1
	sub	r0, r0, #10
	str	r4, [r5, #44]
	str	r0, [r5, #64]
	str	r1, [r5, #60]
	b	.L57
.L76:
	.align	2
.L75:
	.word	walkers+52
	.word	wraiths
	.word	shooters
	.word	.LANCHOR0
	.word	encounters
	.word	walkers
	.word	rand
	.word	-2004318071
	.word	-1240768329
	.size	spawnEnemy, .-spawnEnemy
	.align	2
	.global	startEncounter
	.syntax unified
	.arm
	.fpu softvfp
	.type	startEncounter, %function
startEncounter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L94
	ldr	r0, [r4, #4]
	ldr	r6, .L94+4
	add	r3, r0, r0, lsl #2
	add	r3, r0, r3, lsl #1
	add	r2, r6, r3, lsl #4
	ldr	r1, [r2, #8]
	ldr	r3, [r6, r3, lsl #4]
	ldr	r2, .L94+8
	cmp	r1, #0
	add	r1, r3, #1
	str	r3, [r4, #8]
	str	r1, [r2, #12]
	ble	.L78
	mov	r5, #0
	lsl	r3, r0, #2
.L79:
	add	r3, r3, r0
	add	r3, r0, r3, lsl #1
	add	r3, r5, r3, lsl #1
	add	r3, r3, #2
	add	r2, r6, r3, lsl #3
	ldr	r0, [r2, #4]
	ldr	r1, [r6, r3, lsl #3]
	bl	spawnEnemy
	ldr	r0, [r4, #4]
	add	r3, r0, r0, lsl #2
	add	r3, r0, r3, lsl #1
	add	r3, r6, r3, lsl #4
	ldr	r3, [r3, #8]
	add	r5, r5, #1
	cmp	r3, r5
	lsl	r3, r0, #2
	bgt	.L79
.L78:
	cmp	r0, #0
	beq	.L88
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L89
.L81:
	cmp	r3, #2
	beq	.L90
.L82:
	cmp	r3, #3
	beq	.L91
.L83:
	cmp	r3, #5
	beq	.L92
.L84:
	cmp	r3, #6
	beq	.L93
.L77:
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L94+16
	str	r2, [r3, #12]
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L81
.L89:
	ldr	r3, .L94+20
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #2
	bne	.L82
.L90:
	ldr	r3, .L94+12
	mov	r0, #1
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, [r4, #4]
	ldr	r2, .L94+16
	cmp	r3, #3
	str	r1, [r2, #12]
	bne	.L83
.L91:
	ldr	r3, .L94+20
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #5
	bne	.L84
.L92:
	ldr	r3, .L94+20
	mov	r0, #2
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #6
	bne	.L77
.L93:
	ldr	r3, .L94+12
	mov	r0, #2
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L94+16
	pop	{r4, r5, r6, lr}
	str	r2, [r3, #12]
	bx	lr
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	encounters
	.word	player
	.word	goToNewSpell
	.word	.LANCHOR1
	.word	goToNewEnemy
	.size	startEncounter, .-startEncounter
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #10
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L104
	add	r1, r3, #320
.L97:
	str	r5, [r3, #56]
	str	r2, [r3, #52]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	str	r2, [r3, #48]
	add	r3, r3, #64
	cmp	r3, r1
	bne	.L97
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L104+4
	add	r1, r3, #360
.L98:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L98
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L104+8
	add	r1, r3, #400
.L99:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #64]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L99
	pop	{r4, r5, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	walkers
	.word	shooters
	.word	wraiths
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bl	initEnemies
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L112
	add	r0, r3, #180
.L107:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L107
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L112+4
	add	r0, r3, #180
.L108:
	str	r2, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L108
	mov	fp, #240
	ldr	r3, .L112+8
	str	fp, [r3, #176]
	mov	fp, #480
	str	fp, [r3, #352]
	mov	fp, #80
	str	fp, [r3, #368]
	mov	fp, #720
	mov	r0, #2
	mov	lr, #1
	mov	ip, #60
	mov	r6, #160
	mov	r5, #3
	mov	r4, #100
	mov	r7, #120
	mov	r10, #140
	str	fp, [r3, #528]
	mov	fp, #960
	str	r0, [r3, #4]
	str	r0, [r3, #184]
	str	fp, [r3, #704]
	str	lr, [r3, #180]
	str	lr, [r3, #556]
	str	lr, [r3, #724]
	str	r7, [r3, #192]
	str	r7, [r3, #376]
	str	r6, [r3, #200]
	str	r6, [r3, #384]
	str	r6, [r3, #560]
	str	r5, [r3, #360]
	str	r5, [r3, #536]
	str	ip, [r3, #544]
	str	ip, [r3, #720]
	str	r4, [r3, #552]
	str	r2, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #196]
	str	r2, [r3, #204]
	str	r2, [r3, #356]
	str	r2, [r3, #372]
	str	r2, [r3, #380]
	str	r2, [r3, #388]
	str	r2, [r3, #532]
	str	r2, [r3, #548]
	str	r2, [r3, #564]
	str	r2, [r3, #708]
	str	r10, [r3, #728]
	str	r0, [r3, #712]
	str	r0, [r3, #916]
	str	r0, [r3, #1076]
	str	r0, [r3, #1100]
	mov	r0, #1200
	str	r0, [r3, #880]
	mov	r0, #1440
	str	r0, [r3, #1056]
	mov	r0, #4
	str	r0, [r3, #1064]
	ldr	r0, .L112+12
	str	r1, [r0, #24]
	mov	r1, #16
	str	r1, [r0, #28]
	mov	r1, #209
	mov	r9, #180
	mov	r8, #10
	str	lr, [r3, #732]
	str	r1, [r0, #8]
	mov	lr, #20
	mvn	r1, #0
	str	ip, [r3, #896]
	str	ip, [r3, #1072]
	str	r2, [r3, #884]
	str	r2, [r3, #900]
	str	r4, [r3, #904]
	str	r2, [r3, #908]
	str	r5, [r3, #888]
	str	r2, [r3, #1060]
	str	r4, [r3, #1080]
	str	r2, [r3, #1084]
	str	r10, [r3, #1088]
	str	r2, [r3, #1092]
	str	r9, [r3, #912]
	str	r9, [r3, #1096]
	ldr	ip, .L112+16
	ldr	r3, .L112+20
	str	lr, [r0, #12]
	str	r8, [r3, #4]
	str	r8, [r3]
	str	r1, [r3, #12]
	str	r2, [ip, #4]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	startEncounter
.L113:
	.align	2
.L112:
	.word	playerBolts
	.word	shooterProjectiles
	.word	encounters
	.word	player
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.align	2
	.global	initProjectiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initProjectiles, %function
initProjectiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L120
	add	r0, r3, #180
.L115:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L115
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L120+4
	add	r0, r3, #180
.L116:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L116
	bx	lr
.L121:
	.align	2
.L120:
	.word	playerBolts
	.word	shooterProjectiles
	.size	initProjectiles, .-initProjectiles
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #217
	mov	r7, #2
	ldr	r4, .L186
	add	r6, r4, #320
.L130:
	add	r0, r4, #12
	mov	r2, #6
	ldm	r0, {r0, r1}
	bl	playerIsWithinRange
	ldr	r3, [r4, #52]
	cmp	r3, #1
	mov	r5, r0
	beq	.L123
	cmp	r3, #2
	bne	.L124
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #52]
	bne	.L124
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r4, #60]
	bgt	.L178
.L124:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L130
	ldr	r5, .L186+4
	mov	r6, #0
	mov	r4, r5
	mov	r7, #3
	ldr	r8, .L186+8
	add	r9, r5, #360
.L144:
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L131
	cmp	r3, #3
	bne	.L133
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	bgt	.L179
.L133:
	add	r4, r4, #72
	cmp	r4, r9
	bne	.L144
	mov	r9, #0
	ldr	r4, .L186+12
	ldr	r8, .L186+8
	ldr	r7, .L186+16
	add	r6, r4, #400
.L158:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L180
.L159:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #72
	bne	.L158
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L123:
	cmp	r0, #0
	bne	.L127
	mvn	r2, #9
	ldr	r3, [r4, #20]
	rsb	r3, r3, #223
	str	r7, [r4, #52]
	str	r3, [r4, #8]
	str	r2, [r4, #60]
	b	.L124
.L131:
	mov	r2, #0
	add	r0, r4, #60
	ldm	r0, {r0, r3}
	add	r3, r3, #1
	add	r0, r0, #1
	str	r0, [r4, #60]
	str	r3, [r4, #64]
	mov	r1, r2
	ldr	r0, [r4, #12]
	bl	playerIsWithinRange
	ldr	r3, [r4, #60]
	cmp	r3, #59
	str	r0, [r4, #56]
	bgt	.L181
.L134:
	ldr	r3, [r4, #64]
	cmp	r3, #239
	strgt	r6, [r4, #64]
	strgt	r7, [r4, #48]
	b	.L133
.L180:
	mov	r2, #0
	ldr	r0, [r4, #64]
	ldr	r3, [r5, #64]
	add	r0, r0, #1
	add	r3, r3, #1
	str	r0, [r4, #64]
	str	r3, [r5, #64]
	mov	r1, r2
	ldr	r0, [r4, #12]
	bl	playerIsWithinRange
	ldr	r3, [r4, #64]
	cmp	r3, #89
	str	r0, [r4, #60]
	bgt	.L170
	ldr	r1, [r4, #20]
.L146:
	ldr	r2, [r4, #8]
	rsb	r3, r1, #225
	cmp	r2, r3
	blt	.L151
	ldr	r3, [r4, #72]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #72]
	bgt	.L152
.L176:
	ldr	r3, [r4, #76]
	lsl	r3, r3, #2
.L153:
	ldr	r0, [r4, #56]
	add	r3, r3, r0
	cmn	r3, #9
	bge	.L156
	add	r2, r2, #1
	add	r1, r1, r2
	add	r3, r3, #10
	cmp	r1, #224
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strgt	r9, [r4, #56]
	strgt	r9, [r4, #76]
	b	.L159
.L127:
	cmn	r0, #1
	beq	.L182
	ldr	r3, [r4, #48]
	add	r2, r3, #4
	cmp	r2, #9
	str	r2, [r4, #48]
	ldrgt	r2, [r4, #12]
	subgt	r3, r3, #6
	addgt	r2, r2, #1
	str	r8, [r4, #8]
	strgt	r3, [r4, #48]
	strgt	r2, [r4, #12]
	b	.L124
.L156:
	cmp	r3, #9
	strle	r3, [r4, #56]
	ble	.L159
	sub	r2, r2, #1
	add	r1, r1, r2
	sub	r3, r3, #10
	cmp	r1, #215
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strle	r9, [r4, #56]
	strle	r9, [r4, #76]
	b	.L159
.L151:
	add	r3, r2, r1
	cmp	r3, #215
	bgt	.L176
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	ble	.L176
	mvn	r0, #0
	mvn	r3, #3
	str	r9, [r4, #68]
	str	r0, [r4, #76]
	b	.L153
.L152:
	mov	r3, #1
	str	r9, [r4, #72]
	str	r3, [r4, #76]
	mov	r3, #4
	b	.L153
.L181:
	mov	r3, #0
	ldr	r2, .L186+8
.L138:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L183
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L138
.L137:
	str	r6, [r4, #60]
	b	.L134
.L170:
	mov	r3, #0
	ldr	r2, .L186+8
.L150:
	ldr	ip, [r2, #32]
	cmp	ip, #0
	beq	.L184
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L150
	ldr	r1, [r4, #20]
.L149:
	str	r9, [r4, #64]
	b	.L146
.L182:
	ldr	r2, [r4, #48]
	ldr	r3, [r4, #20]
	sub	r1, r2, #4
	rsb	r3, r3, #225
	cmp	r1, #0
	str	r1, [r4, #48]
	str	r3, [r4, #8]
	bgt	.L124
	ldr	r3, [r4, #12]
	add	r2, r2, #6
	sub	r3, r3, #1
	str	r2, [r4, #48]
	str	r3, [r4, #12]
	b	.L124
.L178:
	mov	r1, r0
	mov	r0, #3
	bl	damagePlayer
	str	r5, [r4, #60]
	b	.L124
.L179:
	mov	r2, #0
	mov	r3, #2
	mov	r1, r2
	str	r3, [r4, #48]
	ldr	r0, [r4, #12]
	str	r6, [r4, #68]
	bl	playerIsWithinRange
	mov	r3, #0
	str	r0, [r4, #56]
	ldr	r2, .L186+8
.L143:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L185
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L143
	b	.L133
.L183:
	mov	ip, #1
	add	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #2
	ldr	r2, [r4, #20]
	str	r1, [r3, #28]
	ldr	r1, [r4, #8]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr ip
	str	r2, [r3, #8]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #12]
	cmn	r0, #1
	addne	r2, r2, r1
	str	r0, [r3, #24]
	str	ip, [r3, #32]
	str	r2, [r3, #12]
	b	.L137
.L184:
	mov	lr, #1
	ldr	r1, [r4, #20]
	add	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #2
	ldr	r2, [r7, #8]
	cmn	r0, #1
	str	r0, [r3, #24]
	add	r0, r1, r1, lsr #31
	add	r2, r2, r0, asr lr
	str	r2, [r3, #8]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #12]
	addne	r2, r2, r0
	str	ip, [r3, #28]
	str	lr, [r3, #32]
	str	r2, [r3, #12]
	b	.L149
.L185:
	mov	ip, #1
	add	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #2
	ldr	r2, [r4, #20]
	str	r1, [r3, #28]
	ldr	r1, [r4, #8]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr ip
	str	r2, [r3, #8]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #12]
	cmn	r0, #1
	addne	r2, r2, r1
	str	r0, [r3, #24]
	str	ip, [r3, #32]
	str	r2, [r3, #12]
	b	.L133
.L187:
	.align	2
.L186:
	.word	walkers
	.word	shooters
	.word	shooterProjectiles
	.word	wraiths
	.word	player
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateProjectiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateProjectiles, %function
updateProjectiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L272
	ldr	r4, .L272+4
	ldr	fp, .L272+8
	ldr	r9, .L272+12
	sub	sp, sp, #20
	add	r10, r4, #180
	add	r7, r3, #320
.L217:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L264
.L190:
	add	r4, r4, #36
	cmp	r4, r10
	bne	.L217
	mov	r10, #0
	ldr	r4, .L272+16
	ldr	r5, .L272+20
	ldr	r9, .L272+12
	ldr	r8, .L272+8
	ldr	r7, .L272+24
	add	r6, r4, #180
.L229:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L265
.L219:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L229
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L265:
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r2, lsl #3
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L220
	b	.L266
.L224:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L222
.L220:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L224
	ldr	r3, [r4, #28]
.L225:
	cmn	r3, #9
	bge	.L222
	cmn	r2, #1
	bne	.L222
.L226:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L226
.L222:
	add	r1, r5, #24
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L267
.L227:
	ldr	r1, [r8, #8]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r3, r3, r1
	ldr	r1, [r7, #16]
	cmp	r3, #240
	sub	r2, r2, r1
	stm	r4, {r2, r3}
	strhi	r10, [r4, #32]
	b	.L219
.L264:
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	rsb	r3, r2, r2, lsl #4
	add	r3, r3, r1
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L191
	b	.L268
.L195:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L193
.L191:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L195
	ldr	r3, [r4, #28]
.L196:
	cmn	r3, #9
	bge	.L193
	cmn	r2, #1
	bne	.L193
.L197:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L197
.L193:
	mov	r6, #0
	ldr	r5, .L272
.L203:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L269
.L198:
	add	r5, r5, #64
	cmp	r5, r7
	bne	.L203
	ldr	r5, .L272+28
	add	r8, r5, #360
.L209:
	ldr	r6, [r5, #48]
	cmp	r6, #2
	beq	.L270
.L204:
	add	r5, r5, #72
	cmp	r5, r8
	bne	.L209
	mov	r8, #0
	ldr	r5, .L272+32
	add	r6, r5, #400
.L215:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L271
.L210:
	add	r5, r5, #80
	cmp	r5, r6
	bne	.L215
	ldr	r3, .L272+24
	ldr	r1, [fp, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r4, #8]
	sub	r0, r0, r1
	sub	r3, r3, r2
	cmp	r0, #240
	str	r3, [r4]
	movhi	r3, #0
	str	r0, [r4, #4]
	strhi	r3, [r4, #32]
	b	.L190
.L271:
	add	r1, r5, #16
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L263
	ldr	r3, [r5, #52]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r8, [r4, #32]
	str	r3, [r5, #52]
	ble	.L212
.L263:
	ldr	r0, [r4, #12]
	b	.L210
.L269:
	add	r1, r5, #16
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L261
	ldr	r3, [r5, #56]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r6, [r4, #32]
	str	r3, [r5, #56]
	ble	.L200
.L261:
	ldr	r0, [r4, #12]
	b	.L198
.L270:
	add	r1, r5, #16
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L262
	mov	r2, #0
	ldr	r3, [r5, #52]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r2, [r4, #32]
	str	r3, [r5, #52]
	ble	.L206
.L262:
	ldr	r0, [r4, #12]
	b	.L204
.L267:
	mov	r1, #0
	mov	r0, #3
	bl	damagePlayer
	str	r10, [r4, #32]
	b	.L227
.L200:
	ldr	r3, .L272
	str	r6, [r5, #52]
.L202:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L230
	cmp	r3, r7
	bne	.L202
	mov	r1, #2
.L201:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L272+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L261
.L212:
	ldr	r3, .L272
	str	r8, [r5, #48]
.L214:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L232
	cmp	r3, r7
	bne	.L214
	mov	r1, #2
.L213:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L272+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L263
.L206:
	mov	r2, #0
	ldr	r3, .L272
	str	r2, [r5, #48]
.L208:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L231
	cmp	r3, r7
	bne	.L208
.L207:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L272+36
	add	r3, r2, r3, lsl #4
	str	r6, [r3, #4]
	b	.L262
.L268:
	ldr	r0, [r4, #12]
	b	.L196
.L266:
	ldr	r0, [r4, #12]
	b	.L225
.L232:
	mov	r1, #1
	b	.L213
.L230:
	mov	r1, #1
	b	.L201
.L231:
	mov	r6, #1
	b	.L207
.L273:
	.align	2
.L272:
	.word	walkers
	.word	playerBolts
	.word	.LANCHOR0
	.word	collision
	.word	shooterProjectiles
	.word	player
	.word	.LANCHOR1
	.word	shooters
	.word	wraiths
	.word	encounters
	.size	updateProjectiles, .-updateProjectiles
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L324
	ldr	r3, [r4, #12]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #12]
	ldr	r3, [r4, #16]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #16]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L278
	ldr	r6, .L324+8
	ldr	r5, .L324+12
.L279:
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L286
	mvn	r1, #0
	ldr	r3, [r4, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L324+16
	ldr	r3, [r2, r3, lsl #4]
	ldr	r2, [r5, #12]
	cmp	r2, r3
	str	r1, [r6, #8]
	bgt	.L320
.L286:
	ldr	r3, .L324+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L291
	ldr	r3, .L324+24
	ldrh	r3, [r3]
	ands	r7, r3, #1
	beq	.L321
.L291:
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	tst	r3, #2
	bne	.L293
	ldr	r3, [r6, #12]
	cmp	r3, #0
	ble	.L293
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L322
.L293:
	mov	r3, #0
	str	r3, [r4]
.L295:
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L297
	ldr	r2, [r6, #12]
	cmp	r2, #1
	ble	.L297
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L297
	ldr	r0, [r4, #36]
	cmp	r0, #0
	ldr	ip, [r5, #8]
	ldr	r2, [r5, #28]
	blt	.L323
	add	lr, ip, r2
	cmp	lr, #213
	str	r3, [r4, #28]
	ble	.L301
.L299:
	add	r0, r0, #1
	str	r0, [r4, #36]
.L301:
	cmp	r0, #1
	movgt	r3, #0
	subgt	ip, ip, #1
	strgt	ip, [r5, #8]
	strgt	r3, [r4, #36]
.L300:
	ldr	r3, [r4, #40]
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #40]
	ble	.L303
	mov	r3, #0
	sub	r1, r1, #1
	cmp	r1, r3
	str	r1, [r6]
	str	r3, [r4, #40]
	mvneq	r3, #44
	streq	r3, [r4, #28]
.L303:
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L314
.L308:
	bl	updateEnemies
	bl	updateProjectiles
	ldr	r1, [r4, #8]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	sub	r2, r2, r1
	ldr	r1, [r6, #16]
	sub	r3, r3, r1
	ldr	r1, [r6]
	cmp	r1, #9
	str	r3, [r5]
	str	r2, [r5, #4]
	ldr	r3, [r4, #28]
	ble	.L311
	cmp	r3, #0
	blt	.L311
.L274:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L297:
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #28]
	add	r3, r1, r2
	cmp	r3, #224
	bgt	.L305
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmn	r3, #2
	str	r3, [r4, #36]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #36]
.L305:
	ldr	r3, .L324+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L308
	ldr	r3, [r6, #12]
	cmp	r3, #1
	ble	.L308
.L314:
	ldr	r1, [r5, #8]
	add	r2, r1, r2
	cmp	r2, #224
	bgt	.L308
	ldr	r3, [r4, #36]
	sub	r3, r3, #3
	cmn	r3, #2
	str	r3, [r4, #36]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #36]
	b	.L308
.L311:
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #28]
	ble	.L274
	mov	r3, #0
	add	r1, r1, #1
	str	r1, [r6]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L321:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	blt	.L291
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L291
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bgt	.L291
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L291
	bl	spawnPlayerBolt
	mov	r2, #10
	ldr	r3, [r6]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6]
	ldrle	r3, [r4, #28]
	suble	r3, r3, #45
	str	r7, [r4, #16]
	str	r2, [r4, #12]
	strle	r3, [r4, #28]
	b	.L291
.L320:
	ldr	r3, [r5, #28]
	ldr	r1, [r5, #8]
	add	r1, r1, r3
	ldr	r3, [r4, #24]
	cmp	r1, #224
	and	r3, r3, r3, asr #31
	suble	r3, r3, #4
	subgt	r3, r3, #8
	cmn	r3, #9
	str	r3, [r4, #24]
	sublt	r2, r2, #1
	addlt	r3, r3, #10
	strlt	r2, [r5, #12]
	strlt	r3, [r4, #24]
	b	.L286
.L278:
	mov	r7, #1
	ldr	r2, [r4, #4]
	ldr	r1, .L324+16
	ldr	r5, .L324+12
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl r7
	ldr	ip, [r1, r3, lsl #4]
	ldr	lr, [r5, #12]
	ldr	r0, [r5, #24]
	ldr	r6, .L324+8
	add	ip, ip, #238
	add	r0, lr, r0
	cmp	ip, r0
	str	r7, [r6, #8]
	add	r3, r1, r3, lsl #4
	blt	.L280
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #8]
	add	r2, r2, r3
	ldr	r3, [r4, #24]
	cmp	r2, #224
	bic	r3, r3, r3, asr #31
	addle	r3, r3, #4
	addgt	r3, r3, #8
	cmp	r3, #9
	str	r3, [r4, #24]
	addgt	lr, lr, #1
	subgt	r3, r3, #10
	strgt	lr, [r5, #12]
	strgt	r3, [r4, #24]
	b	.L279
.L280:
	ldr	r3, [r3, #4]
	cmp	r3, #2
	bne	.L279
	add	r2, r2, #1
	cmp	r2, #6
	str	r2, [r4, #4]
	ble	.L284
	ldr	r3, .L324+28
	mov	lr, pc
	bx	r3
	b	.L279
.L322:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bgt	.L293
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L293
	mov	ip, #36
	ldr	r2, [r4]
	add	r2, r2, #1
	ldr	r0, [r4, #32]
	add	r3, r2, r2, lsl #2
	add	r3, r3, #30
	add	r3, r3, r0
	ldr	r0, .L324+32
	cmp	r3, #1000
	str	r2, [r4]
	strh	ip, [r0, #12]	@ movhi
	strlt	r3, [r4, #32]
	blt	.L295
	sub	r1, r1, #1
	sub	r3, r3, #1000
	cmp	r1, #0
	str	r1, [r6]
	str	r3, [r4, #32]
	ldreq	r3, [r4, #28]
	subeq	r3, r3, #45
	streq	r3, [r4, #28]
	b	.L295
.L323:
	add	r0, r2, ip
	cmp	r0, #213
	str	r3, [r4, #36]
	str	r3, [r4, #28]
	ble	.L300
	mov	r0, r3
	b	.L299
.L284:
	bl	startEncounter
	b	.L279
.L325:
	.align	2
.L324:
	.word	.LANCHOR0
	.word	67109120
	.word	.LANCHOR1
	.word	player
	.word	encounters
	.word	oldButtons
	.word	buttons
	.word	goToWin
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L342
	ldr	r2, .L342+4
	ldr	r3, [r5, #44]
	add	r2, r2, r3, lsl #3
	mov	r1, r2
	mov	r10, #512
	mov	r9, #2
	ldr	r6, .L342+8
	sub	sp, sp, #12
	str	r3, [sp, #4]
	ldr	r3, .L342+12
	ldr	r8, [r5, #8]
	ldr	r7, [r6, #16]
	ldr	r4, .L342+16
	add	lr, r3, #320
.L329:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	strheq	r10, [r1]	@ movhi
	beq	.L328
	add	r0, r3, #8
	ldm	r0, {r0, ip}
	sub	r0, r0, r7
	sub	ip, ip, r8
	str	r0, [r3]
	orr	r0, r0, r4
	strh	r9, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	str	ip, [r3, #4]
	strh	ip, [r1, #2]	@ movhi
.L328:
	add	r3, r3, #64
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L329
	mov	r1, r2
	mov	fp, #512
	mov	r10, #6
	mov	r9, #7
	ldr	r3, .L342+20
	ldr	r8, [r5, #8]
	ldr	r7, [r6, #16]
	add	r4, r3, #360
.L333:
	ldr	r0, [r3, #48]
	cmp	r0, #0
	strheq	fp, [r1, #40]	@ movhi
	beq	.L332
	cmp	r0, #2
	ldr	r0, [r3, #8]
	sub	r0, r0, r7
	str	r0, [r3]
	mvn	r0, r0, lsl #17
	movne	lr, r10
	moveq	lr, r9
	mvn	r0, r0, lsr #17
	ldr	ip, [r3, #12]
	sub	ip, ip, r8
	strh	lr, [r1, #44]	@ movhi
	strh	r0, [r1, #40]	@ movhi
	str	ip, [r3, #4]
	strh	ip, [r1, #42]	@ movhi
.L332:
	add	r3, r3, #72
	cmp	r3, r4
	add	r1, r1, #8
	bne	.L333
	mov	r8, #512
	mov	r7, #6
	mov	r4, #7
	ldr	r3, .L342+24
	ldr	r6, [r6, #16]
	ldr	lr, [r5, #8]
	ldr	ip, .L342+16
	add	r0, r3, #400
.L337:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r8, [r2, #80]	@ movhi
	beq	.L336
	cmp	r1, #2
	movne	r10, r7
	moveq	r10, r4
	ldr	r1, [r3, #8]
	ldr	r9, [r3, #12]
	sub	r1, r1, r6
	sub	r9, r9, lr
	str	r1, [r3]
	orr	r1, r1, ip
	strh	r10, [r2, #84]	@ movhi
	strh	r1, [r2, #80]	@ movhi
	str	r9, [r3, #4]
	strh	r9, [r2, #82]	@ movhi
.L336:
	add	r3, r3, #80
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L337
	ldr	r3, [sp, #4]
	add	r3, r3, #15
	str	r3, [r5, #44]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L343:
	.align	2
.L342:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.word	walkers
	.word	-32768
	.word	shooters
	.word	wraiths
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawProjectiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawProjectiles, %function
drawProjectiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L354
	ldr	r2, .L354+4
	ldr	r4, [r5, #44]
	add	r2, r2, r4, lsl #3
	mov	r1, r2
	mov	r7, #512
	mov	r6, #3
	ldr	r3, .L354+8
	add	ip, r3, #180
.L347:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	ldrne	lr, [r3]
	ldrne	r0, [r3, #4]
	add	r3, r3, #36
	strhne	r6, [r1, #4]	@ movhi
	strhne	lr, [r1]	@ movhi
	strhne	r0, [r1, #2]	@ movhi
	strheq	r7, [r1]	@ movhi
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L347
	mov	r6, #512
	mov	lr, #35
	ldr	r3, .L354+12
	add	r0, r3, #180
.L350:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	ldrne	ip, [r3]
	ldrne	r1, [r3, #4]
	add	r3, r3, #36
	strhne	lr, [r2, #44]	@ movhi
	strhne	ip, [r2, #40]	@ movhi
	strhne	r1, [r2, #42]	@ movhi
	strheq	r6, [r2, #40]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L350
	add	r4, r4, #10
	str	r4, [r5, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L355:
	.align	2
.L354:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	playerBolts
	.word	shooterProjectiles
	.size	drawProjectiles, .-drawProjectiles
	.align	2
	.global	drawUI
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawUI, %function
drawUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	lr, .L366
	ldr	r1, .L366+4
	ldr	ip, [lr, #44]
	add	r1, r1, ip, lsl #3
	mov	r0, r1
	mov	r3, #0
	mov	r7, #4
	mov	r6, #5
	ldr	r5, .L366+8
	ldr	r4, [r5, #4]
.L359:
	cmp	r4, r3
	rsb	r2, r3, r3, lsl #3
	add	r2, r2, #4
	ldrhle	r2, [r0]
	add	r3, r3, #1
	orrle	r2, r2, #512
	strhgt	r7, [r0]	@ movhi
	strhgt	r2, [r0, #2]	@ movhi
	strhgt	r6, [r0, #4]	@ movhi
	strhle	r2, [r0]	@ movhi
	cmp	r3, #10
	add	r0, r0, #8
	bne	.L359
	mov	r3, #0
	mov	r4, #4
	ldr	r0, [r5]
.L362:
	cmp	r0, r3
	rsb	r2, r3, r3, lsl #3
	add	r2, r2, #166
	ldrhle	r2, [r1, #80]
	add	r3, r3, #1
	orrle	r2, r2, #512
	strhgt	r4, [r1, #80]	@ movhi
	strhgt	r2, [r1, #82]	@ movhi
	strhgt	r4, [r1, #84]	@ movhi
	strhle	r2, [r1, #80]	@ movhi
	cmp	r3, #10
	add	r1, r1, #8
	bne	.L362
	add	ip, ip, #20
	str	ip, [lr, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L367:
	.align	2
.L366:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawUI, .-drawUI
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L376
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	mov	r1, #67108864
	ldr	r2, .L376+4
	ldr	r0, .L376+8
	ldrh	r3, [r2, #8]
	push	{r4, lr}
	ldrh	r0, [r0, #16]
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, .L376+12
	strh	r0, [r1, #18]	@ movhi
	ldr	r0, [r3]
	mvn	r1, r0, lsl #17
	mvn	r1, r1, lsr #17
	mov	lr, #1
	ldr	r4, [r2]
	ldrh	ip, [r3, #4]
	ldr	r3, .L376+16
	cmp	r4, #0
	strh	r1, [r3]	@ movhi
	ldrhle	r1, [r3, #8]
	subgt	r0, r0, #10
	orrle	r1, r1, #512
	strh	lr, [r3, #4]	@ movhi
	strhgt	r0, [r3, #8]	@ movhi
	strhle	r1, [r3, #8]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strhgt	ip, [r3, #10]	@ movhi
	mov	r3, #2
	ldr	r4, .L376+20
	str	r3, [r2, #44]
	bl	drawEnemies
	bl	drawProjectiles
	bl	drawUI
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L376+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L377:
	.align	2
.L376:
	.word	state
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	player
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.global	playerMovementStep
	.global	levitateHeightStep
	.global	levitateManaConsumptionStep
	.global	shieldCooldown
	.global	boltCooldown
	.global	globalCooldown
	.global	durationShielded
	.global	spellsUnlocked
	.global	playerFacingDirection
	.global	playerManaDrainStep
	.global	playerManaStep
	.global	currentPlayerMana
	.global	currentPlayerHealth
	.global	vOff
	.global	hOff
	.global	shadowOAMIndex
	.global	currentEncounter
	.comm	shooterProjectiles,180,4
	.comm	playerBolts,180,4
	.comm	wraiths,400,4
	.comm	shooters,360,4
	.comm	walkers,320,4
	.comm	encounters,1232,4
	.comm	player,56,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	currentPlayerMana, %object
	.size	currentPlayerMana, 4
currentPlayerMana:
	.word	10
	.type	currentPlayerHealth, %object
	.size	currentPlayerHealth, 4
currentPlayerHealth:
	.word	10
	.type	playerFacingDirection, %object
	.size	playerFacingDirection, 4
playerFacingDirection:
	.word	1
	.type	spellsUnlocked, %object
	.size	spellsUnlocked, 4
spellsUnlocked:
	.word	2
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	95
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	durationShielded, %object
	.size	durationShielded, 4
durationShielded:
	.space	4
	.type	currentEncounter, %object
	.size	currentEncounter, 4
currentEncounter:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	globalCooldown, %object
	.size	globalCooldown, 4
globalCooldown:
	.space	4
	.type	boltCooldown, %object
	.size	boltCooldown, 4
boltCooldown:
	.space	4
	.type	shieldCooldown, %object
	.size	shieldCooldown, 4
shieldCooldown:
	.space	4
	.type	playerMovementStep, %object
	.size	playerMovementStep, 4
playerMovementStep:
	.space	4
	.type	playerManaStep, %object
	.size	playerManaStep, 4
playerManaStep:
	.space	4
	.type	playerManaDrainStep, %object
	.size	playerManaDrainStep, 4
playerManaDrainStep:
	.space	4
	.type	levitateHeightStep, %object
	.size	levitateHeightStep, 4
levitateHeightStep:
	.space	4
	.type	levitateManaConsumptionStep, %object
	.size	levitateManaConsumptionStep, 4
levitateManaConsumptionStep:
	.space	4
	.type	shadowOAMIndex, %object
	.size	shadowOAMIndex, 4
shadowOAMIndex:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
