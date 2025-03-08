format elf64 executable
entry main

include 'lib/io.asm'

buffer:
    times 256 db 0
    db 0ah

main:
    mov rax, 79
    mov rdi, buffer
    mov rsi, 256
    syscall

    mov rax, buffer
    mov rdi, 257
    call std_write

exit:
    mov rax, 231
    mov rdi, 0
    syscall
