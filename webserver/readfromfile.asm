%include "macros.inc" 
%include "syscalls.inc"
section .data
	filename db "sometext",0

section .bss
	text resb 18
	printSpace resb 8

section .text
	global _start



_start:
	mov rax, SYS_OPEN
	mov rdi, filename
	mov rsi, 0
	mov rdx, 0
	syscall

	push rax
	mov rdi, rax
	mov rax, 0 
	mov rsi, text
	mov rdx, 17
	syscall

	mov rax, SYS_CLOSE
	pop rdi
	syscall

	print text
	exit
