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
	ldr	r6, .L19+4
	sub	r0, r4, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #0
	bne	.L14
	ldr	r0, [r5, #12]
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
	ldr	r3, [r3, #8]
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
	add	r1, r3, #320
.L29:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
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
.L73:
	ldr	r2, .L77
.L64:
	ldr	r3, [r2, r0, lsl #6]
	cmp	r3, #0
	lsl	ip, r0, #6
	add	r0, r0, #1
	beq	.L74
	cmp	r0, #5
	bne	.L64
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	ldr	r0, .L77+4
	mov	r3, #0
	mov	r2, r0
.L68:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L75
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #80
	bne	.L68
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	ldr	r0, .L77+8
	mov	r3, #0
	mov	r2, r0
.L66:
	ldr	r4, [r2, #48]
	cmp	r4, #0
	beq	.L76
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #72
	bne	.L66
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	mov	lr, #1
	mov	r0, #10
	ldr	r2, .L77+12
	ldr	r2, [r2, #8]
	add	r4, r2, r2, lsl #2
	add	r2, r2, r4, lsl lr
	ldr	r4, .L77+16
	ldr	r2, [r4, r2, lsl #4]
	add	r1, r2, r1
	ldr	r2, .L77+20
	add	ip, r2, ip
	str	r1, [ip, #12]
	str	r3, [ip, #60]
	str	r3, [ip, #48]
	str	r3, [ip, #44]
	str	lr, [ip, #52]
	str	r0, [ip, #56]
	b	.L59
.L76:
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
	ldr	r3, .L77+24
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L77+28
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
.L75:
	mov	lr, #3
	mov	ip, #15
	ldr	r2, .L77+12
	ldr	r2, [r2, #8]
	add	r3, r3, r3, lsl #2
	add	r5, r0, r3, lsl #4
	ldr	r6, .L77+16
	add	r3, r2, r2, lsl #2
	add	r2, r2, r3, lsl #1
	ldr	r3, [r6, r2, lsl #4]
	add	r1, r3, r1
	str	r1, [r5, #12]
	ldr	r3, .L77+24
	str	lr, [r5, #48]
	str	ip, [r5, #52]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L77+32
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
.L78:
	.align	2
.L77:
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L97
	ldr	r0, [r4, #8]
	ldr	r7, .L97+4
	add	r3, r0, r0, lsl #2
	add	r3, r0, r3, lsl #1
	ldr	r3, [r7, r3, lsl #4]
	ldr	r1, .L97+8
	str	r3, [r4, #12]
	add	r3, r3, #1
	str	r3, [r1, #12]
	mov	r1, #10
	ldr	r5, .L97+12
	ldr	r2, [r5, #4]
	cmp	r2, #8
	addle	r2, r2, #1
	lsl	r3, r0, #2
	strle	r2, [r5, #4]
	add	r2, r3, r0
	add	r2, r0, r2, lsl #1
	add	r2, r7, r2, lsl #4
	ldr	r2, [r2, #8]
	cmp	r2, #0
	str	r1, [r5]
	ble	.L81
	mov	r6, #0
.L82:
	add	r3, r3, r0
	add	r3, r0, r3, lsl #1
	add	r3, r6, r3, lsl #1
	add	r3, r3, #2
	add	r2, r7, r3, lsl #3
	ldr	r0, [r2, #4]
	ldr	r1, [r7, r3, lsl #3]
	bl	spawnEnemy
	ldr	r0, [r4, #8]
	add	r3, r0, r0, lsl #2
	add	r3, r0, r3, lsl #1
	add	r3, r7, r3, lsl #4
	ldr	r3, [r3, #8]
	add	r6, r6, #1
	cmp	r3, r6
	lsl	r3, r0, #2
	bgt	.L82
.L81:
	cmp	r0, #0
	beq	.L91
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L92
.L84:
	cmp	r3, #2
	beq	.L93
.L85:
	cmp	r3, #3
	beq	.L94
.L86:
	cmp	r3, #5
	beq	.L95
.L87:
	cmp	r3, #6
	beq	.L96
.L79:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L91:
	ldr	r3, .L97+16
	mov	lr, pc
	bx	r3
	mov	r3, #2
	str	r3, [r5, #12]
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bne	.L84
.L92:
	ldr	r3, .L97+20
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	cmp	r3, #2
	bne	.L85
.L93:
	ldr	r3, .L97+16
	mov	r0, #1
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [r4, #8]
	cmp	r3, #3
	str	r2, [r5, #12]
	bne	.L86
.L94:
	ldr	r3, .L97+20
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	cmp	r3, #5
	bne	.L87
.L95:
	ldr	r3, .L97+20
	mov	r0, #2
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	cmp	r3, #6
	bne	.L79
.L96:
	ldr	r3, .L97+16
	mov	r0, #2
	mov	lr, pc
	bx	r3
	mov	r3, #2
	str	r3, [r5, #12]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	.LANCHOR0
	.word	encounters
	.word	player
	.word	.LANCHOR1
	.word	goToNewSpell
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
	ldr	r3, .L107
	add	r1, r3, #320
.L100:
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
	bne	.L100
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
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
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L107+8
	add	r1, r3, #400
.L102:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #64]
	add	r3, r3, #80
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
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L115
	add	r0, r3, #180
.L110:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L110
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L115+4
	add	r0, r3, #180
.L111:
	str	r2, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L111
	mov	fp, #240
	ldr	r3, .L115+8
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
	ldr	r0, .L115+12
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
	ldr	ip, .L115+16
	ldr	r3, .L115+20
	str	lr, [r0, #12]
	str	r8, [r3, #4]
	str	r8, [r3]
	str	r1, [r3, #12]
	str	r2, [ip, #8]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	startEncounter
.L116:
	.align	2
.L115:
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
	ldr	r3, .L123
	add	r0, r3, #180
.L118:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L118
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L123+4
	add	r0, r3, #180
.L119:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
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
	mov	r8, #217
	mov	r7, #2
	ldr	r4, .L189
	add	r6, r4, #320
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
	cmp	r3, #20
	str	r3, [r4, #60]
	bgt	.L181
.L127:
	add	r4, r4, #64
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
	add	r6, r4, #400
.L161:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L183
.L162:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #72
	bne	.L161
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L126:
	cmp	r0, #0
	bne	.L130
	mvn	r2, #9
	ldr	r3, [r4, #20]
	rsb	r3, r3, #223
	str	r7, [r4, #52]
	str	r3, [r4, #8]
	str	r2, [r4, #60]
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
	rsb	r3, r1, #225
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
	cmp	r1, #224
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strgt	r9, [r4, #56]
	strgt	r9, [r4, #76]
	b	.L162
.L130:
	cmn	r0, #1
	beq	.L185
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
	b	.L127
.L159:
	cmp	r3, #9
	strle	r3, [r4, #56]
	ble	.L162
	sub	r2, r2, #1
	add	r1, r1, r2
	sub	r3, r3, #10
	cmp	r1, #215
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strle	r9, [r4, #56]
	strle	r9, [r4, #76]
	b	.L162
.L154:
	add	r3, r2, r1
	cmp	r3, #215
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
	ldr	r2, [r4, #48]
	ldr	r3, [r4, #20]
	sub	r1, r2, #4
	rsb	r3, r3, #225
	cmp	r1, #0
	str	r1, [r4, #48]
	str	r3, [r4, #8]
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
	str	r5, [r4, #60]
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
	add	r7, r3, #320
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
	add	r5, r5, #64
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
	add	r6, r5, #400
.L218:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L274
.L213:
	add	r5, r5, #80
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
	add	r3, r3, #64
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
	add	r3, r3, #64
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
	add	r3, r3, #64
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
	ldr	r4, .L328
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
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L282
	ldr	r6, .L328+8
	ldr	r5, .L328+12
.L283:
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L290
	mvn	r1, #0
	ldr	r3, [r4, #8]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L328+16
	ldr	r3, [r2, r3, lsl #4]
	ldr	r2, [r5, #12]
	cmp	r2, r3
	str	r1, [r6, #8]
	bgt	.L324
.L290:
	ldr	r3, .L328+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L295
	ldr	r3, .L328+24
	ldrh	r3, [r3]
	ands	r7, r3, #1
	beq	.L325
.L295:
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #2
	bne	.L297
	ldr	r2, [r6, #12]
	cmp	r2, #0
	ble	.L297
	ldr	r2, [r4, #16]
	cmp	r2, #0
	ble	.L326
.L297:
	mov	r3, #0
	str	r3, [r4]
.L299:
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L301
	ldr	r2, [r6, #12]
	cmp	r2, #1
	ble	.L301
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L301
	ldr	r0, [r4, #40]
	cmp	r0, #0
	ldr	ip, [r5, #8]
	ldr	r2, [r5, #28]
	blt	.L327
	add	lr, ip, r2
	cmp	lr, #213
	str	r3, [r4, #32]
	ble	.L305
.L303:
	add	r0, r0, #1
	str	r0, [r4, #40]
.L305:
	cmp	r0, #1
	movgt	r3, #0
	subgt	ip, ip, #1
	strgt	ip, [r5, #8]
	strgt	r3, [r4, #40]
.L304:
	ldr	r3, [r4, #44]
	cmp	r3, #49
	ble	.L307
	mov	r3, #0
	sub	r1, r1, #1
	cmp	r1, r3
	str	r1, [r6]
	str	r3, [r4, #44]
	mvneq	r3, #44
	streq	r3, [r4, #32]
.L307:
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L318
.L312:
	bl	updateEnemies
	bl	updateProjectiles
	ldr	r1, [r4, #12]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	sub	r2, r2, r1
	ldr	r1, [r6, #16]
	sub	r3, r3, r1
	ldr	r1, [r6]
	cmp	r1, #9
	str	r3, [r5]
	str	r2, [r5, #4]
	ldr	r3, [r4, #32]
	ble	.L315
	cmp	r3, #0
	blt	.L315
.L277:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L301:
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #28]
	add	r3, r1, r2
	cmp	r3, #224
	bgt	.L309
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmn	r3, #2
	str	r3, [r4, #40]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #40]
.L309:
	ldr	r3, .L328+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L312
	ldr	r3, [r6, #12]
	cmp	r3, #1
	ble	.L312
.L318:
	ldr	r1, [r5, #8]
	add	r2, r1, r2
	cmp	r2, #224
	bgt	.L312
	ldr	r3, [r4, #40]
	sub	r3, r3, #3
	cmn	r3, #2
	str	r3, [r4, #40]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #40]
	b	.L312
.L315:
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
.L325:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	blt	.L295
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bgt	.L295
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bgt	.L295
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L295
	bl	spawnPlayerBolt
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
	b	.L295
.L324:
	ldr	r3, [r5, #28]
	ldr	r1, [r5, #8]
	add	r1, r1, r3
	ldr	r3, [r4, #28]
	cmp	r1, #224
	and	r3, r3, r3, asr #31
	suble	r3, r3, #4
	subgt	r3, r3, #8
	cmn	r3, #9
	str	r3, [r4, #28]
	sublt	r2, r2, #1
	addlt	r3, r3, #10
	strlt	r2, [r5, #12]
	strlt	r3, [r4, #28]
	b	.L290
.L282:
	mov	r7, #1
	ldr	r2, [r4, #8]
	ldr	r1, .L328+16
	ldr	r5, .L328+12
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl r7
	ldr	ip, [r1, r3, lsl #4]
	ldr	lr, [r5, #12]
	ldr	r0, [r5, #24]
	ldr	r6, .L328+8
	add	ip, ip, #238
	add	r0, lr, r0
	cmp	ip, r0
	str	r7, [r6, #8]
	add	r3, r1, r3, lsl #4
	blt	.L284
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #8]
	add	r2, r2, r3
	ldr	r3, [r4, #28]
	cmp	r2, #224
	bic	r3, r3, r3, asr #31
	addle	r3, r3, #4
	addgt	r3, r3, #8
	cmp	r3, #9
	str	r3, [r4, #28]
	addgt	lr, lr, #1
	subgt	r3, r3, #10
	strgt	lr, [r5, #12]
	strgt	r3, [r4, #28]
	b	.L283
.L284:
	ldr	r3, [r3, #4]
	cmp	r3, #2
	bne	.L283
	add	r2, r2, #1
	cmp	r2, #6
	str	r2, [r4, #8]
	ble	.L288
	ldr	r3, .L328+28
	mov	lr, pc
	bx	r3
	b	.L283
.L326:
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bgt	.L297
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L297
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
	blt	.L299
	sub	r1, r1, #1
	sub	r2, r2, #1000
	cmp	r1, #0
	str	r1, [r6]
	str	r2, [r4, #36]
	mvneq	r3, #44
	streq	r3, [r4, #32]
	b	.L299
.L327:
	add	r0, r2, ip
	cmp	r0, #213
	str	r3, [r4, #40]
	str	r3, [r4, #32]
	ble	.L304
	mov	r0, r3
	b	.L303
.L288:
	bl	startEncounter
	b	.L283
.L329:
	.align	2
.L328:
	.word	.LANCHOR0
	.word	67109120
	.word	.LANCHOR1
	.word	player
	.word	encounters
	.word	oldButtons
	.word	buttons
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
	ldr	r5, .L346
	ldr	r2, .L346+4
	ldr	r3, [r5, #48]
	add	r2, r2, r3, lsl #3
	mov	r1, r2
	mov	r10, #512
	mov	r9, #2
	ldr	r6, .L346+8
	sub	sp, sp, #12
	str	r3, [sp, #4]
	ldr	r3, .L346+12
	ldr	r8, [r5, #12]
	ldr	r7, [r6, #16]
	ldr	r4, .L346+16
	add	lr, r3, #320
.L333:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	strheq	r10, [r1]	@ movhi
	beq	.L332
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
.L332:
	add	r3, r3, #64
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L333
	mov	r1, r2
	mov	fp, #512
	mov	r10, #6
	mov	r9, #7
	ldr	r3, .L346+20
	ldr	r8, [r5, #12]
	ldr	r7, [r6, #16]
	add	r4, r3, #360
.L337:
	ldr	r0, [r3, #48]
	cmp	r0, #0
	strheq	fp, [r1, #40]	@ movhi
	beq	.L336
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
.L336:
	add	r3, r3, #72
	cmp	r3, r4
	add	r1, r1, #8
	bne	.L337
	mov	r8, #512
	mov	r7, #6
	mov	r4, #7
	ldr	r3, .L346+24
	ldr	r6, [r6, #16]
	ldr	lr, [r5, #12]
	ldr	ip, .L346+16
	add	r0, r3, #400
.L341:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r8, [r2, #80]	@ movhi
	beq	.L340
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
.L340:
	add	r3, r3, #80
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L341
	ldr	r3, [sp, #4]
	add	r3, r3, #15
	str	r3, [r5, #48]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L347:
	.align	2
.L346:
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
	ldr	r5, .L358
	ldr	r2, .L358+4
	ldr	r4, [r5, #48]
	add	r2, r2, r4, lsl #3
	mov	r1, r2
	mov	r7, #512
	mov	r6, #3
	ldr	r3, .L358+8
	add	ip, r3, #180
.L351:
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
	bne	.L351
	mov	r6, #512
	mov	lr, #35
	ldr	r3, .L358+12
	add	r0, r3, #180
.L354:
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
	bne	.L354
	add	r4, r4, #10
	str	r4, [r5, #48]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L359:
	.align	2
.L358:
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
	ldr	lr, .L370
	ldr	r1, .L370+4
	ldr	ip, [lr, #48]
	add	r1, r1, ip, lsl #3
	mov	r0, r1
	mov	r3, #0
	mov	r7, #4
	mov	r6, #5
	ldr	r5, .L370+8
	ldr	r4, [r5, #4]
.L363:
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
	bne	.L363
	mov	r3, #0
	mov	r4, #4
	ldr	r0, [r5]
.L366:
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
	bne	.L366
	add	ip, ip, #20
	str	ip, [lr, #48]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L371:
	.align	2
.L370:
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
	ldr	r3, .L381
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	mov	r3, #67108864
	ldr	r1, .L381+4
	ldr	r0, .L381+8
	ldrh	r2, [r1, #12]
	push	{r4, lr}
	ldrh	r0, [r0, #16]
	strh	r2, [r3, #16]	@ movhi
	ldr	r2, .L381+12
	strh	r0, [r3, #18]	@ movhi
	ldr	r3, [r2]
	mvn	r0, r3, lsl #17
	mov	lr, #1
	mvn	r0, r0, lsr #17
	ldr	r4, [r1]
	sub	r3, r3, #10
	ldrh	ip, [r2, #4]
	lsl	r3, r3, #16
	ldr	r2, .L381+16
	lsr	r3, r3, #16
	cmp	r4, #0
	strh	r3, [r2, #8]	@ movhi
	orrle	r3, r3, #512
	strh	r0, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	ip, [r2, #10]	@ movhi
	strh	lr, [r2, #4]	@ movhi
	strhle	r3, [r2, #8]	@ movhi
	ble	.L376
	ldr	r3, [r1, #4]
	cmp	r3, #0
	movgt	r3, #37
	movle	r3, #36
	strh	r3, [r2, #12]	@ movhi
.L376:
	mov	r3, #2
	ldr	r4, .L381+20
	str	r3, [r1, #48]
	bl	drawEnemies
	bl	drawProjectiles
	bl	drawUI
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L381+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L382:
	.align	2
.L381:
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
	.global	recentlyShieldedAttackTicks
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
