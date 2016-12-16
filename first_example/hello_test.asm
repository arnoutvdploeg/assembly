section .data
    msg db      "hello, world!"
    msg2 db     10  ; new line number 10
section .text
    global _start
_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg    ; print hello world
    mov     rdx, 13
    syscall
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg2   ;print newline
    mov     rdx, 1
    syscall 
    mov    rax, 60
    mov    rdi, 0
    syscall