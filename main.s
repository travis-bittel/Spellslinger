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
	mov	lr, #4096
	mov	r4, #3
	mov	r1, #0
	mov	r3, #256
	ldr	ip, .L81
	strh	r1, [r2, #16]	@ movhi
	ldr	r5, .L81+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, r4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L81+8
	strh	lr, [r2, #8]	@ movhi
	mov	r2, #83886080
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L81+12
	ldr	r1, .L81+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L81+20
	ldr	r1, .L81+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
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
	ldr	r4, .L95
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L84
	ldr	r2, .L95+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L93
.L84:
	tst	r3, #4
	beq	.L83
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L94
.L83:
	pop	{r4, lr}
	bx	lr
.L94:
	pop	{r4, lr}
	b	goToStart
.L93:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L84
.L96:
	.align	2
.L95:
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
	ldr	ip, .L99
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L99+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L99+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L99+12
	ldr	r1, .L99+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L99+20
	ldr	r1, .L99+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
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
	ldr	r3, .L114
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L102
	ldr	r2, .L114+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L112
.L102:
	tst	r3, #4
	beq	.L103
	ldr	r3, .L114+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L113
.L103:
	push	{r4, lr}
	ldr	r3, .L114+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L113:
	b	goToWin
.L112:
	b	goToPause
.L115:
	.align	2
.L114:
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
	push	{r4, r7, fp, lr}
	ldr	r6, .L135
	ldr	fp, .L135+4
	ldr	r3, .L135+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L135+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L135+16
	ldr	r9, .L135+20
	ldr	r8, .L135+24
	ldr	r7, .L135+28
	ldr	r4, .L135+32
.L118:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L129
.L120:
	.word	.L127
	.word	.L126
	.word	.L125
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L119
.L119:
	tst	r0, #8
	beq	.L129
	ldr	r3, .L135+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L121:
	tst	r0, #8
	beq	.L129
	ldr	r3, .L135+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L122:
	tst	r0, #8
	beq	.L129
	ldr	r3, .L135+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L123:
	tst	r0, #8
	beq	.L129
	ldr	r3, .L135+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L124:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L125:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L126:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L127:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L118
.L129:
	mov	r0, r3
	b	.L118
.L136:
	.align	2
.L135:
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
	ldr	r3, .L139
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L140:
	.align	2
.L139:
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
	ldr	ip, .L143
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L143+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L143+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L143+12
	ldr	r1, .L143+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L143+20
	ldr	r1, .L143+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
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
	.ident	"GCC: (devkitARM release 53) 9.1.0"
