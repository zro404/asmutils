format elf64 executable
entry main

include 'lib/file.asm'

main:
    mov rax, [rsp+16]
    call file_open_r

    mov rsi, rax
    mov rdi, 1
    mov rdx, 0
    mov r10, 256
    mov rax, 40
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall
