section .data
    num1 dq 512          ; Primeiro número
    num2 dq 65           ; Segundo número
    num3 dq 5657         ; Terceiro número
    num4 dq 23           ; Quarto número
    result dq 0          ; Resultado final

section .text
    global _start

_start:
    ; Multiplicação: 512 * 65
    mov rax, [num1]      ; rax = 512
    imul rax, [num2]     ; rax = rax * 65 (512 * 65)
    mov rbx, rax         ; rbx = 33.280 (armazenar resultado intermediário)

    ; Multiplicação: 5657 * 23
    mov rax, [num3]      ; rax = 5657
    imul rax, [num4]     ; rax = rax * 23 (5657 * 23)
    mov rcx, rax         ; rcx = 130.111 (armazenar resultado intermediário)

    ; Subtração: (512 * 65) - (5657 * 23)
    sub rbx, rcx         ; rbx = 33.280 - 130.111 (-96.831)

    ; Armazenar o resultado em 'result'
    mov [result], rbx

    ; Encerrar o programa
    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; código de saída 0
    syscall
