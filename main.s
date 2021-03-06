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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #0
	mov	r2, #67108864
	mov	r4, #256
	mov	r0, #4096
	ldr	r3, .L4
	ldr	r1, .L4+4
	strh	ip, [r2, #16]	@ movhi
	ldr	r1, [r1]
	strh	ip, [r2, #18]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	str	ip, [r3]
	mov	r2, #1
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L4+16
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #8512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	background_music_length
	.word	background_music_data
	.word	playSoundA
	.word	DMANow
	.word	startPal
	.word	startTiles
	.word	100696064
	.word	startMap
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	mov	r1, #4096
	push	{r4, lr}
	mov	lr, #0
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L8
	ldr	r1, .L8+4
	ldrh	r0, [r2, #48]
	ldr	ip, .L8+8
	strh	r0, [r1]	@ movhi
	ldr	r4, .L8+12
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r0, #4096
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L16
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L16+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L16+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #9152
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100696064
	.word	instructionsMap
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L34
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L33
.L19:
	tst	r3, #1
	beq	.L18
	tst	r3, #2
	beq	.L18
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	ands	r3, r3, #3
	bne	.L18
	ldr	r2, .L34+8
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r3, #1
	str	r3, [r2]
.L18:
	pop	{r4, lr}
	bx	lr
.L33:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L19
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	cheatEnabled
	.size	start, .-start
	.align	2
	.global	goToNewSpell
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToNewSpell, %function
goToNewSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r4, #4096
	mov	lr, #6
	ldr	ip, .L41
	cmp	r0, #1
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	lr, [ip]
	beq	.L37
	cmp	r0, #2
	beq	.L38
	ldr	r4, .L41+4
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L41+12
	ldr	r1, .L41+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L41+20
	ldr	r1, .L41+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L37:
	ldr	r4, .L41+4
	mov	r0, #3
	ldr	r1, .L41+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L41+32
	ldr	r1, .L41+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L41+20
	ldr	r1, .L41+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L38:
	ldr	r4, .L41+4
	mov	r0, #3
	ldr	r1, .L41+44
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L41+48
	ldr	r1, .L41+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L41+20
	ldr	r1, .L41+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	state
	.word	DMANow
	.word	bolt_instructionsPal
	.word	9488
	.word	bolt_instructionsTiles
	.word	100696064
	.word	bolt_instructionsMap
	.word	shield_instructionsPal
	.word	9168
	.word	shield_instructionsTiles
	.word	shield_instructionsMap
	.word	levitate_instructionsPal
	.word	9008
	.word	levitate_instructionsTiles
	.word	levitate_instructionsMap
	.size	goToNewSpell, .-goToNewSpell
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L55
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L44
	ldr	r2, .L55+4
	ldrh	r0, [r2]
	ands	r5, r0, #8
	beq	.L53
.L44:
	tst	r3, #4
	beq	.L43
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L54
.L43:
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L53:
	ldr	r3, .L55+8
	mov	lr, pc
	bx	r3
	mov	r0, r5
	bl	goToNewSpell
	ldrh	r3, [r4]
	b	.L44
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToNewEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToNewEnemy, %function
goToNewEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r4, #4096
	mov	lr, #7
	ldr	ip, .L64
	cmp	r0, #1
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	lr, [ip]
	beq	.L58
	cmp	r0, #2
	beq	.L59
	cmp	r0, r1
	beq	.L63
	ldr	r4, .L64+4
	mov	r0, #3
	ldr	r1, .L64+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L64+12
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+20
	ldr	r1, .L64+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	ldr	r4, .L64+4
	mov	r0, #3
	ldr	r1, .L64+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L64+32
	ldr	r1, .L64+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+20
	ldr	r1, .L64+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L63:
	ldr	r4, .L64+4
	mov	r0, #3
	ldr	r1, .L64+44
	mov	lr, pc
	bx	r4
	mov	r3, #8896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+20
	ldr	r1, .L64+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L59:
	ldr	r4, .L64+4
	mov	r0, #3
	ldr	r1, .L64+56
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L64+60
	ldr	r1, .L64+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+20
	ldr	r1, .L64+68
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	state
	.word	DMANow
	.word	bolt_instructionsPal
	.word	9488
	.word	bolt_instructionsTiles
	.word	100696064
	.word	bolt_instructionsMap
	.word	shooter_instructionsPal
	.word	9504
	.word	shooter_instructionsTiles
	.word	shooter_instructionsMap
	.word	walker_instructionsPal
	.word	walker_instructionsTiles
	.word	walker_instructionsMap
	.word	wraith_instructionsPal
	.word	9552
	.word	wraith_instructionsTiles
	.word	wraith_instructionsMap
	.size	goToNewEnemy, .-goToNewEnemy
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #4096
	push	{r4, lr}
	mov	lr, #2
	ldr	ip, .L68
	strh	r3, [r2]	@ movhi
	ldr	r4, .L68+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L68+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L68+12
	mov	lr, pc
	bx	r4
	mov	r3, #10240
	mov	r0, #3
	ldr	r2, .L68+16
	ldr	r1, .L68+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	state
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100696064
	.word	backgroundMap
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	newSpell.part.0, %function
newSpell.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L72
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L73:
	.align	2
.L72:
	.word	buttons
	.size	newSpell.part.0, .-newSpell.part.0
	.set	newEnemy.part.0,newSpell.part.0
	.align	2
	.global	newSpell
	.syntax unified
	.arm
	.fpu softvfp
	.type	newSpell, %function
newSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L76
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	newSpell.part.0
.L77:
	.align	2
.L76:
	.word	oldButtons
	.size	newSpell, .-newSpell
	.align	2
	.global	newEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	newEnemy, %function
newEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	newSpell
	.size	newEnemy, .-newEnemy
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r3, #0
	mov	r6, #256
	mov	r0, #4096
	mov	r4, #3
	ldr	r1, .L81
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r6, [r2]	@ movhi
	ldr	r3, .L81+4
	strh	r0, [r2, #8]	@ movhi
	ldr	r5, .L81+8
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	mov	r3, r6
	mov	r0, r4
	mov	r2, #83886080
	ldr	r1, .L81+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L81+16
	ldr	r1, .L81+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L81+24
	ldr	r1, .L81+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	state
	.word	pauseSound
	.word	DMANow
	.word	pausedPal
	.word	8016
	.word	pausedTiles
	.word	100696064
	.word	pausedMap
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L84:
	push	{r4, lr}
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L90:
	b	goToPause
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L105
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L94
	ldr	r2, .L105+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L103
.L94:
	tst	r3, #4
	beq	.L93
	ldr	r3, .L105+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L104
.L93:
	pop	{r4, lr}
	bx	lr
.L104:
	pop	{r4, lr}
	b	goToStart
.L103:
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L94
.L106:
	.align	2
.L105:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L126
	ldr	fp, .L126+4
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L126+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L126+16
	ldr	r9, .L126+20
	ldr	r8, .L126+24
	ldr	r7, .L126+28
	ldr	r4, .L126+32
.L109:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L120
.L111:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L110
.L110:
	tst	r0, #8
	beq	.L120
	ldr	r3, .L126+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L112:
	tst	r0, #8
	beq	.L120
	ldr	r3, .L126+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L113:
	tst	r0, #8
	beq	.L120
	ldr	r3, .L126+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L114:
	tst	r0, #8
	beq	.L120
	ldr	r3, .L126+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L115:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L116:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L117:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L118:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L109
.L120:
	mov	r0, r3
	b	.L109
.L127:
	.align	2
.L126:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	newEnemy.part.0
	.word	newSpell.part.0
	.word	lose.part.0
	.word	win.part.0
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r0, #4096
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L130
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L130+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L130+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L130+12
	ldr	r1, .L130+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L130+20
	ldr	r1, .L130+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	state
	.word	DMANow
	.word	winPal
	.word	8400
	.word	winTiles
	.word	100696064
	.word	winMap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L134
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L135:
	.align	2
.L134:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r0, #4096
	push	{r4, lr}
	mov	lr, #5
	ldr	ip, .L138
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L138+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L138+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L138+12
	ldr	r1, .L138+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L138+20
	ldr	r1, .L138+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	state
	.word	DMANow
	.word	losePal
	.word	8240
	.word	loseTiles
	.word	100696064
	.word	loseMap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cheatEnabled,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
