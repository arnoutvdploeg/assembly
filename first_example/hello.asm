section .data
    msg db      "hello, world!"
    msg2 db     10
section .text
    global _start
_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 13
    syscall
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg2
    mov     rdx, 1
    syscall 
    mov    rax, 60
    mov    rdi, 0
    syscall