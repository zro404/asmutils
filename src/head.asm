format elf64 executable
entry main

buffer:
    times 256 db 0

filename: db 0

main:
    mov r10, 10

    mov rax, 2
    mov rdi, [rsp + 16]
    mov rsi, 0
    mov rdx, 0
    syscall

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
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov r9, rbx
    inc r9
    mov rdx, r9
    syscall


    cmp r11, 256
    jne exit

    cmp r10, 0
    jne read_next

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    hlt
