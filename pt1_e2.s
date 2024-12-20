.section .text
.globl _start

_start:
    # Numerador: (7 * 6 * 5)
    mov $7, %rax
    imul $6, %rax
    imul $5, %rax

    # Denominador: (4 * 3 * 2 * 1)
    mov $4, %rbx
    imul $3, %rbx
    imul $2, %rbx
    imul $1, %rbx

    # Divisão
    cqo                  # Extende RAX para RDX:RAX
    idiv %rbx            # RAX = RAX / RBX

    call imprime_num
    call sair

.include "runtime.s"