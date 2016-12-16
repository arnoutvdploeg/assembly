section .data
	num1:	equ 100
	num2:	equ 50
	msg:	db "correct", 7
	msg2:	db "incorrect", 9
	newline: db 10

section .text

global _start:
_start:
	mov 	rax, num1
	mov 	rbx, num2
	add		rax, rbx
	cmp		rax, 150
	jne 	.incorrect
	jmp 	.correct

.correct:
	mov		rax,1
	mov		rdi,1
	mov		rsi,msg
	mov		rdx, 7
	syscall
	jmp		.exit

.incorrect:
	mov		rax,1
	mov		rdi,1
	mov		rsi,msg2
	mov		rdx,9
	syscall
	jmp		.exit

.exit:
	mov		rax,1
	mov		rdi,1
	mov		rsi, newline
	mov		rdx,9
	syscall
	mov		rax, 60
    mov    	rdi, 0
    syscall
