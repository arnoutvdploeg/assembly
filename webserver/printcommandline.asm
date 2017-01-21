SECTION .data					; data section
msg:	db "Hello world!", 10 	; put "Hello world into msg" + 10 (CR)
len:	equ $-msg				; get length of string in the message

SECTION .bss
SCORE:  resb 11   ; 10 chars + zero terminator
SCORELEN: equ $-SCORE

SECTION .text
	global _start

_start:
		mov  rax, 0         ; READ (0)
    	mov  rdi, 0         ; stdin
    	mov  rsi, SCORE     ; buffer
   		mov  rdx, SCORELEN  ; length
    	syscall

		mov rdx,	SCORELEN
		mov rsi,	SCORE
		mov rdi, 	1	
		mov rax,	1		
		syscall
		
		mov rdx,	len
		mov rsi,	msg
		mov rdi, 	1	
		mov rax,	1		
		syscall

		mov rax,	60
		mov rdi,	0
		syscall