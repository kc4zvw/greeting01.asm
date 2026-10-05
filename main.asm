; Hello World in x86-64 Assembly
; x86-64 Linux, NASM syntax. No libc: entry point is _start and you must
; exit with the SYS_exit syscall rather than returning.
;
; Syscall convention: rax = number, args in rdi, rsi, rdx, r10, r8, r9.
;   read  = 0    write = 1    exit = 60

section .bss
    buf     resb 4096            ; stdin lands here

section .text
    global _start

_start:
    ; read(0, buf, 4096) -> rax = bytes read
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, buf
    mov     rdx, 4096
    syscall

    ; TODO: process the input in buf. rax holds the byte count.
    ;       Leave the bytes to print in buf and their length in rdx.
    mov     rdx, rax

    ; write(1, buf, rdx)
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, buf
    syscall

    ; exit(0)
    mov     rax, 60
    xor     rdi, rdi
    syscall
