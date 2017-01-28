
%macro print 1	; print command
	mov rax, %1
	mov [printSpace], rax
	mov rbx, 0
%%printLoop:
	mov cl, [rax]
	cmp cl, 0
	je %%endPrintLoop
	inc rbx
	inc rax
	jmp %%printLoop
%%endPrintLoop:
	mov rax, 1
	mov rdi, 0
	mov rsi, [printSpace]
	mov rdx, rbx
	syscall
%endmacro

%macro exit 0 ; exit programme
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro