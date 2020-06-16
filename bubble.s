	AREA SIMPLE_PROG,CODE,READONLY
	
__main PROC
	EXPORT __main
	IMPORT __heap_base

	movs R1, #0x01
	movs R2, #0x02
	
	movs r0, #0xff
	ldr r1, = __heap_base
mem_fill
	STRB r0, [r1]
	adds r1, r1, #+1
	subs r0, r0,#1
	BPL mem_fill 
	;;;;;;;;;;;;;;
	
	ldr r1, =__heap_base
	
big_loop
	movs r2, #0x00 		;offset
	movs r5, #0x00		;n of swaps
small_loop	
	ldrb r3, [r1,r2] 	;1st number
	adds r2, r2,#0x01
	ldrb r4, [r1,r2] 	;2nd number
	cmp r3, r4
	
	blt after_swap
	strb r3, [r1,r2]
	subs r2, #0x01
	strb r4, [r1,r2]
	adds r2, #0x01
	adds r5, #0x01
	
after_swap
	cmp r2, #0xff
	bne small_loop
	cmp r5, #0x00
	bne big_loop
	
	BX R14
	ENDP
	END
		