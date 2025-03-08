;; rax -> char*
;; rdi -> len
std_write:
    mov rsi, rax
    mov rdx, rdi
    mov rax, 1
    mov rdi, 1
    syscall
    ret
