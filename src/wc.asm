format elf64 executable
entry main

include 'lib/io.asm'
include 'lib/file.asm'

buffer:
    times 256 db 0

filedesc:
    db 0

count:
    times 8 db 0
    db 0ah

main:
    mov r10, 0

    mov rax, [rsp + 16]
    call file_open_r

    mov [filedesc], al

read_next:
    mov rax, 0
    mov rdi, [filedesc]
    mov rsi, buffer
    mov rdx, 256
    syscall

    mov r11, rax

    mov rbx, -1
count_lines:
    inc rbx
    cmp byte [buffer+rbx], 32
    jne skip
    inc r10
skip_cont_space:
    mov r13, rbx
    dec r13
    cmp byte [buffer+r13], 32
    jne skip
    dec r10
    inc rbx
skip:
    cmp rbx, 255
    jne count_lines

    cmp r11, 256
    je read_next

    mov rax, r10
    mov rbx, 10
    mov r12, 0
conv:
    cmp rax, 10
    jle print
    xor rdx,rdx
    div rbx
    add rdx, '0'
    mov byte [count+r12], dl
    inc r12
    jmp conv

print:
    add rax, '0'
    mov byte [count+r12], al

    mov rax, count
    mov rdi, 9
    call std_write

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    hlt
