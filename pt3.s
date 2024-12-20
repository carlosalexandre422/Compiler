.section .text
.globl _start
.include "runtime.s"

_start:
    # (512 * 65)
    mov $512, %rax
    imul $65, %rax

    # Salva resultado parcial em RBX
    mov %rax, %rbx

    # (5657 * 23)
    mov $5657, %rax
    imul $23, %rax

    # Subtração
    sub %rax, %rbx

    # Move resultado final para RAX
    mov %rbx, %rax

    # vai retornar um erro "Segmentation fault (core dumped)" pois o resultado é um número negativo
    call imprime_num
    call sair
