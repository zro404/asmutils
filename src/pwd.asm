format elf64 executable
entry main

buffer:
    times 256 db 0
    db 0ah

main:
    mov rax, 79
    mov rdi, buffer
    mov rsi, 256
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 257
    syscall

exit:
    mov rax, 231
    mov rdi, 0
    syscall
