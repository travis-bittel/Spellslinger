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
	ldr	r3, .L25
	add	r1, r3, #320
.L22:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L23
	cmp	r3, r1
	bne	.L22
	mov	r0, #1
	bx	lr
.L23:
	mov	r0, #0
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r0, .L39
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L38
.L28:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L28
.L38:
	push	{r4, lr}
	mov	r4, #1
	ldr	ip, .L39+4
	ldr	r2, .L39+8
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
.L40:
	.align	2
.L39:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L53
	mov	r2, ip
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L52
.L42:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L42
.L52:
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r2, [r0, #20]
	add	r3, r3, r3, lsl #3
	add	r3, ip, r3, lsl #2
	ldr	ip, [r0, #8]
	add	r2, r2, r2, lsr #31
	add	r2, ip, r2, asr lr
	ldr	ip, [r0, #56]
	cmn	ip, #1
	str	r2, [r3, #8]
	str	r1, [r3, #28]
	ldreq	r2, [r3, #16]
	ldr	r1, [r0, #12]
	ldrne	r2, [r0, #16]
	subeq	r2, r1, r2
	addne	r2, r2, r1
	str	lr, [r3, #32]
	str	ip, [r3, #24]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
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
	beq	.L56
	cmp	r0, #2
	beq	.L57
	cmp	r0, #0
	beq	.L69
.L55:
	pop	{r4, r5, lr}
	bx	lr
.L69:
	ldr	r2, .L73
.L60:
	ldr	r3, [r2, r0, lsl #6]
	cmp	r3, #0
	lsl	ip, r0, #6
	add	r0, r0, #1
	beq	.L70
	cmp	r0, #5
	bne	.L60
	pop	{r4, r5, lr}
	bx	lr
.L57:
	ldr	lr, .L73+4
	mov	r2, #0
	mov	r0, lr
.L64:
	ldr	ip, [r0, #48]
	cmp	ip, #0
	beq	.L71
	add	r2, r2, #1
	cmp	r2, #5
	add	r0, r0, #72
	bne	.L64
	pop	{r4, r5, lr}
	bx	lr
.L56:
	ldr	lr, .L73+4
	mov	r3, #0
	mov	r0, lr
.L62:
	ldr	ip, [r0, #48]
	cmp	ip, #0
	beq	.L72
	add	r3, r3, #1
	cmp	r3, #5
	add	r0, r0, #72
	bne	.L62
	pop	{r4, r5, lr}
	bx	lr
.L70:
	mov	lr, #1
	mov	r0, #10
	ldr	r2, .L73+8
	ldr	r2, [r2, #4]
	add	r4, r2, r2, lsl #2
	add	r2, r2, r4, lsl lr
	ldr	r4, .L73+12
	ldr	r2, [r4, r2, lsl #4]
	add	r1, r2, r1
	ldr	r2, .L73+16
	add	ip, r2, ip
	str	r1, [ip, #12]
	str	r3, [ip, #60]
	str	r3, [ip, #48]
	str	r3, [ip, #44]
	str	lr, [ip, #52]
	str	r0, [ip, #56]
	b	.L55
.L72:
	mov	r5, #3
	mov	r0, #1
	mov	r4, #15
	ldr	r2, .L73+8
	ldr	r2, [r2, #4]
	add	r3, r3, r3, lsl r5
	add	r3, lr, r3, lsl r5
	add	lr, r2, r2, lsl #2
	add	r2, r2, lr, lsl r0
	ldr	lr, .L73+12
	ldr	r2, [lr, r2, lsl #4]
	add	r1, r2, r1
	str	ip, [r3, #60]
	str	ip, [r3, #44]
	str	r5, [r3, #48]
	str	r4, [r3, #52]
	str	r1, [r3, #12]
	str	r0, [r3, #56]
	b	.L55
.L71:
	mov	r5, #3
	mov	r0, #1
	mov	r4, #15
	ldr	r3, .L73+8
	ldr	r3, [r3, #4]
	add	r2, r2, r2, lsl r5
	add	r2, lr, r2, lsl r5
	add	lr, r3, r3, lsl #2
	add	r3, r3, lr, lsl r0
	ldr	lr, .L73+12
	ldr	r3, [lr, r3, lsl #4]
	add	r1, r3, r1
	str	ip, [r2, #60]
	str	ip, [r2, #44]
	str	r5, [r2, #48]
	str	r4, [r2, #52]
	str	r1, [r2, #12]
	str	r0, [r2, #56]
	b	.L55
.L74:
	.align	2
.L73:
	.word	walkers+52
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
	ldr	r4, .L80
	ldr	r2, [r4, #4]
	ldr	r6, .L80+4
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl #1
	add	r1, r6, r3, lsl #4
	ldr	r0, [r1, #8]
	ldr	r3, [r6, r3, lsl #4]
	ldr	r1, .L80+8
	cmp	r0, #0
	add	r0, r3, #1
	str	r3, [r4, #8]
	str	r0, [r1, #12]
	ble	.L75
	mov	r5, #0
	lsl	r3, r2, #2
.L77:
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
	bgt	.L77
.L75:
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r3, .L88
	add	r1, r3, #320
.L83:
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
	bne	.L83
	mov	r5, #15
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #200
	mov	r0, #209
	ldr	r3, .L88+4
	add	r1, r3, #360
.L84:
	str	r5, [r3, #52]
	str	r2, [r3, #48]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #60]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L84
	pop	{r4, r5, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	walkers
	.word	shooters
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	bl	initEnemies
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L96
	add	r0, r3, #180
.L91:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L91
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L96+4
	add	r0, r3, #180
.L92:
	str	r2, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L92
	mov	r0, #1
	mov	lr, #80
	mov	r10, #240
	mov	r9, #120
	mov	r8, #40
	mov	r7, #3
	mov	r6, #20
	mov	r5, #16
	mov	r4, #209
	mov	ip, #10
	ldr	r3, .L96+8
	str	r2, [r3]
	str	r0, [r3, #8]
	str	r2, [r3, #180]
	str	r2, [r3, #196]
	str	r2, [r3, #204]
	str	r2, [r3, #212]
	str	r10, [r3, #176]
	str	r9, [r3, #200]
	str	r8, [r3, #208]
	str	r7, [r3, #184]
	str	lr, [r3, #16]
	str	lr, [r3, #192]
	str	r0, [r3, #4]
	str	r0, [r3, #20]
	ldr	r3, .L96+12
	ldr	r2, .L96+16
	str	r6, [r3, #12]
	str	r5, [r3, #28]
	str	r4, [r3, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r1, [r3, #24]
	str	ip, [r2, #4]
	str	ip, [r2]
	b	startEncounter
.L97:
	.align	2
.L96:
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
	ldr	r3, .L104
	add	r0, r3, #180
.L99:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L99
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L104+4
	add	r0, r3, #180
.L100:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L100
	bx	lr
.L105:
	.align	2
.L104:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #217
	mov	r7, #2
	ldr	r4, .L130
	add	r6, r4, #320
.L114:
	add	r0, r4, #12
	mov	r2, #6
	ldm	r0, {r0, r1}
	bl	playerIsWithinRange
	ldr	r3, [r4, #52]
	cmp	r3, #1
	mov	r5, r0
	beq	.L107
	cmp	r3, #2
	bne	.L108
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #52]
	bne	.L108
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r4, #60]
	bgt	.L126
.L108:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L114
	mov	r5, #0
	mov	r6, #3
	mov	r7, #2
	ldr	r4, .L130+4
	add	r8, r4, #360
.L122:
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L115
	cmp	r3, #3
	bne	.L117
	ldr	r3, [r4, #68]
	add	r3, r3, #1
	cmp	r3, #119
	strle	r3, [r4, #68]
	bgt	.L127
.L117:
	add	r4, r4, #72
	cmp	r4, r8
	bne	.L122
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	cmp	r0, #0
	bne	.L111
	mvn	r2, #9
	ldr	r3, [r4, #20]
	rsb	r3, r3, #223
	str	r7, [r4, #52]
	str	r3, [r4, #8]
	str	r2, [r4, #60]
	b	.L108
.L115:
	mov	r2, #0
	ldr	ip, [r4, #60]
	ldr	r3, [r4, #64]
	add	ip, ip, #1
	add	r3, r3, #1
	str	r3, [r4, #64]
	mov	r1, r2
	ldr	r0, [r4, #12]
	str	ip, [r4, #60]
	bl	playerIsWithinRange
	ldr	r3, [r4, #60]
	cmp	r3, #59
	str	r0, [r4, #56]
	bgt	.L128
.L118:
	ldr	r3, [r4, #64]
	cmp	r3, #239
	strgt	r5, [r4, #64]
	strgt	r6, [r4, #48]
	b	.L117
.L111:
	cmn	r0, #1
	beq	.L129
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
	b	.L108
.L127:
	mov	r2, #0
	ldr	r0, [r4, #12]
	mov	r1, r2
	str	r5, [r4, #68]
	str	r7, [r4, #48]
	bl	playerIsWithinRange
	mov	r3, r0
	mov	r0, r4
	str	r3, [r4, #56]
	bl	spawnShooterProjectile
	b	.L117
.L128:
	mov	r0, r4
	bl	spawnShooterProjectile
	str	r5, [r4, #60]
	b	.L118
.L129:
	ldr	r2, [r4, #48]
	ldr	r3, [r4, #20]
	sub	r1, r2, #4
	rsb	r3, r3, #225
	cmp	r1, #0
	str	r1, [r4, #48]
	str	r3, [r4, #8]
	bgt	.L108
	ldr	r3, [r4, #12]
	add	r2, r2, #6
	sub	r3, r3, #1
	str	r2, [r4, #48]
	str	r3, [r4, #12]
	b	.L108
.L126:
	mov	r1, r0
	mov	r0, #3
	bl	damagePlayer
	str	r5, [r4, #60]
	b	.L108
.L131:
	.align	2
.L130:
	.word	walkers
	.word	shooters
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
	ldr	r3, .L202
	ldr	r4, .L202+4
	ldr	fp, .L202+8
	ldr	r10, .L202+12
	sub	sp, sp, #20
	add	r9, r4, #180
	add	r7, r3, #320
.L155:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L195
.L134:
	add	r4, r4, #36
	cmp	r4, r9
	bne	.L155
	mov	r10, #0
	ldr	r4, .L202+16
	ldr	r5, .L202+20
	ldr	r9, .L202+12
	ldr	r8, .L202+8
	ldr	r7, .L202+24
	add	r6, r4, #180
.L167:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L196
.L157:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L167
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L196:
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r2, lsl #3
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L158
	b	.L197
.L162:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L160
.L158:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L162
	ldr	r3, [r4, #28]
.L163:
	cmn	r3, #9
	bge	.L160
	cmn	r2, #1
	bne	.L160
.L164:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L164
.L160:
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
	bne	.L198
.L165:
	ldr	r1, [r8, #8]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r3, r3, r1
	ldr	r1, [r7, #12]
	cmp	r3, #240
	sub	r2, r2, r1
	stm	r4, {r2, r3}
	strhi	r10, [r4, #32]
	b	.L157
.L195:
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	rsb	r3, r2, r2, lsl #4
	add	r3, r3, r1
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L135
	b	.L199
.L139:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L137
.L135:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L139
	ldr	r3, [r4, #28]
.L140:
	cmn	r3, #9
	bge	.L137
	cmn	r2, #1
	bne	.L137
.L141:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L141
.L137:
	mov	r6, #0
	ldr	r5, .L202
.L147:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L200
.L142:
	add	r5, r5, #64
	cmp	r5, r7
	bne	.L147
	ldr	r5, .L202+28
	add	r8, r5, #360
.L153:
	ldr	r6, [r5, #48]
	cmp	r6, #2
	beq	.L201
.L148:
	add	r5, r5, #72
	cmp	r5, r8
	bne	.L153
	ldr	r3, .L202+24
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
	b	.L134
.L200:
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
	bx	r10
	cmp	r0, #0
	beq	.L193
	ldr	r3, [r5, #56]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r6, [r4, #32]
	str	r3, [r5, #56]
	ble	.L144
.L193:
	ldr	r0, [r4, #12]
	b	.L142
.L201:
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
	bx	r10
	cmp	r0, #0
	beq	.L194
	mov	r2, #0
	ldr	r3, [r5, #52]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r2, [r4, #32]
	str	r3, [r5, #52]
	ble	.L150
.L194:
	ldr	r0, [r4, #12]
	b	.L148
.L198:
	mov	r1, #0
	mov	r0, #3
	bl	damagePlayer
	str	r10, [r4, #32]
	b	.L165
.L144:
	ldr	r3, .L202
	str	r6, [r5, #52]
.L146:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L168
	cmp	r3, r7
	bne	.L146
	mov	r1, #2
.L145:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L202+32
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	b	.L193
.L150:
	mov	r2, #0
	ldr	r3, .L202
	str	r2, [r5, #48]
.L152:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	add	r3, r3, #64
	bne	.L169
	cmp	r3, r7
	bne	.L152
.L151:
	ldr	r3, [fp, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L202+32
	add	r3, r2, r3, lsl #4
	str	r6, [r3, #4]
	b	.L194
.L199:
	ldr	r0, [r4, #12]
	b	.L140
.L197:
	ldr	r0, [r4, #12]
	b	.L163
.L168:
	mov	r1, #1
	b	.L145
.L169:
	mov	r6, #1
	b	.L151
.L203:
	.align	2
.L202:
	.word	walkers
	.word	playerBolts
	.word	.LANCHOR0
	.word	collision
	.word	shooterProjectiles
	.word	player
	.word	.LANCHOR1
	.word	shooters
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
	ldr	r4, .L256
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
	ldr	r3, .L256+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L209
	ldr	r6, .L256+8
	ldr	r5, .L256+12
.L210:
	ldr	r3, .L256+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L217
	mvn	r1, #0
	ldr	r3, [r4, #4]
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r2, .L256+16
	ldr	r3, [r2, r3, lsl #4]
	ldr	r2, [r5, #12]
	cmp	r2, r3
	str	r1, [r6, #8]
	bgt	.L252
.L217:
	ldr	r7, .L256+20
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L221
	ldr	r2, .L256+24
	ldrh	r2, [r2]
	ands	r8, r2, #1
	beq	.L253
.L221:
	tst	r3, #2
	beq	.L224
	ldr	r3, .L256+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L254
.L224:
	ldr	r3, .L256+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L226
	ldr	r2, [r6, #16]
	cmp	r2, #1
	ble	.L226
	ldr	r1, [r6]
	cmp	r1, #0
	ble	.L226
	ldr	r0, [r4, #32]
	cmp	r0, #0
	ldr	ip, [r5, #8]
	ldr	r2, [r5, #28]
	blt	.L255
	add	lr, ip, r2
	cmp	lr, #213
	str	r3, [r4, #28]
	ble	.L230
.L228:
	add	r0, r0, #1
	str	r0, [r4, #32]
.L230:
	cmp	r0, #1
	movgt	r3, #0
	subgt	ip, ip, #1
	strgt	ip, [r5, #8]
	strgt	r3, [r4, #32]
.L229:
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #36]
	ble	.L232
	mov	r3, #0
	sub	r1, r1, #1
	cmp	r1, r3
	str	r1, [r6]
	str	r3, [r4, #36]
	mvneq	r3, #44
	streq	r3, [r4, #28]
.L232:
	ldr	r3, .L256+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L243
.L237:
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
	ble	.L240
	cmp	r3, #0
	blt	.L240
.L204:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L226:
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #28]
	add	r3, r1, r2
	cmp	r3, #224
	bgt	.L234
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmn	r3, #2
	str	r3, [r4, #32]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #32]
.L234:
	ldr	r3, .L256+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L237
	ldr	r3, [r6, #16]
	cmp	r3, #1
	ble	.L237
.L243:
	ldr	r1, [r5, #8]
	add	r2, r1, r2
	cmp	r2, #224
	bgt	.L237
	ldr	r3, [r4, #32]
	sub	r3, r3, #3
	cmn	r3, #2
	str	r3, [r4, #32]
	movlt	r3, #0
	addlt	r1, r1, #1
	strlt	r1, [r5, #8]
	strlt	r3, [r4, #32]
	b	.L237
.L240:
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #28]
	ble	.L204
	mov	r3, #0
	add	r1, r1, #1
	str	r1, [r6]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L254:
	ldr	r3, [r6, #16]
	cmp	r3, #0
	ble	.L224
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L224
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bgt	.L224
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L224
	mov	r2, #20
	mov	r1, #36
	mov	r0, #60
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r6]
	ldr	r3, .L256+28
	str	r2, [r4]
	str	r2, [r4, #12]
	str	r0, [r4, #20]
	strh	r1, [r3, #12]	@ movhi
	ldrle	r3, [r4, #28]
	suble	r3, r3, #45
	strle	r3, [r4, #28]
	b	.L224
.L253:
	ldr	r2, [r4, #12]
	cmp	r2, #0
	bgt	.L221
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bgt	.L221
	ldr	r2, [r6]
	cmp	r2, #0
	ble	.L221
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
	b	.L221
.L252:
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
	b	.L217
.L209:
	mov	r7, #1
	ldr	r2, [r4, #4]
	ldr	r1, .L256+16
	ldr	r5, .L256+12
	add	r3, r2, r2, lsl #2
	add	r3, r2, r3, lsl r7
	ldr	ip, [r1, r3, lsl #4]
	ldr	lr, [r5, #12]
	ldr	r0, [r5, #24]
	ldr	r6, .L256+8
	add	ip, ip, #238
	add	r0, lr, r0
	cmp	ip, r0
	str	r7, [r6, #8]
	add	r3, r1, r3, lsl #4
	blt	.L211
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
	b	.L210
.L211:
	ldr	r3, [r3, #4]
	cmp	r3, #2
	bne	.L210
	add	r2, r2, #1
	cmp	r2, #1
	str	r2, [r4, #4]
	ble	.L215
	ldr	r3, .L256+32
	mov	lr, pc
	bx	r3
	b	.L210
.L255:
	add	r0, r2, ip
	cmp	r0, #213
	str	r3, [r4, #32]
	str	r3, [r4, #28]
	ble	.L229
	mov	r0, r3
	b	.L228
.L215:
	bl	startEncounter
	b	.L210
.L257:
	.align	2
.L256:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L269
	ldr	r2, .L269+4
	ldr	r5, [r4, #40]
	add	r2, r2, r5, lsl #3
	mov	r1, r2
	mov	fp, #512
	mov	r9, #2
	ldr	r10, .L269+8
	ldr	r3, .L269+12
	ldr	r8, [r4, #8]
	ldr	r7, [r10, #12]
	ldr	r6, .L269+16
	add	lr, r3, #320
.L261:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	strheq	fp, [r1]	@ movhi
	beq	.L260
	add	r0, r3, #8
	ldm	r0, {r0, ip}
	sub	r0, r0, r7
	sub	ip, ip, r8
	str	r0, [r3]
	orr	r0, r0, r6
	strh	r9, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	str	ip, [r3, #4]
	strh	ip, [r1, #2]	@ movhi
.L260:
	add	r3, r3, #64
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L261
	mov	r8, #512
	mov	r7, #6
	mov	r6, #7
	ldr	r3, .L269+20
	ldr	r9, [r10, #12]
	ldr	lr, [r4, #8]
	ldr	ip, .L269+16
	add	r0, r3, #360
.L265:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r8, [r2, #40]	@ movhi
	beq	.L264
	cmp	r1, #2
	movne	fp, r7
	moveq	fp, r6
	ldr	r1, [r3, #8]
	ldr	r10, [r3, #12]
	sub	r1, r1, r9
	sub	r10, r10, lr
	str	r1, [r3]
	orr	r1, r1, ip
	strh	fp, [r2, #44]	@ movhi
	strh	r1, [r2, #40]	@ movhi
	str	r10, [r3, #4]
	strh	r10, [r2, #42]	@ movhi
.L264:
	add	r3, r3, #72
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L265
	add	r5, r5, #10
	str	r5, [r4, #40]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L270:
	.align	2
.L269:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.word	walkers
	.word	-32768
	.word	shooters
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
	ldr	r5, .L281
	ldr	r2, .L281+4
	ldr	r4, [r5, #40]
	add	r2, r2, r4, lsl #3
	mov	r1, r2
	mov	r7, #512
	mov	r6, #3
	ldr	r3, .L281+8
	add	ip, r3, #180
.L274:
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
	bne	.L274
	mov	r6, #512
	mov	lr, #35
	ldr	r3, .L281+12
	add	r0, r3, #180
.L277:
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
	bne	.L277
	add	r4, r4, #10
	str	r4, [r5, #40]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L282:
	.align	2
.L281:
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
	ldr	lr, .L293
	ldr	r1, .L293+4
	ldr	ip, [lr, #40]
	add	r1, r1, ip, lsl #3
	mov	r0, r1
	mov	r3, #0
	mov	r7, #4
	mov	r6, #5
	ldr	r5, .L293+8
	ldr	r4, [r5, #4]
.L286:
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
	bne	.L286
	mov	r3, #0
	mov	r4, #4
	ldr	r0, [r5]
.L289:
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
	bne	.L289
	add	ip, ip, #20
	str	ip, [lr, #40]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L294:
	.align	2
.L293:
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
	ldr	r3, .L303
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	mov	r1, #67108864
	ldr	r2, .L303+4
	ldr	r0, .L303+8
	ldrh	r3, [r2, #8]
	push	{r4, lr}
	ldrh	r0, [r0, #12]
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, .L303+12
	strh	r0, [r1, #18]	@ movhi
	ldr	r0, [r3]
	mvn	r1, r0, lsl #17
	mvn	r1, r1, lsr #17
	mov	lr, #1
	ldr	r4, [r2]
	ldrh	ip, [r3, #4]
	ldr	r3, .L303+16
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
	ldr	r4, .L303+20
	str	r3, [r2, #40]
	bl	drawEnemies
	bl	drawProjectiles
	bl	drawUI
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L303+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L304:
	.align	2
.L303:
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
	.comm	wraiths,380,4
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
