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
	push	{r4, r5, r6, lr}
	bne	.L2
	ldr	r2, .L11
	ldr	r3, [r2]
	cmp	r3, #0
	bgt	.L9
.L2:
	ldr	r2, .L11+4
	ldr	r3, [r2, #4]
	sub	r0, r3, r0
	cmp	r0, #0
	str	r0, [r2, #4]
	ble	.L10
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	ldr	lr, .L11+4
	ldr	r1, [lr]
	add	r1, r1, #2
	cmp	r1, #10
	mov	r4, #37
	movgt	r1, #10
	ldr	r0, .L11+8
	ldr	ip, [r0]
	ldr	r5, [r0, #4]
	ldr	r0, .L11+12
	sub	ip, ip, #8
	add	r3, r3, #15
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	ip, [r0, #8]	@ movhi
	str	r1, [lr]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	ldr	r3, .L11+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r5, .L18
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
	ldr	r6, .L18+4
	sub	r0, r4, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #0
	bne	.L13
	ldr	r0, [r5, #12]
	sub	r4, r4, r0
	cmp	r4, #0
	mvngt	r0, #0
	movle	r0, #1
.L13:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
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
	ldr	r3, .L24
	ldr	r3, [r3, #8]
	sub	r0, r3, r0
	eor	r3, r0, r0, asr #31
	sub	r3, r3, r0, asr #31
	cmp	r3, r1
	ble	.L22
	cmp	r0, #0
	movgt	r0, #1
	mvnle	r0, #0
	bx	lr
.L22:
	mov	r0, #0
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L31
	add	r1, r3, #320
.L28:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L29
	cmp	r3, r1
	bne	.L28
	mov	r0, #1
	bx	lr
.L29:
	mov	r0, #0
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r0, .L45
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L44
.L34:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L34
.L44:
	push	{r4, lr}
	mov	r4, #1
	ldr	ip, .L45+4
	ldr	r2, .L45+8
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
.L46:
	.align	2
.L45:
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
	ldr	r5, .L56
	mov	ip, #0
	mov	lr, r5
.L51:
	ldr	r4, [lr, #32]
	cmp	r4, #0
	beq	.L55
	add	ip, ip, #1
	cmp	ip, #5
	add	lr, lr, #36
	bne	.L51
	pop	{r4, r5, lr}
	bx	lr
.L55:
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
.L57:
	.align	2
.L56:
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
	push	{r4, r5, lr}
	beq	.L59
	cmp	r0, #2
	beq	.L60
	cmp	r0, #0
	beq	.L72
.L58:
	pop	{r4, r5, lr}
	bx	lr
.L72:
	ldr	r2, .L76
.L63:
	ldr	r3, [r2, r0, lsl #6]
	cmp	r3, #0
	lsl	ip, r0, #6
	add	r0, r0, #1
	beq	.L73
	cmp	r0, #5
	bne	.L63
	pop	{r4, r5, lr}
	bx	lr
.L60:
	ldr	ip, .L76+4
	mov	r3, #0
	mov	r2, ip
.L67:
	ldr	r0, [r2, #48]
	cmp	r0, #0
	beq	.L74
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #80
	bne	.L67
	pop	{r4, r5, lr}
	bx	lr
.L59:
	ldr	ip, .L76+8
	mov	r3, #0
	mov	r2, ip
.L65:
	ldr	r0, [r2, #48]
	cmp	r0, #0
	beq	.L75
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #72
	bne	.L65
	pop	{r4, r5, lr}
	bx	lr
.L73:
	mov	lr, #1
	mov	r0, #10
	ldr	r2, .L76+12
	ldr	r2, [r2, #4]
	add	r4, r2, r2, lsl #2
	add	r2, r2, r4, lsl lr
	ldr	r4, .L76+16
	ldr	r2, [r4, r2, lsl #4]
	add	r1, r2, r1
	ldr	r2, .L76+20
	add	ip, r2, ip
	str	r1, [ip, #12]
	str	r3, [ip, #60]
	str	r3, [ip, #48]
	str	r3, [ip, #44]
	str	lr, [ip, #52]
	str	r0, [ip, #56]
	b	.L58
.L75:
	mov	r5, #3
	mov	lr, #1
	mov	r4, #15
	ldr	r2, .L76+12
	ldr	r2, [r2, #4]
	add	r3, r3, r3, lsl r5
	add	r3, ip, r3, lsl r5
	add	ip, r2, r2, lsl #2
	add	r2, r2, ip, lsl lr
	ldr	ip, .L76+16
	ldr	r2, [ip, r2, lsl #4]
	add	r1, r2, r1
	str	r0, [r3, #60]
	str	r0, [r3, #44]
	str	r5, [r3, #48]
	str	r4, [r3, #52]
	str	r1, [r3, #12]
	str	lr, [r3, #56]
	b	.L58
.L74:
	mov	lr, #1
	mov	r5, #3
	mov	r4, #15
	ldr	r2, .L76+12
	ldr	r2, [r2, #4]
	add	r3, r3, r3, lsl #2
	add	r3, ip, r3, lsl #4
	add	ip, r2, r2, lsl #2
	add	r2, r2, ip, lsl lr
	ldr	ip, .L76+16
	ldr	r2, [ip, r2, lsl #4]
	add	r1, r2, r1
	str	r0, [r3, #64]
	str	r0, [r3, #44]
	str	r5, [r3, #48]
	str	r4, [r3, #52]
	str	r1, [r3, #12]
	str	lr, [r3, #60]
	b	.L58
.L77:
	.align	2
.L76:
	.word	walkers+52
	.word	wraiths
	.word	shooters
	.word	.LANCHOR0
	.word	encounters
	.word	walkers
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
	ldr	r4, .L83
	ldr	r2, [r4, #4]
	ldr	r6, .L83+4
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl #1
	add	r1, r6, r3, lsl #4
	ldr	r0, [r1, #8]
	ldr	r3, [r6, r3, lsl #4]
	ldr	r1, .L83+8
	cmp	r0, #0
	add	r0, r3, #1
	str	r3, [r4, #8]
	str	r0, [r1, #12]
	ble	.L78
	mov	r5, #0
	lsl	r3, r2, #2
.L80:
	add	r3, r3, r2
	add	r3, r2, r3, lsl #1
	add	r3, r5, r3, lsl #1
	add	r3, r3, #2
	add	r2, r6, r3, lsl #3
	ldr	r0, [r2, #4]
	ldr	r1, [r6, r3, lsl #3]
	bl	spawnEnemy
	ldr	r2, [r4, #4]
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl #1
	add	r3, r6, r3, lsl #4
	ldr	r3, [r3, #8]
	add	r5, r5, #1
	cmp	r3, r5
	lsl	r3, r2, #2
	bgt	.L80
.L78:
	pop	{r4, r5, r6, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.word	encounters
	.word	player
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
	ldr	r3, .L93
	add	r1, r3, #320
.L86:
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
	bne	.L86
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L93+4
	add	r1, r3, #360
.L87:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L87
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L93+8
	add	r1, r3, #400
.L88:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #64]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L88
	pop	{r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
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
	ldr	r3, .L101
	add	r0, r3, #180
.L96:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L96
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L101+4
	add	r0, r3, #180
.L97:
	str	r2, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L97
	mov	lr, #1
	mov	fp, #2
	mov	r10, #240
	mov	r9, #120
	mov	r8, #40
	mov	r7, #3
	mov	ip, #80
	mov	r6, #20
	mov	r5, #16
	mov	r4, #209
	mov	r0, #10
	ldr	r3, .L101+8
	stm	r3, {r2, lr}
	str	lr, [r3, #8]
	str	r2, [r3, #180]
	str	r2, [r3, #196]
	str	r2, [r3, #204]
	str	r2, [r3, #212]
	str	fp, [r3, #20]
	str	r10, [r3, #176]
	str	r9, [r3, #200]
	str	r8, [r3, #208]
	str	r7, [r3, #184]
	str	ip, [r3, #16]
	str	ip, [r3, #192]
	ldr	r3, .L101+12
	ldr	r2, .L101+16
	str	r6, [r3, #12]
	str	r1, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #8]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	str	r0, [r2, #4]
	str	r0, [r2]
	b	startEncounter
.L102:
	.align	2
.L101:
	.word	playerBolts
	.word	shooterProjectiles
	.word	encounters
	.word	player
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
	ldr	r3, .L109
	add	r0, r3, #180
.L104:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L104
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L109+4
	add	r0, r3, #180
.L105:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L105
	bx	lr
.L110:
	.align	2
.L109:
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
	ldr	r4, .L178
	add	r6, r4, #320
.L119:
	add	r0, r4, #12
	mov	r2, #6
	ldm	r0, {r0, r1}
	bl	playerIsWithinRange
	ldr	r3, [r4, #52]
	cmp	r3, #1
	mov	r5, r0
	beq	.L112
	cmp	r3, #2
	bne	.L113
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #52]
	bne	.L113
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r4, #60]
	bgt	.L170
.L113:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L119
	ldr	r5, .L178+4
	mov	r6, #0
	mov	r4, r5
	mov	r7, #3
	ldr	r8, .L178+8
	add	r9, r5, #360
.L133:
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L120
	cmp	r3, #3
	bne	.L122
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	bgt	.L171
.L122:
	add	r4, r4, #72
	cmp	r4, r9
	bne	.L133
	mov	r9, #0
	ldr	r4, .L178+12
	ldr	r7, .L178+16
	ldr	r8, .L178+8
	add	r6, r4, #400
.L147:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L172
.L148:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #72
	bne	.L147
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L112:
	cmp	r0, #0
	bne	.L116
	mvn	r2, #9
	ldr	r3, [r4, #20]
	rsb	r3, r3, #223
	str	r7, [r4, #52]
	str	r3, [r4, #8]
	str	r2, [r4, #60]
	b	.L113
.L120:
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
	bgt	.L173
.L123:
	ldr	r3, [r4, #64]
	cmp	r3, #239
	strgt	r6, [r4, #64]
	strgt	r7, [r4, #48]
	b	.L122
.L172:
	mov	r2, #0
	ldr	r0, [r4, #64]
	ldr	r3, [r5, #64]
	add	r0, r0, #1
	add	r3, r3, #1
	mov	r1, r2
	str	r0, [r4, #64]
	str	r3, [r5, #64]
	ldr	r0, [r4, #12]
	bl	playerIsWithinRange
	ldr	r3, [r4, #64]
	cmp	r3, #59
	str	r0, [r4, #60]
	ldr	r2, [r4, #8]
	ble	.L166
	ldr	r3, [r7, #8]
	sub	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #4
	ble	.L161
.L166:
	ldr	r1, [r4, #20]
.L135:
	rsb	r3, r1, #225
	cmp	r2, r3
	blt	.L140
	ldr	r3, [r4, #72]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #72]
	bgt	.L141
.L168:
	ldr	r3, [r4, #76]
	lsl	r3, r3, #2
.L142:
	ldr	r0, [r4, #56]
	add	r3, r3, r0
	cmn	r3, #9
	bge	.L145
	add	r2, r2, #1
	add	r1, r1, r2
	add	r3, r3, #10
	cmp	r1, #224
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strgt	r9, [r4, #56]
	strgt	r9, [r4, #76]
	b	.L148
.L116:
	cmn	r0, #1
	beq	.L174
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
	b	.L113
.L145:
	cmp	r3, #9
	strle	r3, [r4, #56]
	ble	.L148
	sub	r2, r2, #1
	add	r1, r1, r2
	sub	r3, r3, #10
	cmp	r1, #215
	str	r2, [r4, #8]
	str	r3, [r4, #56]
	strle	r9, [r4, #56]
	strle	r9, [r4, #76]
	b	.L148
.L140:
	add	r3, r2, r1
	cmp	r3, #215
	bgt	.L168
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	str	r3, [r4, #68]
	ble	.L168
	mvn	r0, #0
	mvn	r3, #3
	str	r9, [r4, #68]
	str	r0, [r4, #76]
	b	.L142
.L141:
	mov	r3, #1
	str	r9, [r4, #72]
	str	r3, [r4, #76]
	mov	r3, #4
	b	.L142
.L173:
	mov	r3, #0
	ldr	r2, .L178+8
.L127:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L175
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L127
.L126:
	str	r6, [r4, #60]
	b	.L123
.L174:
	ldr	r2, [r4, #48]
	ldr	r3, [r4, #20]
	sub	r1, r2, #4
	rsb	r3, r3, #225
	cmp	r1, #0
	str	r1, [r4, #48]
	str	r3, [r4, #8]
	bgt	.L113
	ldr	r3, [r4, #12]
	add	r2, r2, #6
	sub	r3, r3, #1
	str	r2, [r4, #48]
	str	r3, [r4, #12]
	b	.L113
.L161:
	mov	r3, #0
	ldr	r1, .L178+8
.L139:
	ldr	ip, [r1, #32]
	cmp	ip, #0
	beq	.L176
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #36
	bne	.L139
	ldr	r1, [r4, #20]
.L138:
	str	r9, [r4, #64]
	b	.L135
.L170:
	mov	r1, r0
	mov	r0, #3
	bl	damagePlayer
	str	r5, [r4, #60]
	b	.L113
.L171:
	mov	r2, #0
	mov	r3, #2
	mov	r1, r2
	str	r3, [r4, #48]
	ldr	r0, [r4, #12]
	str	r6, [r4, #68]
	bl	playerIsWithinRange
	mov	r3, #0
	str	r0, [r4, #56]
	ldr	r2, .L178+8
.L132:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L177
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L132
	b	.L122
.L175:
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
	b	.L126
.L176:
	mov	lr, #1
	ldr	r1, [r4, #20]
	add	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #2
	str	ip, [r3, #28]
	add	ip, r1, r1, lsr #31
	cmn	r0, #1
	add	ip, r2, ip, asr lr
	str	r0, [r3, #24]
	add	r0, r4, #12
	str	ip, [r3, #8]
	ldm	r0, {r0, ip}
	addne	r0, r0, ip
	str	lr, [r3, #32]
	str	r0, [r3, #12]
	b	.L138
.L177:
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
	b	.L122
.L179:
	.align	2
.L178:
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
	ldr	r3, .L264
	ldr	r4, .L264+4
	ldr	fp, .L264+8
	ldr	r9, .L264+12
	sub	sp, sp, #20
	add	r10, r4, #180
	add	r7, r3, #320
.L209:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L256
.L182:
	add	r4, r4, #36
	cmp	r4, r10
	bne	.L209
	mov	r10, #0
	ldr	r4, .L264+16
	ldr	r5, .L264+20
	ldr	r9, .L264+12
	ldr	r8, .L264+8
	ldr	r7, .L264+24
	add	r6, r4, #180
.L221:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L257
.L211:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L221
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L257:
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r2, lsl #3
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L212
	b	.L258
.L216:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L214
.L212:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L216
	ldr	r3, [r4, #28]
.L217:
	cmn	r3, #9
	bge	.L214
	cmn	r2, #1
	bne	.L214
.L218:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L218
.L214:
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
	bne	.L259
.L219:
	ldr	r1, [r8, #8]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r3, r3, r1
	ldr	r1, [r7, #12]
	cmp	r3, #240
	sub	r2, r2, r1
	stm	r4, {r2, r3}
	strhi	r10, [r4, #32]
	b	.L211
.L256:
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	rsb	r3, r2, r2, lsl #4
	add	r3, r3, r1
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L183
	b	.L260
.L187:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L185
.L183:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L187
	ldr	r3, [r4, #28]
.L188:
	cmn	r3, #9
	bge	.L185
	cmn	r2, #1
	bne	.L185
.L189:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L189
.L185:
	mov	r6, #0
	ldr	r5, .L264
.L195:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L261
.L190:
	add	r5, r5, #64
	cmp	r5, r7
	bne	.L195
	ldr	r5, .L264+28
	add	r8, r5, #360
.L201:
	ldr	r6, [r5, #48]
	cmp	r6, #2
	beq	.L262
.L196:
	add	r5, r5, #72
	cmp	r5, r8
	bne	.L201
	mov	r8, #0
	ldr	r5, .L264+32
	add	r6, r5, #400
.L207:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L263
.L202:
	add	r5, r5, #80
	cmp	r5, r6
	bne	.L207
	ldr	r3, .L264+24
	ldr	r1, [fp, #8]
	ldr	r2, [r3, #12]
	ldr	r3, [r4, #8]
	sub	r0, r0, r1
	sub	r3, r3, r2
	cmp	r0, #240
	str	r3, [r4]
	movhi	r3, #0
	str	r0, [r4, #4]
	strhi	r3, [r4, #32]
	b	.L182
.L263:
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
	beq	.L255
	ldr	r3, [r5, #52]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r8, [r4, #32]
	str	r3, [r5, #52]
	ble	.L204
.L255:
	ldr	r0, [r4, #12]
	b	.L202
.L261:
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
	beq	.L253
	ldr	r3, [r5, #56]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r6, [r4, #32]
	str	r3, [r5, #56]
	ble	.L192
.L253:
	ldr	r0, [r4, #12]
	b	.L190
.L262:
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
	beq	.L254
	mov	r2, #0
	ldr	r3, [r5, #52]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r2, [r4, #32]
	str	r3, [r5, #52]
	ble	.L198
.L254:
	ldr	r0, [r4, #12]
	b	.L196
.L259:
	mov	r1, #0
	mov	r0, #3
	bl	damagePlayer
	str	r10, [r4, #32]
	b	.L219
.L192:
	ldr	r3, .L264
	str	r6, [r5, #52]
.L194:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L222
	cmp	r3, r7
	bne	.L194
	mov	r1, #2
.L193:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L264+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L253
.L204:
	ldr	r3, .L264
	str	r8, [r5, #48]
.L206:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L224
	cmp	r3, r7
	bne	.L206
	mov	r1, #2
.L205:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L264+36
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L255
.L198:
	mov	r2, #0
	ldr	r3, .L264
	str	r2, [r5, #48]
.L200:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L223
	cmp	r3, r7
	bne	.L200
.L199:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L264+36
	add	r3, r2, r3, lsl #4
	str	r6, [r3, #4]
	b	.L254
.L260:
	ldr	r0, [r4, #12]
	b	.L188
.L258:
	ldr	r0, [r4, #12]
	b	.L217
.L224:
	mov	r1, #1
	b	.L205
.L222:
	mov	r1, #1
	b	.L193
.L223:
	mov	r6, #1
	b	.L199
.L265:
	.align	2
.L264:
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
	ldr	r4, .L319
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
	ldr	r3, [r4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4]
	ldr	r3, .L319+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L271
	ldr	r6, .L319+8
	ldr	r5, .L319+12
.L272:
	ldr	r3, .L319+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L279
	mvn	r1, #0
	ldr	r3, [r4, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L319+16
	ldr	r3, [r2, r3, lsl #4]
	ldr	r2, [r5, #12]
	cmp	r2, r3
	str	r1, [r6, #8]
	bgt	.L315
.L279:
	ldr	r7, .L319+20
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L283
	ldr	r2, .L319+24
	ldrh	r2, [r2]
	ands	r8, r2, #1
	beq	.L316
.L283:
	tst	r3, #2
	beq	.L285
	ldr	r3, .L319+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L317
.L285:
	ldr	r3, .L319+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L286
	ldr	r2, [r6, #16]
	cmp	r2, #1
	ble	.L286
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L286
	ldr	r0, [r4, #32]
	cmp	r0, #0
	ldr	ip, [r5, #8]
	ldr	r2, [r5, #28]
	blt	.L318
	add	lr, ip, r2
	cmp	lr, #213
	str	r3, [r4, #28]
	ble	.L290
.L288:
	add	r0, r0, #1
	str	r0, [r4, #32]
.L290:
	cmp	r0, #1
	movgt	r3, #0
	subgt	ip, ip, #1
	strgt	ip, [r5, #8]
	strgt	r3, [r4, #32]
.L289:
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #36]
	ble	.L292
	mov	r3, #0
	sub	r1, r1, #1
	cmp	r1, r3
	str	r1, [r6]
	str	r3, [r4, #36]
	mvneq	r3, #44
	streq	r3, [r4, #28]
.L292:
	ldr	r3, .L319+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L303
.L297:
	bl	updateEnemies
	bl	updateProjectiles
	ldr	r1, [r4, #8]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	sub	r2, r2, r1
	ldr	r1, [r6, #12]
	sub	r3, r3, r1
	ldr	r1, [r6]
	cmp	r1, #9
	str	r3, [r5]
	str	r2, [r5, #4]
	ldr	r3, [r4, #28]
	ble	.L300
	cmp	r3, #0
	blt	.L300
.L266:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L286:
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #28]
	add	r3, r1, r2
	cmp	r3, #224
	bgt	.L294
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmn	r3, #2
	str	r3, [r4, #32]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #32]
.L294:
	ldr	r3, .L319+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L297
	ldr	r3, [r6, #16]
	cmp	r3, #1
	ble	.L297
.L303:
	ldr	r1, [r5, #8]
	add	r2, r1, r2
	cmp	r2, #224
	bgt	.L297
	ldr	r3, [r4, #32]
	sub	r3, r3, #3
	cmn	r3, #2
	str	r3, [r4, #32]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #32]
	b	.L297
.L300:
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #28]
	ble	.L266
	mov	r3, #0
	add	r1, r1, #1
	str	r1, [r6]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L317:
	ldr	r3, [r6, #16]
	cmp	r3, #0
	ble	.L285
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L285
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bgt	.L285
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L285
	mov	r3, #20
	mov	r2, #36
	mov	r1, #60
	str	r3, [r4]
	str	r3, [r4, #12]
	ldr	r3, .L319+28
	str	r1, [r4, #20]
	strh	r2, [r3, #12]	@ movhi
	b	.L285
.L316:
	ldr	r2, [r4, #12]
	cmp	r2, #0
	bgt	.L283
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bgt	.L283
	ldr	r2, [r6]
	cmp	r2, #0
	ble	.L283
	bl	spawnPlayerBolt
	mov	r2, #20
	ldr	r3, [r6]
	sub	r3, r3, #2
	cmp	r3, #0
	str	r2, [r4, #12]
	ldrle	r2, [r4, #28]
	suble	r2, r2, #45
	str	r3, [r6]
	str	r8, [r4, #16]
	ldrhgt	r3, [r7]
	ldrhle	r3, [r7]
	strle	r2, [r4, #28]
	b	.L283
.L315:
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
	b	.L279
.L271:
	mov	r7, #1
	ldr	r2, [r4, #4]
	ldr	r1, .L319+16
	ldr	r5, .L319+12
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl r7
	ldr	ip, [r1, r3, lsl #4]
	ldr	lr, [r5, #12]
	ldr	r0, [r5, #24]
	ldr	r6, .L319+8
	add	ip, ip, #238
	add	r0, lr, r0
	cmp	ip, r0
	str	r7, [r6, #8]
	add	r3, r1, r3, lsl #4
	blt	.L273
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
	b	.L272
.L273:
	ldr	r3, [r3, #4]
	cmp	r3, #2
	bne	.L272
	add	r2, r2, #1
	cmp	r2, #1
	str	r2, [r4, #4]
	ble	.L277
	ldr	r3, .L319+32
	mov	lr, pc
	bx	r3
	b	.L272
.L318:
	add	r0, r2, ip
	cmp	r0, #213
	str	r3, [r4, #32]
	str	r3, [r4, #28]
	ble	.L289
	mov	r0, r3
	b	.L288
.L277:
	bl	startEncounter
	b	.L272
.L320:
	.align	2
.L319:
	.word	.LANCHOR0
	.word	67109120
	.word	.LANCHOR1
	.word	player
	.word	encounters
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
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
	ldr	r5, .L337
	ldr	r2, .L337+4
	ldr	r3, [r5, #40]
	add	r2, r2, r3, lsl #3
	mov	r1, r2
	mov	r10, #512
	mov	r9, #2
	ldr	r6, .L337+8
	sub	sp, sp, #12
	str	r3, [sp, #4]
	ldr	r3, .L337+12
	ldr	r8, [r5, #8]
	ldr	r7, [r6, #12]
	ldr	r4, .L337+16
	add	lr, r3, #320
.L324:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	strheq	r10, [r1]	@ movhi
	beq	.L323
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
.L323:
	add	r3, r3, #64
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L324
	mov	r1, r2
	mov	fp, #512
	mov	r10, #6
	mov	r9, #7
	ldr	r3, .L337+20
	ldr	r8, [r5, #8]
	ldr	r7, [r6, #12]
	add	r4, r3, #360
.L328:
	ldr	r0, [r3, #48]
	cmp	r0, #0
	strheq	fp, [r1, #40]	@ movhi
	beq	.L327
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
.L327:
	add	r3, r3, #72
	cmp	r3, r4
	add	r1, r1, #8
	bne	.L328
	mov	r8, #512
	mov	r7, #6
	mov	r4, #7
	ldr	r3, .L337+24
	ldr	r6, [r6, #12]
	ldr	lr, [r5, #8]
	ldr	ip, .L337+16
	add	r0, r3, #400
.L332:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r8, [r2, #80]	@ movhi
	beq	.L331
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
.L331:
	add	r3, r3, #80
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L332
	ldr	r3, [sp, #4]
	add	r3, r3, #15
	str	r3, [r5, #40]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L338:
	.align	2
.L337:
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
	ldr	r5, .L349
	ldr	r2, .L349+4
	ldr	r4, [r5, #40]
	add	r2, r2, r4, lsl #3
	mov	r1, r2
	mov	r7, #512
	mov	r6, #3
	ldr	r3, .L349+8
	add	ip, r3, #180
.L342:
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
	bne	.L342
	mov	r6, #512
	mov	lr, #35
	ldr	r3, .L349+12
	add	r0, r3, #180
.L345:
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
	bne	.L345
	add	r4, r4, #10
	str	r4, [r5, #40]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L350:
	.align	2
.L349:
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
	ldr	lr, .L361
	ldr	r1, .L361+4
	ldr	ip, [lr, #40]
	add	r1, r1, ip, lsl #3
	mov	r0, r1
	mov	r3, #0
	mov	r7, #4
	mov	r6, #5
	ldr	r5, .L361+8
	ldr	r4, [r5, #4]
.L354:
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
	bne	.L354
	mov	r3, #0
	mov	r4, #4
	ldr	r0, [r5]
.L357:
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
	bne	.L357
	add	ip, ip, #20
	str	ip, [lr, #40]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L362:
	.align	2
.L361:
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
	ldr	r3, .L371
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	mov	r1, #67108864
	ldr	r2, .L371+4
	ldr	r0, .L371+8
	ldrh	r3, [r2, #8]
	push	{r4, lr}
	ldrh	r0, [r0, #12]
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, .L371+12
	strh	r0, [r1, #18]	@ movhi
	ldr	r0, [r3]
	mvn	r1, r0, lsl #17
	mvn	r1, r1, lsr #17
	mov	lr, #1
	ldr	r4, [r2]
	ldrh	ip, [r3, #4]
	ldr	r3, .L371+16
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
	ldr	r4, .L371+20
	str	r3, [r2, #40]
	bl	drawEnemies
	bl	drawProjectiles
	bl	drawUI
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L371+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L372:
	.align	2
.L371:
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
	.global	shieldTicks
	.global	spellsUnlocked
	.global	playerFacingDirection
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
	.comm	encounters,352,4
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
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	95
	.type	spellsUnlocked, %object
	.size	spellsUnlocked, 4
spellsUnlocked:
	.word	2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	shieldTicks, %object
	.size	shieldTicks, 4
shieldTicks:
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
