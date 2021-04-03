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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r3, #8
	push	{r4, r5, r6, lr}
	mov	r6, #10
	mov	r5, #1
	mov	r4, #200
	mov	lr, #217
	mov	r1, ip
	ldr	r0, .L6
	mov	r2, r3
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	ldr	r3, .L6+4
	str	r6, [r0, #56]
	str	r5, [r0, #52]
	str	r4, [r0, #12]
	str	lr, [r0, #8]
	str	ip, [r0, #60]
	str	ip, [r0, #48]
	add	r0, r3, #180
.L2:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L2
	mov	r3, #1
	mov	r4, #240
	mov	lr, #20
	mov	ip, #217
	ldr	r0, .L6+8
	stm	r0, {r1, r3}
	ldr	r3, .L6+12
	str	r4, [r0, #168]
	str	lr, [r3, #12]
	str	r1, [r0, #172]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	walkers
	.word	playerBolts
	.word	encounters
	.word	player
	.size	initGame, .-initGame
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
	push	{r4, lr}
	mov	r1, #8
	mov	r4, #10
	mov	lr, #1
	mov	r2, #0
	mov	ip, #200
	mov	r0, #217
	ldr	r3, .L10
	str	r4, [r3, #56]
	str	lr, [r3, #52]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #60]
	str	r2, [r3, #48]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	walkers
	.size	initEnemies, .-initEnemies
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
	ldr	r3, .L16
	add	r0, r3, #180
.L13:
	str	r1, [r3, #32]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L13
	bx	lr
.L17:
	.align	2
.L16:
	.word	playerBolts
	.size	initProjectiles, .-initProjectiles
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
	ldr	r0, .L30
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L29
.L19:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L19
.L29:
	push	{r4, lr}
	mov	r4, #1
	ldr	ip, .L30+4
	ldr	r2, .L30+8
	add	r3, r3, r3, lsl #3
	ldr	lr, [r2]
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
.L31:
	.align	2
.L30:
	.word	playerBolts
	.word	player
	.word	.LANCHOR0
	.size	spawnPlayerBolt, .-spawnPlayerBolt
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #0
	ldr	r4, .L60
	ldr	r5, .L60+4
	ldr	r10, .L60+8
	ldr	r9, .L60+12
	ldr	r6, .L60+16
	sub	sp, sp, #16
	add	r7, r4, #180
.L48:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L58
.L34:
	add	r4, r4, #36
	cmp	r4, r7
	bne	.L48
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L58:
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	add	r3, r2, r2, lsl #2
	add	r3, r3, r3, lsl #2
	add	r3, r3, r1
	cmp	r3, #9
	str	r3, [r4, #28]
	bgt	.L35
	b	.L59
.L39:
	add	r0, r0, #1
	cmp	r3, #9
	str	r0, [r4, #12]
	str	r3, [r4, #28]
	ble	.L37
.L35:
	cmp	r2, #1
	ldr	r0, [r4, #12]
	sub	r3, r3, #10
	beq	.L39
	ldr	r3, [r4, #28]
.L40:
	cmn	r3, #9
	bge	.L37
	cmn	r2, #1
	bne	.L37
.L43:
	add	r3, r3, #10
	sub	r0, r0, #1
	cmn	r3, #9
	str	r3, [r4, #28]
	str	r0, [r4, #12]
	blt	.L43
.L37:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L42
	add	r1, r5, #16
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L44
.L57:
	ldr	r0, [r4, #12]
.L42:
	ldr	r2, [r10]
	ldr	r3, [r4, #8]
	sub	r0, r0, r2
	ldr	r2, [r9, #4]
	cmp	r0, #240
	sub	r3, r3, r2
	str	r0, [r4, #4]
	str	r3, [r4]
	strhi	r8, [r4, #32]
	b	.L34
.L44:
	ldr	r3, [r5, #56]
	sub	r3, r3, #4
	cmp	r3, #0
	str	r8, [r4, #32]
	str	r3, [r5, #56]
	strle	r8, [r5, #52]
	b	.L57
.L59:
	ldr	r0, [r4, #12]
	b	.L40
.L61:
	.align	2
.L60:
	.word	playerBolts
	.word	walkers
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	collision
	.size	updateProjectiles, .-updateProjectiles
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
	ldr	r5, .L67
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
	ldr	r6, .L67+4
	sub	r0, r4, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #0
	bne	.L62
	ldr	r0, [r5, #12]
	sub	r4, r4, r0
	cmp	r4, #0
	mvngt	r0, #0
	movle	r0, #1
.L62:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	player
	.word	collision
	.size	playerIsWithinRange, .-playerIsWithinRange
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
	push	{r4, lr}
	ldr	r4, .L82
	add	r0, r4, #12
	mov	r2, #6
	ldm	r0, {r0, r1}
	bl	playerIsWithinRange
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L70
	cmp	r3, #2
	beq	.L79
.L69:
	pop	{r4, lr}
	bx	lr
.L70:
	cmp	r0, #0
	bne	.L75
	mov	r1, #200
	mov	r2, #2
	mvn	r3, #19
	str	r1, [r4, #8]
	str	r2, [r4, #52]
	str	r3, [r4, #60]
	pop	{r4, lr}
	bx	lr
.L79:
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #52]
	bne	.L69
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	cmp	r3, #60
	str	r3, [r4, #60]
	ble	.L69
	ldr	r2, .L82+4
	ldr	r3, [r2, #8]
	sub	r3, r3, #3
	cmp	r3, #0
	str	r3, [r2, #8]
	ble	.L80
.L74:
	mov	r3, #0
	str	r3, [r4, #60]
	b	.L69
.L75:
	cmn	r0, #1
	mov	r1, #217
	ldr	r3, [r4, #48]
	beq	.L81
	add	r2, r3, #4
	cmp	r2, #9
	str	r2, [r4, #48]
	ldrgt	r2, [r4, #12]
	subgt	r3, r3, #6
	addgt	r2, r2, #1
	str	r1, [r4, #8]
	strgt	r3, [r4, #48]
	strgt	r2, [r4, #12]
	b	.L69
.L81:
	sub	r2, r3, #4
	cmp	r2, #0
	str	r1, [r4, #8]
	str	r2, [r4, #48]
	bgt	.L69
	ldr	r2, [r4, #12]
	add	r3, r3, #6
	sub	r2, r2, #1
	str	r3, [r4, #48]
	str	r2, [r4, #12]
	b	.L69
.L80:
	ldr	r3, .L82+8
	mov	lr, pc
	bx	r3
	b	.L74
.L83:
	.align	2
.L82:
	.word	walkers
	.word	.LANCHOR0
	.word	goToLose
	.size	updateEnemies, .-updateEnemies
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
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #16
	push	{r4, r5, r6, lr}
	beq	.L85
	ldr	r5, .L106+4
.L86:
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L89
	mvn	r1, #0
	ldr	r4, .L106+8
	ldr	r3, [r4, #4]
	ldr	r2, .L106+12
	ldr	r0, .L106+16
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	ldr	r0, [r0, r3, lsl #3]
	ldr	r3, [r2, #12]
	cmp	r3, r0
	addgt	r3, r3, r1
	str	r1, [r5]
	strgt	r3, [r2, #12]
.L89:
	ldr	r3, .L106+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L104
	ldr	r3, .L106+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L101
.L104:
	ldr	r4, .L106+8
.L92:
	bl	updateEnemies
	bl	updateProjectiles
	ldr	r3, .L106+12
	ldr	r0, [r4]
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #8]
	sub	r1, r1, r0
	ldr	r0, [r5, #4]
	sub	r2, r2, r0
	ldr	r0, [r5, #12]
	cmp	r0, #9
	str	r1, [r3, #4]
	str	r2, [r3]
	ldr	r3, [r4, #8]
	bgt	.L96
.L97:
	add	r3, r3, #1
	cmp	r3, #29
	str	r3, [r4, #8]
	movgt	r3, #0
	addgt	r0, r0, #1
	strgt	r0, [r5, #12]
	strgt	r3, [r4, #8]
.L84:
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	cmp	r3, #0
	blt	.L97
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L84
	bl	spawnPlayerBolt
	ldr	r3, [r5, #12]
	ldr	r4, .L106+8
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r5, #12]
	ldrle	r3, [r4, #8]
	suble	r3, r3, #90
	strle	r3, [r4, #8]
	b	.L92
.L85:
	mov	ip, #1
	ldr	r4, .L106+8
	ldr	r3, [r4, #4]
	ldr	r1, .L106+12
	add	r3, r3, ip
	ldr	r0, [r1, #12]
	ldr	lr, .L106+16
	ldr	r2, [r1, #24]
	add	r3, r3, r3, lsl ip
	rsb	r3, r3, r3, lsl #3
	ldr	lr, [lr, r3, lsl #3]
	add	r3, r0, r2
	add	r3, r3, ip
	cmp	r3, lr
	ldr	r5, .L106+4
	addlt	r0, r0, ip
	str	ip, [r5]
	strlt	r0, [r1, #12]
	b	.L86
.L107:
	.align	2
.L106:
	.word	67109120
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	player
	.word	encounters
	.word	oldButtons
	.word	buttons
	.size	updateGame, .-updateGame
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
	ldr	r3, .L109
	ldr	r0, [r3, #52]
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L110:
	.align	2
.L109:
	.word	walkers
	.size	currentEncounterIsCleared, .-currentEncounterIsCleared
	.align	2
	.global	damagePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	damagePlayer, %function
damagePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L117
	ldr	r3, [r2, #8]
	sub	r0, r3, r0
	cmp	r0, #0
	str	r0, [r2, #8]
	bxgt	lr
	push	{r4, lr}
	ldr	r3, .L117+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.word	goToLose
	.size	damagePlayer, .-damagePlayer
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
	ldr	r2, .L126
	ldr	r3, [r2, #52]
	ldr	r1, .L126+4
	cmp	r3, #0
	ldr	r3, [r1, #12]
	beq	.L120
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	r0, .L126+8
	ldr	lr, [r2, #8]
	ldr	ip, [r0, #4]
	ldr	r0, .L126+12
	sub	lr, lr, ip
	lsl	r4, r3, #3
	ldr	ip, [r2, #12]
	str	lr, [r2]
	strh	lr, [r0, r4]	@ movhi
	ldr	lr, [r1]
	add	r0, r0, r3, lsl #3
	sub	ip, ip, lr
	add	r3, r3, #1
	strh	r5, [r0, #4]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	pop	{r4, r5, lr}
	str	ip, [r2, #4]
	str	r3, [r1, #12]
	bx	lr
.L120:
	mov	ip, #512
	ldr	r0, .L126+12
	lsl	r2, r3, #3
	add	r3, r3, #1
	strh	ip, [r0, r2]	@ movhi
	str	r3, [r1, #12]
	bx	lr
.L127:
	.align	2
.L126:
	.word	walkers
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	shadowOAM
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
	push	{r4, r5, r6, lr}
	mov	r5, #512
	mov	r4, #1
	ldr	r6, .L134
	ldr	r2, .L134+4
	ldr	lr, [r6, #12]
	ldr	r3, .L134+8
	add	r2, r2, lr, lsl #3
	add	r0, r3, #180
.L131:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	ldrne	ip, [r3]
	ldrne	r1, [r3, #4]
	add	r3, r3, #36
	strhne	r4, [r2, #4]	@ movhi
	strhne	ip, [r2]	@ movhi
	strhne	r1, [r2, #2]	@ movhi
	strheq	r5, [r2]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L131
	add	lr, lr, #5
	str	lr, [r6, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L135:
	.align	2
.L134:
	.word	.LANCHOR1
	.word	shadowOAM
	.word	playerBolts
	.size	drawProjectiles, .-drawProjectiles
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
	ldr	r3, .L142
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	mov	r0, #67108864
	mov	r3, #1
	ldr	r2, .L142+4
	ldr	ip, .L142+8
	ldrh	r1, [r2]
	push	{r4, lr}
	ldrh	ip, [ip, #4]
	strh	r1, [r0, #16]	@ movhi
	ldr	r1, .L142+12
	strh	ip, [r0, #18]	@ movhi
	ldr	r4, .L142+16
	ldm	r1, {r0, r1}
	str	r3, [r2, #12]
	strh	r3, [r4, #4]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	bl	drawEnemies
	bl	drawProjectiles
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L142+20
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	state
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	player
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.global	spellsUnlocked
	.global	playerFacingDirection
	.global	playerManaStep
	.global	currentPlayerMana
	.global	currentPlayerHealth
	.global	vOff
	.global	hOff
	.global	shadowOAMIndex
	.global	currentEncounter
	.comm	playerBolts,180,4
	.comm	walkers,64,4
	.comm	encounters,336,4
	.comm	player,56,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerFacingDirection, %object
	.size	playerFacingDirection, 4
playerFacingDirection:
	.word	1
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	95
	.type	currentPlayerHealth, %object
	.size	currentPlayerHealth, 4
currentPlayerHealth:
	.word	10
	.type	currentPlayerMana, %object
	.size	currentPlayerMana, 4
currentPlayerMana:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	currentEncounter, %object
	.size	currentEncounter, 4
currentEncounter:
	.space	4
	.type	playerManaStep, %object
	.size	playerManaStep, 4
playerManaStep:
	.space	4
	.type	shadowOAMIndex, %object
	.size	shadowOAMIndex, 4
shadowOAMIndex:
	.space	4
	.type	spellsUnlocked, %object
	.size	spellsUnlocked, 4
spellsUnlocked:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
