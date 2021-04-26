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
	mov	ip, #0
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #4096
	push	{r4, lr}
	ldr	lr, .L4
	strh	ip, [r2, #16]	@ movhi
	ldr	r4, .L4+4
	strh	ip, [r2, #18]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+8
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r3, #8512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
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
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
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
	mov	r3, #2016
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
	@ link register save eliminated.
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
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
	ldr	ip, .L30
	cmp	r0, #1
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	lr, [ip]
	beq	.L26
	cmp	r0, #2
	beq	.L27
	ldr	r4, .L30+4
	mov	r0, #3
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L30+12
	ldr	r1, .L30+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+20
	ldr	r1, .L30+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	ldr	r4, .L30+4
	mov	r0, #3
	ldr	r1, .L30+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L30+32
	ldr	r1, .L30+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+20
	ldr	r1, .L30+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L27:
	ldr	r4, .L30+4
	mov	r0, #3
	ldr	r1, .L30+44
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L30+48
	ldr	r1, .L30+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+20
	ldr	r1, .L30+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r4, .L44
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L44+4
	ldrh	r0, [r2]
	ands	r5, r0, #8
	beq	.L42
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L43
.L32:
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L42:
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	mov	r0, r5
	bl	goToNewSpell
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
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
	ldr	ip, .L53
	cmp	r0, #1
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	lr, [ip]
	beq	.L47
	cmp	r0, #2
	beq	.L48
	cmp	r0, r1
	beq	.L52
	ldr	r4, .L53+4
	mov	r0, #3
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L53+12
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+20
	ldr	r1, .L53+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r4, .L53+4
	mov	r0, #3
	ldr	r1, .L53+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L53+32
	ldr	r1, .L53+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+20
	ldr	r1, .L53+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L52:
	ldr	r4, .L53+4
	mov	r0, #3
	ldr	r1, .L53+44
	mov	lr, pc
	bx	r4
	mov	r3, #8896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L53+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+20
	ldr	r1, .L53+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r4, .L53+4
	mov	r0, #3
	ldr	r1, .L53+56
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L53+60
	ldr	r1, .L53+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+20
	ldr	r1, .L53+68
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	ip, .L57
	strh	r3, [r2]	@ movhi
	ldr	r4, .L57+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	r3, #10240
	mov	r0, #3
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r3, .L61
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L62:
	.align	2
.L61:
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
	ldr	r3, .L65
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	newSpell.part.0
.L66:
	.align	2
.L65:
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
	mov	lr, #4096
	mov	r4, #3
	mov	r1, #0
	mov	r3, #256
	ldr	ip, .L70
	strh	r1, [r2, #16]	@ movhi
	ldr	r5, .L70+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, r4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L70+8
	strh	lr, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L70+12
	ldr	r1, .L70+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L70+20
	ldr	r1, .L70+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	state
	.word	DMANow
	.word	pausedPal
	.word	8016
	.word	pausedTiles
	.word	100696064
	.word	pausedMap
	.size	goToPause, .-goToPause
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
	ldr	r4, .L84
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L73
	ldr	r2, .L84+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L82
.L73:
	tst	r3, #4
	beq	.L72
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L83
.L72:
	pop	{r4, lr}
	bx	lr
.L83:
	pop	{r4, lr}
	b	goToStart
.L82:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L73
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
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
	ldr	ip, .L88
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L88+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L88+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L88+12
	ldr	r1, .L88+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+20
	ldr	r1, .L88+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	state
	.word	DMANow
	.word	winPal
	.word	8400
	.word	winTiles
	.word	100696064
	.word	winMap
	.size	goToWin, .-goToWin
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
	ldr	r3, .L103
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
	ldr	r2, .L103+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L101
.L91:
	tst	r3, #4
	beq	.L92
	ldr	r3, .L103+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L102
.L92:
	push	{r4, lr}
	ldr	r3, .L103+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L102:
	b	goToWin
.L101:
	b	goToPause
.L104:
	.align	2
.L103:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.size	game, .-game
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
	ldr	r6, .L127
	ldr	r10, .L127+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L127+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L127+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L127+16
	ldr	r8, .L127+20
	ldr	r7, .L127+24
	ldr	fp, .L127+28
	ldr	r4, .L127+32
.L107:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L118
.L109:
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L108
.L108:
	tst	r0, #8
	beq	.L118
	ldr	r3, .L127+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L110:
	tst	r0, #8
	beq	.L118
	ldr	r3, .L127+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L111:
	tst	r0, #8
	beq	.L118
	ldr	r3, .L127+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L112:
	tst	r0, #8
	beq	.L118
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L113:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L114:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L115:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L116:
	tst	r0, #8
	beq	.L118
	tst	r3, #8
	beq	.L126
.L118:
	mov	r0, r3
	b	.L107
.L126:
	ldr	r3, .L127+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L107
.L128:
	.align	2
.L127:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	instructions
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	newEnemy.part.0
	.word	newSpell.part.0
	.word	lose.part.0
	.word	goToInstructions
	.size	main, .-main
	.text
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
	ldr	r3, .L131
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L132:
	.align	2
.L131:
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
	ldr	ip, .L135
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L135+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L135+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L135+12
	ldr	r1, .L135+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L135+20
	ldr	r1, .L135+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L136:
	.align	2
.L135:
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
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
