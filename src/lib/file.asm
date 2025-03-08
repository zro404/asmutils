;; rax -> const char* filename
file_open_r:
    mov rdi, rax
    mov rax, 2
    mov rsi, 0
    mov rdx, 0
    syscall
    ret
