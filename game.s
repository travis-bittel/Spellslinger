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
	bne	.L2
	ldr	r3, .L12
	ldr	r2, [r3]
	cmp	r2, #0
	bgt	.L11
.L2:
	ldr	r2, .L12+4
	ldr	r3, [r2, #4]
	sub	r0, r3, r0
	cmp	r0, #0
	str	r0, [r2, #4]
	bxgt	lr
	push	{r4, lr}
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L11:
	mov	r0, #30
	ldr	r1, .L12+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #10
	str	r0, [r3, #4]
	movgt	r3, #10
	strle	r2, [r1]
	strgt	r3, [r1]
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LANCHOR1
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
	ldr	r5, .L19
	ldr	r3, [r5]
	ldr	r6, [r5, #28]
	ldr	lr, [r5, #24]
	ldr	ip, [r5, #4]
	sub	sp, sp, #16
	str	r3, [sp, #4]
	str	r6, [sp, #12]
	add	r2, r1, r2, lsl #1
	str	lr, [sp, #8]
	mov	r1, r3
	str	ip, [sp]
	mov	r3, #10
	ldr	r6, .L19+4
	sub	r0, r4, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #0
	bne	.L14
	ldr	r0, [r5, #4]
	sub	r4, r4, r0
	cmp	r4, #0
	mvngt	r0, #0
	movle	r0, #1
.L14:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r3, .L25
	ldr	r3, [r3]
	sub	r0, r3, r0
	eor	r3, r0, r0, asr #31
	sub	r3, r3, r0, asr #31
	cmp	r3, r1
	ble	.L23
	cmp	r0, #0
	movgt	r0, #1
	mvnle	r0, #0
	bx	lr
.L23:
	mov	r0, #0
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r3, .L32
	add	r1, r3, #340
.L29:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #68
	bne	.L30
	cmp	r3, r1
	bne	.L29
	mov	r0, #1
	bx	lr
.L30:
	mov	r0, #0
	bx	lr
.L33:
	.align	2
.L32:
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
	ldr	r0, .L46
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L45
.L35:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L35
.L45:
	push	{r4, lr}
	mov	r4, #1
	ldr	ip, .L46+4
	ldr	r2, .L46+8
	ldr	lr, [r2, #8]
	ldr	r2, [ip]
	add	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	add	r2, r2, #14
	cmn	lr, #1
	str	r2, [r3, #8]
	str	r1, [r3, #28]
	ldreq	r2, [r3, #16]
	ldr	r1, [ip, #4]
	ldrne	r2, [ip, #24]
	subeq	r2, r1, r2
	addne	r2, r2, r1
	str	r4, [r3, #32]
	str	lr, [r3, #24]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
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
	ldr	r5, .L57
	mov	ip, #0
	mov	lr, r5
.L52:
	ldr	r4, [lr, #32]
	cmp	r4, #0
	beq	.L56
	add	ip, ip, #1
	cmp	ip, #5
	add	lr, lr, #36
	bne	.L52
	pop	{r4, r5, lr}
	bx	lr
.L56:
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
.L58:
	.align	2
.L57:
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
	beq	.L60
	cmp	r0, #2
	beq	.L61
	cmp	r0, #0
	beq	.L73
.L59:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	ldr	r0, .L77
	mov	r3, #0
	mov	r2, r0
.L66:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L74
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #72
	bne	.L66
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	ldr	ip, .L77+4
	mov	r3, ip
.L64:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L75
	add	r0, r0, #1
	cmp	r0, #5
	add	r3, r3, #68
	bne	.L64
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	ldr	r0, .L77+8
	mov	r3, #0
	mov	r2, r0
.L68:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L76
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #84
	bne	.L68
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	mov	lr, #3
	mov	ip, #15
	ldr	r2, .L77+12
	ldr	r2, [r2, #8]
	add	r3, r3, r3, lsl lr
	add	r5, r0, r3, lsl lr
	ldr	r6, .L77+16
	add	r3, r2, r2, lsl #2
	add	r2, r2, r3, lsl #1
	ldr	r3, [r6, r2, lsl #4]
	add	r1, r3, r1
	str	r1, [r5, #12]
	ldr	r3, .L77+20
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L77+24
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
	b	.L59
.L76:
	mov	lr, #3
	mov	ip, #15
	ldr	r2, .L77+12
	ldr	r2, [r2, #8]
	add	r5, r2, r2, lsl #2
	add	r2, r2, r5, lsl #1
	ldr	r5, .L77+16
	add	r3, r3, r3, lsl #1
	ldr	r2, [r5, r2, lsl #4]
	rsb	r3, r3, r3, lsl lr
	add	r5, r0, r3, lsl #2
	add	r1, r2, r1
	ldr	r3, .L77+20
	str	r1, [r5, #12]
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L77+28
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
	b	.L59
.L75:
	mov	r4, #1
	mov	lr, #10
	ldr	r3, .L77+12
	ldr	r3, [r3, #8]
	add	r0, r0, r0, lsl #4
	add	r0, ip, r0, lsl #2
	ldr	r5, .L77+16
	add	ip, r3, r3, lsl #2
	add	r3, r3, ip, lsl r4
	ldr	r3, [r5, r3, lsl #4]
	add	r1, r3, r1
	str	r2, [r0, #60]
	str	r2, [r0, #48]
	str	r2, [r0, #44]
	str	r4, [r0, #52]
	str	lr, [r0, #56]
	str	r1, [r0, #12]
	b	.L59
.L78:
	.align	2
.L77:
	.word	shooters
	.word	walkers
	.word	wraiths
	.word	.LANCHOR0
	.word	encounters
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
	mov	ip, #67108864
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L97
	ldr	r4, [r5, #8]
	ldr	r1, .L97+4
	ldr	r7, .L97+8
	add	r2, r4, r4, lsl #2
	add	r2, r4, r2, lsl #1
	ldr	r3, [r1, #12]
	ldr	r2, [r7, r2, lsl #4]
	ldr	r0, [r1, #4]
	ldr	lr, .L97+12
	add	r3, r3, #1
	str	r2, [r5, #12]
	add	r2, r2, #1
	cmp	r0, #8
	str	r2, [lr, #4]
	lsl	r2, r3, #24
	addle	r0, r0, #1
	lsr	r2, r2, #16
	str	r3, [r1, #12]
	strh	r2, [ip, #8]	@ movhi
	strle	r0, [r1, #4]
	mov	r0, #10
	lsl	r3, r4, #2
	add	r2, r3, r4
	add	r2, r4, r2, lsl #1
	add	r2, r7, r2, lsl #4
	ldr	r2, [r2, #8]
	cmp	r2, #0
	str	r0, [r1]
	ble	.L81
	mov	r6, #0
.L82:
	add	r3, r3, r4
	add	r3, r4, r3, lsl #1
	add	r3, r6, r3, lsl #1
	add	r3, r3, #2
	add	r2, r7, r3, lsl #3
	ldr	r1, [r7, r3, lsl #3]
	ldr	r0, [r2, #4]
	bl	spawnEnemy
	ldr	r4, [r5, #8]
	add	r3, r4, r4, lsl #2
	add	r3, r4, r3, lsl #1
	add	r3, r7, r3, lsl #4
	ldr	r3, [r3, #8]
	add	r6, r6, #1
	cmp	r3, r6
	lsl	r3, r4, #2
	bgt	.L82
.L81:
	cmp	r4, #0
	beq	.L91
	ldr	r3, [r5, #8]
	cmp	r3, #1
	beq	.L92
.L84:
	cmp	r3, #2
	beq	.L93
.L85:
	cmp	r3, #3
	beq	.L94
.L86:
	cmp	r3, #6
	beq	.L95
.L87:
	cmp	r3, #7
	beq	.L96
.L79:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L91:
	ldr	r3, .L97+16
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+20
	str	r4, [r3]
	ldr	r3, [r5, #8]
	cmp	r3, #1
	bne	.L84
.L92:
	ldr	r3, .L97+24
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #8]
	cmp	r3, #2
	bne	.L85
.L93:
	ldr	r3, .L97+16
	mov	r0, #1
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, [r5, #8]
	ldr	r2, .L97+20
	cmp	r3, #3
	str	r1, [r2]
	bne	.L86
.L94:
	ldr	r3, .L97+24
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #8]
	cmp	r3, #6
	bne	.L87
.L95:
	ldr	r3, .L97+24
	mov	r0, #2
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #8]
	cmp	r3, #7
	bne	.L79
.L96:
	ldr	r3, .L97+16
	mov	r0, #2
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L97+20
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L98:
	.align	2
.L97:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	encounters
	.word	player
	.word	goToNewSpell
	.word	spellsUnlocked
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
	mov	r4, #16
	mov	lr, #32
	mov	ip, #200
	mov	r0, #192
	ldr	r3, .L107
	add	r1, r3, #340
.L100:
	str	r5, [r3, #56]
	str	r2, [r3, #52]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	str	r2, [r3, #48]
	add	r3, r3, #68
	cmp	r3, r1
	bne	.L100
	mov	r5, #15
	mov	r2, #0
	mov	r4, #16
	mov	lr, #32
	mov	ip, #200
	mov	r0, #192
	ldr	r3, .L107+4
	add	r1, r3, #360
.L101:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L101
	mov	r5, #15
	mov	r2, #0
	mov	r4, #16
	mov	lr, #32
	mov	ip, #200
	mov	r0, #192
	ldr	r3, .L107+8
	add	r1, r3, #420
.L102:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #64]
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L102
	pop	{r4, r5, lr}
	bx	lr
.L108:
	.align	2
.L107:
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
	mov	r2, #0
	mov	ip, #8
	mov	r0, #12
	ldr	r3, .L115
	add	r1, r3, #180
.L110:
	str	r2, [r3, #32]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L110
	mov	r2, #0
	mov	ip, #8
	mov	r0, #12
	ldr	r3, .L115+4
	add	r1, r3, #180
.L111:
	str	r2, [r3, #32]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L111
	mov	fp, #240
	ldr	r3, .L115+8
	str	fp, [r3, #176]
	mov	fp, #480
	str	fp, [r3, #352]
	mov	fp, #720
	mov	r5, #160
	str	fp, [r3, #528]
	mov	fp, #960
	mov	r1, #2
	mov	r0, #1
	mov	lr, #3
	mov	r4, #140
	mov	r6, #120
	mov	r8, #80
	str	fp, [r3, #704]
	str	r5, [r3, #200]
	str	r5, [r3, #384]
	str	r5, [r3, #560]
	mov	fp, #90
	mov	r5, #1200
	str	r1, [r3, #4]
	str	r1, [r3, #184]
	str	fp, [r3, #720]
	str	r0, [r3, #180]
	str	r0, [r3, #556]
	str	r0, [r3, #724]
	str	r6, [r3, #192]
	str	r6, [r3, #376]
	str	r6, [r3, #552]
	str	r8, [r3, #368]
	str	r8, [r3, #544]
	str	lr, [r3, #360]
	str	lr, [r3, #536]
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
	str	r4, [r3, #728]
	str	r5, [r3, #880]
	mov	r5, #1440
	str	r5, [r3, #1056]
	mov	r5, #1680
	mov	ip, #100
	mov	r9, #60
	mov	r10, #180
	str	r5, [r3, #1232]
	mov	r5, #1920
	str	r0, [r3, #732]
	str	r1, [r3, #712]
	str	r0, [r3, #908]
	str	r0, [r3, #916]
	str	lr, [r3, #888]
	str	r4, [r3, #1080]
	str	r1, [r3, #1092]
	str	lr, [r3, #1064]
	str	r0, [r3, #1252]
	str	r1, [r3, #1260]
	str	r1, [r3, #1240]
	str	r1, [r3, #1428]
	str	r5, [r3, #1408]
	str	r9, [r3, #896]
	str	r9, [r3, #1424]
	str	ip, [r3, #904]
	str	ip, [r3, #1072]
	str	ip, [r3, #1248]
	str	ip, [r3, #1432]
	str	r10, [r3, #912]
	str	r10, [r3, #1088]
	str	r10, [r3, #1256]
	str	r2, [r3, #884]
	str	r2, [r3, #900]
	str	r2, [r3, #1060]
	str	r2, [r3, #1076]
	str	r2, [r3, #1084]
	str	r2, [r3, #1236]
	str	r2, [r3, #1412]
	str	r0, [r3, #1436]
	str	lr, [r3, #1416]
	mov	lr, #20
	str	r1, [r3, #1620]
	str	r1, [r3, #1628]
	ldr	r1, .L115+12
	str	lr, [r1, #4]
	mov	lr, #16
	str	lr, [r1, #24]
	mov	lr, #32
	str	lr, [r1, #28]
	mov	lr, #192
	str	r0, [r3, #1444]
	str	ip, [r3, #1616]
	mov	r0, #2160
	mov	ip, #4
	mov	r7, #10
	str	lr, [r1]
	mov	r1, #15
	str	r0, [r3, #1584]
	str	ip, [r3, #1592]
	ldr	r0, .L115+16
	str	r4, [r3, #1440]
	str	r2, [r3, #1588]
	str	r9, [r3, #1600]
	str	r2, [r3, #1604]
	str	r8, [r3, #1608]
	str	r2, [r3, #1612]
	str	r4, [r3, #1624]
	ldr	ip, .L115+20
	ldr	r3, .L115+24
	str	r7, [r0, #4]
	str	r7, [r0]
	str	r1, [r0, #12]
	str	r2, [ip, #8]
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	startEncounter
.L116:
	.align	2
.L115:
	.word	playerBolts
	.word	shooterProjectiles
	.word	encounters
	.word	player
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	spellsUnlocked
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
	mov	r2, #0
	mov	ip, #8
	mov	r0, #12
	ldr	r3, .L123
	add	r1, r3, #180
.L118:
	str	r2, [r3, #32]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L118
	mov	r2, #0
	mov	ip, #8
	mov	r0, #12
	ldr	r3, .L123+4
	add	r1, r3, #180
.L119:
	str	r2, [r3, #32]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L119
	bx	lr
.L124:
	.align	2
.L123:
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
	mov	r8, #2
	mvn	r7, #9
	ldr	r4, .L189
	add	r6, r4, #340
.L133:
	add	r0, r4, #12
	mov	r2, #6
	ldm	r0, {r0, r1}
	bl	playerIsWithinRange
	ldr	r3, [r4, #52]
	cmp	r3, #1
	mov	r5, r0
	beq	.L126
	cmp	r3, #2
	bne	.L127
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #52]
	bne	.L127
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	cmp	r3, #40
	str	r3, [r4, #60]
	bgt	.L181
.L127:
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L133
	ldr	r5, .L189+4
	mov	r6, #0
	mov	r4, r5
	mov	r7, #3
	ldr	r8, .L189+8
	add	r9, r5, #360
.L147:
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L134
	cmp	r3, #3
	bne	.L136
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	bgt	.L182
.L136:
	add	r4, r4, #72
	cmp	r4, r9
	bne	.L147
	mov	r9, #0
	ldr	r4, .L189+12
	ldr	r8, .L189+8
	ldr	r7, .L189+16
	add	r6, r4, #420
.L161:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L183
.L162:
	add	r4, r4, #84
	cmp	r4, r6
	add	r5, r5, #72
	bne	.L161
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L126:
	ldr	r3, [r4, #20]
	cmp	r0, #0
	rsb	r3, r3, #224
	bne	.L130
	str	r3, [r4, #8]
	str	r8, [r4, #52]
	str	r7, [r4, #60]
	b	.L127
.L134:
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
	bgt	.L184
.L137:
	ldr	r3, [r4, #64]
	cmp	r3, #239
	strgt	r6, [r4, #64]
	strgt	r7, [r4, #48]
	b	.L136
.L183:
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
	bgt	.L173
	ldr	r1, [r4, #20]
.L149:
	ldr	r2, [r4, #8]
	rsb	r3, r1, #224
	cmp	r2, r3
	blt	.L154
	ldr	r3, [r4, #72]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #72]
	bgt	.L155
.L179:
	ldr	r3, [r4, #76]
	lsl	r3, r3, #2
.L156:
	ldr	r0, [r4, #56]
	add	r3, r3, r0
	cmn	r3, #9
	bge	.L159
	add	r2, r2, #1
	add	r1, r1, r2
	add	r3, r3, #10
	cmp	r1, #223
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strgt	r9, [r4, #56]
	strgt	r9, [r4, #76]
	b	.L162
.L130:
	cmn	r0, #1
	ldr	r2, [r4, #48]
	beq	.L185
	add	r1, r2, #4
	cmp	r1, #9
	str	r3, [r4, #8]
	ldrgt	r3, [r4, #12]
	subgt	r2, r2, #6
	addgt	r3, r3, #1
	str	r1, [r4, #48]
	strgt	r3, [r4, #12]
	strgt	r2, [r4, #48]
	b	.L127
.L159:
	cmp	r3, #9
	strle	r3, [r4, #56]
	ble	.L162
	sub	r2, r2, #1
	add	r1, r1, r2
	sub	r3, r3, #10
	cmp	r1, #206
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strle	r9, [r4, #56]
	strle	r9, [r4, #76]
	b	.L162
.L154:
	add	r3, r2, r1
	cmp	r3, #206
	bgt	.L179
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	ble	.L179
	mvn	r0, #0
	mvn	r3, #3
	str	r9, [r4, #68]
	str	r0, [r4, #76]
	b	.L156
.L155:
	mov	r3, #1
	str	r9, [r4, #72]
	str	r3, [r4, #76]
	mov	r3, #4
	b	.L156
.L184:
	mov	r3, #0
	ldr	r2, .L189+8
.L141:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L186
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L141
.L140:
	str	r6, [r4, #60]
	b	.L137
.L173:
	mov	r3, #0
	ldr	r2, .L189+8
.L153:
	ldr	ip, [r2, #32]
	cmp	ip, #0
	beq	.L187
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L153
	ldr	r1, [r4, #20]
.L152:
	str	r9, [r4, #64]
	b	.L149
.L185:
	sub	r1, r2, #4
	cmp	r1, #0
	str	r3, [r4, #8]
	str	r1, [r4, #48]
	bgt	.L127
	ldr	r3, [r4, #12]
	add	r2, r2, #6
	sub	r3, r3, #1
	str	r2, [r4, #48]
	str	r3, [r4, #12]
	b	.L127
.L181:
	mov	r1, r0
	mov	r0, #3
	bl	damagePlayer
	mov	r3, #15
	str	r5, [r4, #60]
	str	r3, [r4, #64]
	b	.L127
.L182:
	mov	r2, #0
	mov	r3, #2
	mov	r1, r2
	str	r3, [r4, #48]
	ldr	r0, [r4, #12]
	str	r6, [r4, #68]
	bl	playerIsWithinRange
	mov	r3, #0
	str	r0, [r4, #56]
	ldr	r2, .L189+8
.L146:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L188
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L146
	b	.L136
.L186:
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
	b	.L140
.L187:
	mov	lr, #1
	ldr	r1, [r4, #20]
	add	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #2
	ldr	r2, [r7]
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
	b	.L152
.L188:
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
	b	.L136
.L190:
	.align	2
.L189:
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
	ldr	r3, .L275
	ldr	r4, .L275+4
	ldr	fp, .L275+8
	ldr	r9, .L275+12
	sub	sp, sp, #20
	add	r10, r4, #180
	add	r7, r3, #340
.L220:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L267
.L193:
	add	r4, r4, #36
	cmp	r4, r10
	bne	.L220
	mov	r10, #0
	ldr	r4, .L275+16
	ldr	r5, .L275+20
	ldr	r9, .L275+12
	ldr	r8, .L275+8
	ldr	r7, .L275+24
	add	r6, r4, #180
.L232:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L268
.L222:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L232
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L268:
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r2, lsl #3
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L223
	b	.L269
.L227:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L225
.L223:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L227
	ldr	r3, [r4, #28]
.L228:
	cmn	r3, #9
	bge	.L225
	cmn	r2, #1
	bne	.L225
.L229:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L229
.L225:
	add	r1, r5, #24
	ldm	r5, {r2, r3}
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
	bne	.L270
.L230:
	ldr	r1, [r8, #12]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r3, r3, r1
	ldr	r1, [r7, #16]
	cmp	r3, #240
	sub	r2, r2, r1
	stm	r4, {r2, r3}
	strhi	r10, [r4, #32]
	b	.L222
.L267:
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	add	r1, r2, r2, lsl #2
	add	r3, r3, r1, lsl #2
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L194
	b	.L271
.L198:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L196
.L194:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L198
	ldr	r3, [r4, #28]
.L199:
	cmn	r3, #9
	bge	.L196
	cmn	r2, #1
	bne	.L196
.L200:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L200
.L196:
	mov	r6, #0
	ldr	r5, .L275
.L206:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L272
.L201:
	add	r5, r5, #68
	cmp	r5, r7
	bne	.L206
	ldr	r5, .L275+28
	add	r8, r5, #360
.L212:
	ldr	r6, [r5, #48]
	cmp	r6, #2
	beq	.L273
.L207:
	add	r5, r5, #72
	cmp	r5, r8
	bne	.L212
	mov	r8, #0
	ldr	r5, .L275+32
	add	r6, r5, #420
.L218:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L274
.L213:
	add	r5, r5, #84
	cmp	r5, r6
	bne	.L218
	ldr	r3, .L275+24
	ldr	r1, [fp, #12]
	ldr	r2, [r3, #16]
	ldr	r3, [r4, #8]
	sub	r0, r0, r1
	sub	r3, r3, r2
	cmp	r0, #240
	str	r3, [r4]
	movhi	r3, #0
	str	r0, [r4, #4]
	strhi	r3, [r4, #32]
	b	.L193
.L274:
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
	beq	.L266
	ldr	r3, [r5, #52]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r8, [r4, #32]
	str	r3, [r5, #52]
	ble	.L215
.L266:
	ldr	r0, [r4, #12]
	b	.L213
.L272:
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
	beq	.L264
	ldr	r3, [r5, #56]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r6, [r4, #32]
	str	r3, [r5, #56]
	ble	.L203
.L264:
	ldr	r0, [r4, #12]
	b	.L201
.L273:
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
	beq	.L265
	mov	r2, #0
	ldr	r3, [r5, #52]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r2, [r4, #32]
	str	r3, [r5, #52]
	ble	.L209
.L265:
	ldr	r0, [r4, #12]
	b	.L207
.L270:
	mov	r1, #0
	mov	r0, #3
	bl	damagePlayer
	str	r10, [r4, #32]
	b	.L230
.L203:
	ldr	r3, .L275
	str	r6, [r5, #52]
.L205:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #68
	bne	.L233
	cmp	r3, r7
	bne	.L205
	mov	r1, #2
.L204:
	ldr	r3, [fp, #8]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L275+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L264
.L215:
	ldr	r3, .L275
	str	r8, [r5, #48]
.L217:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #68
	bne	.L235
	cmp	r3, r7
	bne	.L217
	mov	r1, #2
.L216:
	ldr	r3, [fp, #8]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L275+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L266
.L209:
	mov	r2, #0
	ldr	r3, .L275
	str	r2, [r5, #48]
.L211:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #68
	bne	.L234
	cmp	r3, r7
	bne	.L211
.L210:
	ldr	r3, [fp, #8]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L275+36
	add	r3, r2, r3, lsl #4
	str	r6, [r3, #4]
	b	.L265
.L271:
	ldr	r0, [r4, #12]
	b	.L199
.L269:
	ldr	r0, [r4, #12]
	b	.L228
.L235:
	mov	r1, #1
	b	.L216
.L233:
	mov	r1, #1
	b	.L204
.L234:
	mov	r6, #1
	b	.L210
.L276:
	.align	2
.L275:
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
	ldr	r4, .L332
	ldr	r3, [r4, #16]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #16]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #24]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
	ldr	r3, .L332+4
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r3, #10
	ldrne	r6, .L332+8
	strne	r3, [r6]
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	ldreq	r6, .L332+8
	tst	r3, #16
	beq	.L283
	ldr	r5, .L332+16
.L284:
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L291
	mvn	r1, #0
	ldr	r3, [r4, #8]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L332+20
	ldr	r3, [r2, r3, lsl #4]
	ldr	r2, [r5, #4]
	cmp	r2, r3
	str	r1, [r6, #8]
	bgt	.L328
.L291:
	ldr	r3, .L332+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L296
	ldr	r3, .L332+28
	ldrh	r2, [r3]
	ands	r7, r2, #1
	beq	.L329
.L296:
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #2
	bne	.L298
	ldr	r2, .L332+32
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L298
	ldr	r2, [r4, #16]
	cmp	r2, #0
	ble	.L330
.L298:
	mov	r3, #0
	str	r3, [r4]
.L300:
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L302
	ldr	r2, .L332+32
	ldr	r2, [r2]
	cmp	r2, #1
	ble	.L302
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L302
	ldr	r0, [r4, #40]
	cmp	r0, #0
	ldr	ip, [r5]
	ldr	r2, [r5, #28]
	blt	.L331
	add	lr, ip, r2
	cmp	lr, #208
	str	r3, [r4, #32]
	ble	.L306
.L304:
	add	r0, r0, #1
	str	r0, [r4, #40]
.L306:
	cmp	r0, #1
	movgt	r3, #0
	subgt	ip, ip, #1
	strgt	ip, [r5]
	strgt	r3, [r4, #40]
.L305:
	ldr	r3, [r4, #44]
	cmp	r3, #49
	ble	.L308
	mov	r3, #0
	sub	r1, r1, #1
	cmp	r1, r3
	str	r1, [r6]
	str	r3, [r4, #44]
	mvneq	r3, #44
	streq	r3, [r4, #32]
.L308:
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L319
.L313:
	bl	updateEnemies
	bl	updateProjectiles
	ldr	r1, [r4, #12]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	sub	r2, r2, r1
	ldr	r1, [r6, #16]
	sub	r3, r3, r1
	ldr	r1, [r6]
	cmp	r1, #9
	str	r3, [r5, #8]
	str	r2, [r5, #12]
	ldr	r3, [r4, #32]
	ble	.L316
	cmp	r3, #0
	blt	.L316
.L277:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L302:
	ldr	r1, [r5]
	ldr	r2, [r5, #28]
	add	r3, r1, r2
	cmp	r3, #223
	bgt	.L310
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmn	r3, #2
	str	r3, [r4, #40]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5]
	strlt	r3, [r4, #40]
.L310:
	ldr	r3, .L332+12
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L313
	ldr	r3, .L332+32
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L313
.L319:
	ldr	r1, [r5]
	add	r2, r1, r2
	cmp	r2, #223
	bgt	.L313
	ldr	r3, [r4, #40]
	sub	r3, r3, #3
	cmn	r3, #2
	str	r3, [r4, #40]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5]
	strlt	r3, [r4, #40]
	b	.L313
.L316:
	add	r2, r3, #1
	cmp	r2, #29
	str	r2, [r4, #32]
	ble	.L277
	add	r1, r1, #1
	sub	r3, r3, #29
	str	r1, [r6]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L329:
	ldr	r3, .L332+32
	ldr	r3, [r3]
	cmp	r3, #0
	blt	.L296
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bgt	.L296
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bgt	.L296
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L296
	bl	spawnPlayerBolt
	ldr	r3, .L332+36
	mov	r2, r7
	ldr	r1, [r3]
	ldr	r0, .L332+40
	ldr	r3, .L332+44
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, [r6]
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r6]
	ldrle	r3, [r4, #32]
	suble	r3, r3, #45
	str	r7, [r4, #20]
	str	r2, [r4, #16]
	strle	r3, [r4, #32]
	b	.L296
.L328:
	ldr	r3, [r5, #28]
	ldr	r1, [r5]
	add	r1, r1, r3
	ldr	r3, [r4, #28]
	cmp	r1, #223
	and	r3, r3, r3, asr #31
	suble	r3, r3, #4
	subgt	r3, r3, #8
	cmn	r3, #9
	str	r3, [r4, #28]
	sublt	r2, r2, #1
	addlt	r3, r3, #10
	strlt	r2, [r5, #4]
	strlt	r3, [r4, #28]
	b	.L291
.L283:
	mov	r7, #1
	ldr	r2, [r4, #8]
	ldr	r1, .L332+20
	ldr	r5, .L332+16
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl r7
	ldr	ip, [r1, r3, lsl #4]
	ldr	lr, [r5, #4]
	ldr	r0, [r5, #24]
	add	ip, ip, #238
	add	r0, lr, r0
	cmp	ip, r0
	str	r7, [r6, #8]
	add	r3, r1, r3, lsl #4
	blt	.L285
	ldr	r3, [r5, #28]
	ldr	r2, [r5]
	add	r2, r2, r3
	ldr	r3, [r4, #28]
	cmp	r2, #223
	bic	r3, r3, r3, asr #31
	addle	r3, r3, #4
	addgt	r3, r3, #8
	cmp	r3, #9
	str	r3, [r4, #28]
	addgt	lr, lr, #1
	subgt	r3, r3, #10
	strgt	lr, [r5, #4]
	strgt	r3, [r4, #28]
	b	.L284
.L285:
	ldr	r3, [r3, #4]
	cmp	r3, #2
	bne	.L284
	add	r2, r2, #1
	cmp	r2, #9
	str	r2, [r4, #8]
	ble	.L289
	ldr	r3, .L332+48
	mov	lr, pc
	bx	r3
	b	.L284
.L330:
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bgt	.L298
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L298
	ldr	r0, [r4]
	add	r0, r0, #1
	ldr	ip, [r4, #36]
	lsl	r2, r0, #2
	add	r2, r2, #25
	add	r2, r2, ip
	cmp	r2, #1000
	str	r3, [r4, #32]
	str	r0, [r4]
	strlt	r2, [r4, #36]
	blt	.L300
	sub	r1, r1, #1
	sub	r2, r2, #1000
	cmp	r1, #0
	str	r1, [r6]
	str	r2, [r4, #36]
	mvneq	r3, #44
	streq	r3, [r4, #32]
	b	.L300
.L331:
	add	r0, r2, ip
	cmp	r0, #208
	str	r3, [r4, #40]
	str	r3, [r4, #32]
	ble	.L305
	mov	r0, r3
	b	.L304
.L289:
	bl	startEncounter
	b	.L284
.L333:
	.align	2
.L332:
	.word	.LANCHOR0
	.word	cheatEnabled
	.word	.LANCHOR1
	.word	67109120
	.word	player
	.word	encounters
	.word	oldButtons
	.word	buttons
	.word	spellsUnlocked
	.word	bolt_sound_length
	.word	bolt_sound_data
	.word	playSoundB
	.word	goToWin
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
	ldr	r8, .L355
	ldr	r2, .L355+4
	ldr	r3, [r8, #48]
	add	r2, r2, r3, lsl #3
	mov	r1, r2
	mov	fp, #512
	ldr	r0, .L355+8
	sub	sp, sp, #12
	ldr	ip, .L355+12
	ldr	r0, [r0, #4]
	str	r3, [sp, #4]
	ldr	r3, .L355+16
	ldr	r10, [r8, #12]
	ldr	r9, [ip, #16]
	str	r0, [sp]
	ldr	r7, .L355+20
	add	r6, r3, #340
.L341:
	ldr	lr, [r3, #52]
	cmp	lr, #0
	strheq	fp, [r1]	@ movhi
	beq	.L340
	ldr	r0, [r3, #64]
	cmp	r0, #0
	sub	ip, r0, #1
	movgt	r0, ip
	ldr	r4, [r3, #12]
	strgt	ip, [r3, #64]
	sub	r5, r4, r10
	ldr	ip, [r3, #8]
	cmp	r0, #0
	orr	r0, r5, r7
	sub	ip, ip, r9
	lsl	r0, r0, #16
	str	r5, [r3, #4]
	lsr	r0, r0, #16
	orr	r5, ip, r7
	strh	r0, [r1, #2]	@ movhi
	str	ip, [r3]
	strh	r5, [r1]	@ movhi
	ble	.L337
	ldr	ip, .L355+24
	strh	ip, [r1, #4]	@ movhi
.L338:
	ldr	ip, [sp]
	orr	r0, r0, #4096
	cmp	r4, ip
	strhlt	r0, [r1, #2]	@ movhi
.L340:
	add	r3, r3, #68
	cmp	r3, r6
	add	r1, r1, #8
	bne	.L341
	mov	r1, r2
	mov	fp, #512
	mov	r10, #13
	mov	r9, #141
	ldr	r0, .L355+12
	ldr	r3, .L355+28
	ldr	r7, [r8, #12]
	ldr	r6, [r0, #16]
	ldr	r5, .L355+20
	add	r4, r3, #360
.L345:
	ldr	r0, [r3, #48]
	cmp	r0, #0
	strheq	fp, [r1, #40]	@ movhi
	beq	.L344
	cmp	r0, #2
	movne	lr, r10
	moveq	lr, r9
	ldr	r0, [r3, #12]
	ldr	ip, [r3, #8]
	sub	r0, r0, r7
	sub	ip, ip, r6
	str	r0, [r3, #4]
	orr	r0, r0, r5
	strh	r0, [r1, #42]	@ movhi
	orr	r0, ip, r5
	strh	lr, [r1, #44]	@ movhi
	str	ip, [r3]
	strh	r0, [r1, #40]	@ movhi
.L344:
	add	r3, r3, #72
	cmp	r3, r4
	add	r1, r1, #8
	bne	.L345
	mov	r9, #512
	mov	r10, #0
	ldr	r1, .L355+12
	ldr	r3, .L355+32
	ldr	r7, [r1, #16]
	ldr	r6, [r8, #12]
	ldr	r5, .L355+20
	ldr	fp, .L355+36
	add	r4, r3, #420
.L350:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r9, [r2, #80]	@ movhi
	beq	.L349
	ldr	ip, [r3, #80]
	add	r1, r3, #8
	add	ip, ip, #1
	cmp	ip, #29
	ldm	r1, {r1, lr}
	str	ip, [r3, #80]
	ldrgt	ip, [r3, #28]
	sub	r1, r1, r7
	addgt	ip, ip, #1
	sub	lr, lr, r6
	str	r1, [r3]
	orr	r1, r1, r5
	strh	r1, [r2, #80]	@ movhi
	orr	r0, lr, r5
	str	lr, [r3, #4]
	smullgt	lr, r1, fp, ip
	subgt	r1, r1, ip, asr #31
	addgt	r1, r1, r1, lsl #1
	subgt	r1, ip, r1
	ldrle	r1, [r3, #28]
	ldr	ip, [r3, #60]
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strgt	r1, [r3, #28]
	strgt	r10, [r3, #80]
	lsl	r1, r1, #7
	cmp	ip, #1
	strh	r0, [r2, #82]	@ movhi
	add	r1, r1, #15
	orreq	r0, r0, #4096
	strh	r1, [r2, #84]	@ movhi
	strheq	r0, [r2, #82]	@ movhi
.L349:
	add	r3, r3, #84
	cmp	r3, r4
	add	r2, r2, #8
	bne	.L350
	ldr	r3, [sp, #4]
	add	r3, r3, #15
	str	r3, [r8, #48]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L337:
	cmp	lr, #2
	movne	ip, #3
	moveq	ip, #131
	strh	ip, [r1, #4]	@ movhi
	b	.L338
.L356:
	.align	2
.L355:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	player
	.word	.LANCHOR1
	.word	walkers
	.word	-32768
	.word	259
	.word	shooters
	.word	wraiths
	.word	1431655766
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
	ldr	r4, .L367
	ldr	r2, .L367+4
	ldr	lr, [r4, #48]
	add	r2, r2, lr, lsl #3
	mov	r1, r2
	mov	r7, #512
	mov	r6, #5
	ldr	r3, .L367+8
	add	ip, r3, #180
.L360:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	ldmne	r3, {r0, r5}
	add	r3, r3, #36
	orrne	r0, r0, #16384
	strhne	r6, [r1, #4]	@ movhi
	strhne	r0, [r1]	@ movhi
	strhne	r5, [r1, #2]	@ movhi
	strheq	r7, [r1]	@ movhi
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L360
	mov	r6, #512
	mov	r5, #37
	ldr	r3, .L367+12
	add	r0, r3, #180
.L363:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	ldmne	r3, {r1, ip}
	add	r3, r3, #36
	orrne	r1, r1, #16384
	strhne	r5, [r2, #44]	@ movhi
	strhne	r1, [r2, #40]	@ movhi
	strhne	ip, [r2, #42]	@ movhi
	strheq	r6, [r2, #40]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L363
	add	lr, lr, #10
	str	lr, [r4, #48]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L368:
	.align	2
.L367:
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
	ldr	lr, .L379
	ldr	r1, .L379+4
	ldr	ip, [lr, #48]
	add	r1, r1, ip, lsl #3
	mov	r0, r1
	mov	r3, #0
	mov	r7, #4
	mov	r6, #7
	ldr	r5, .L379+8
	ldr	r4, [r5, #4]
.L372:
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
	bne	.L372
	mov	r3, #0
	mov	r6, #4
	mov	r4, #39
	ldr	r0, [r5]
.L375:
	cmp	r0, r3
	rsb	r2, r3, r3, lsl #3
	add	r2, r2, #166
	ldrhle	r2, [r1, #80]
	add	r3, r3, #1
	orrle	r2, r2, #512
	strhgt	r6, [r1, #80]	@ movhi
	strhgt	r2, [r1, #82]	@ movhi
	strhgt	r4, [r1, #84]	@ movhi
	strhle	r2, [r1, #80]	@ movhi
	cmp	r3, #10
	add	r1, r1, #8
	bne	.L375
	add	ip, ip, #20
	str	ip, [lr, #48]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L380:
	.align	2
.L379:
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
	ldr	r3, .L393
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	ldr	r2, .L393+4
	push	{r4, r5, r6, lr}
	ldr	r3, [r2, #12]
	ldr	ip, .L393+8
	ldr	r4, .L393+12
	orr	r0, r3, ip
	ldr	r5, [r4, #8]
	ldr	r1, .L393+16
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	cmn	r5, #1
	ldr	r2, [r2, #8]
	strh	r0, [r1, #2]	@ movhi
	orreq	r0, r0, #4096
	strheq	r0, [r1, #2]	@ movhi
	cmp	r3, #7
	subgt	r3, r3, #8
	mvngt	r3, r3, lsl #17
	mvngt	r3, r3, lsr #17
	movle	r3, #32768
	mov	lr, #1
	ldr	r0, .L393+20
	orr	ip, r2, ip
	strh	ip, [r1]	@ movhi
	ldr	ip, [r0]
	lslgt	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	lsrgt	r3, r3, #16
	cmp	ip, #0
	strh	r2, [r1, #8]	@ movhi
	orrle	r2, r2, #512
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strhle	r2, [r1, #8]	@ movhi
	ble	.L387
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movgt	r3, #137
	movle	r3, #9
	strh	r3, [r1, #12]	@ movhi
.L387:
	mov	r3, #2
	ldr	r5, .L393+24
	str	r3, [r0, #48]
	bl	drawEnemies
	bl	drawProjectiles
	bl	drawUI
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L393+16
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldr	r3, [r4, #12]
	lsl	r3, r3, #24
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L394:
	.align	2
.L393:
	.word	state
	.word	player
	.word	-32768
	.word	.LANCHOR1
	.word	shadowOAM
	.word	.LANCHOR0
	.word	DMANow
	.size	drawGame, .-drawGame
	.global	currentSBB
	.global	playerMovementStep
	.global	levitateHeightStep
	.global	levitateManaConsumptionStep
	.global	shieldCooldown
	.global	boltCooldown
	.global	globalCooldown
	.global	recentlyShieldedAttackTicks
	.global	durationShielded
	.comm	spellsUnlocked,4,4
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
	.comm	wraiths,420,4
	.comm	shooters,360,4
	.comm	walkers,340,4
	.comm	encounters,1760,4
	.comm	player,56,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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
	.type	currentSBB, %object
	.size	currentSBB, 4
currentSBB:
	.word	15
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
	.type	recentlyShieldedAttackTicks, %object
	.size	recentlyShieldedAttackTicks, 4
recentlyShieldedAttackTicks:
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
