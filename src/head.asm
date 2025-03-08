format elf64 executable
entry main

include 'lib/io.asm'
include 'lib/file.asm'

buffer:
    times 256 db 0

filename: db 0

main:
    mov r10, 10

    mov rax, [rsp + 16]
    call file_open_r

    mov [filename], rax

read_next:
    mov rax, 0
    mov rdi, [filename]
    mov rsi, buffer
    mov rdx, 256
    syscall

    mov r11, rax

    mov rbx, -1
count_lines:
    inc rbx
    cmp byte [buffer+rbx], 0Ah
    jne skip
    dec r10
    cmp r10, 0
    je print
skip:
    cmp rbx, 255
    jne count_lines

print:
    mov rax, buffer
    mov rdi, rbx
    inc rdi
    call std_write

    cmp r11, 256
    jne exit

    cmp r10, 0
    jne read_next

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    hlt
