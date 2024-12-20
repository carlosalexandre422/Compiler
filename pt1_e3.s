.section .text
.globl _start

_start:
    # (72 - 101)
    mov $72, %rax
    sub $101, %rax

    # Multiplicação com 4
    imul $4, %rax

    # Salva resultado parcial em RBX
    mov %rax, %rbx

    # (14 * 77)
    mov $14, %rax
    imul $77, %rax

    # Soma total
    add %rbx, %rax

    call imprime_num
    call sair

.include "runtime.s"