SECTION .data					; data section
msg:	db "Hello world!", 10 	; put "Hello world into msg" + 10 (CR)
len:	equ $-msg				; get length of string in the message
filename: db "sometext"			;
fd dw 0

SYS_READ	equ	0
SYS_WRITE   equ 1
SYS_OPEN    equ 2
SYS_EXIT	equ 60

STDIN       equ 0
STDOUT      equ 1


O_RDONLY	equ	0

SECTION .bss
SCORE:  resb 100   ; 100 chars + zero terminator
text:  resb 101   ; 100 chars + zero terminator
SCORELEN: equ $-SCORE


SECTION .text
	global _start

_start:
		
		mov  rax, SYS_READ  
    	mov  rdi, STDIN 
    	mov  rsi, SCORE
   		mov  rdx, SCORELEN
    	syscall
		
		mov rax,	SYS_WRITE		
		mov rdx,	SCORELEN
		mov rsi,	SCORE
		mov rdi, 	STDOUT	
		syscall


		mov rax,    SYS_OPEN 
		mov rdi, 	filename
		mov rsi,	O_RDONLY
		mov rdx,	0
		syscall
		mov [fd], 	rax

		mov rdi,	[fd]
		mov rax,	SYS_READ
		mov rsi,	text
		mov rdx,	100
		syscall

		mov rax,	SYS_WRITE
		mov rdx,	100
		mov rsi,	text
		mov rdi,	STDOUT
		syscall

		mov rax,	SYS_EXIT
		mov rdi,	0
		syscall