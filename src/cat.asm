format elf64 executable
entry main

main:
    mov rax, 2
    mov rdi, [rsp+16]
    mov rsi, 0
    mov rdx, 0
    syscall

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
