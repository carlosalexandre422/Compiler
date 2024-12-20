.section .text
.globl _start

_start:
    # (8 * 11)
    mov $8, %rax
    imul $11, %rax

    # Salva resultado parcial em RBX
    mov %rax, %rbx

    # (12 * 9)
    mov $12, %rax
    imul $9, %rax

    # Subtração: (8 * 11) - (12 * 9)
    sub %rax, %rbx

    # (112 - 19)
    mov $112, %rax
    sub $19, %rax

    # Soma total
    add %rbx, %rax

    call imprime_num
    call sair

.include "runtime.s"

