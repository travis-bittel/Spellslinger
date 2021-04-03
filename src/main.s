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
	push	{r4, lr}
	ldr	lr, .L4
	strh	ip, [r2, #16]	@ movhi
	ldr	r4, .L4+4
	strh	ip, [r2, #18]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r1, .L4+8
	mov	r2, #83886080
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r3, #1008
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
	mov	r1, #20480
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
	mov	r3, #32
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
	.word	playerPal
	.word	100728832
	.word	playerTiles
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
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L16
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L16+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r1, .L16+8
	mov	r2, #83886080
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
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	push	{r4, lr}
	mov	lr, #2
	ldr	ip, .L27
	strh	r2, [r3]	@ movhi
	ldr	r4, .L27+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L27+12
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	state
	.word	DMANow
	.word	backgroundPal
	.word	8784
	.word	backgroundTiles
	.word	100696064
	.word	backgroundMap
	.size	goToGame, .-goToGame
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
	push	{r4, lr}
	ldr	r4, .L41
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L39:
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
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
	mov	r4, #3
	mov	r1, #0
	mov	r3, #256
	ldr	ip, .L45
	strh	r1, [r2, #16]	@ movhi
	ldr	r5, .L45+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, r4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L45+8
	mov	r2, #83886080
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1984
	mov	r2, #100663296
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L45+16
	ldr	r1, .L45+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	state
	.word	DMANow
	.word	pausedPal
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
	ldr	r4, .L59
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L48
	ldr	r2, .L59+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L57
.L48:
	tst	r3, #4
	beq	.L47
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L58
.L47:
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToStart
.L57:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L48
.L60:
	.align	2
.L59:
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
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L63
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L63+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r1, .L63+8
	mov	r2, #83886080
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1392
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L63+16
	ldr	r1, .L63+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	state
	.word	DMANow
	.word	winPal
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
	ldr	r3, .L78
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r2, .L78+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L76
.L66:
	tst	r3, #4
	beq	.L67
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L77
.L67:
	push	{r4, lr}
	ldr	r3, .L78+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L77:
	b	goToWin
.L76:
	b	goToPause
.L79:
	.align	2
.L78:
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
	ldr	r6, .L98
	ldr	r10, .L98+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L98+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L98+16
	ldr	r8, .L98+20
	ldr	r7, .L98+24
	ldr	fp, .L98+28
	ldr	r4, .L98+32
.L82:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L91
.L84:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L83
.L83:
	tst	r0, #8
	beq	.L91
	ldr	r3, .L98+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L85:
	tst	r0, #8
	beq	.L91
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L86:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L87:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L88:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L89:
	tst	r0, #8
	beq	.L91
	tst	r3, #8
	beq	.L97
.L91:
	mov	r0, r3
	b	.L82
.L97:
	ldr	r3, .L98+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L99:
	.align	2
.L98:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	instructions
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
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
	ldr	r3, .L102
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L103:
	.align	2
.L102:
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
	push	{r4, lr}
	mov	lr, #5
	ldr	ip, .L106
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L106+4
	strh	r1, [r2, #18]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r1, .L106+8
	mov	r2, #83886080
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L106+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L106+16
	ldr	r1, .L106+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	state
	.word	DMANow
	.word	losePal
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
