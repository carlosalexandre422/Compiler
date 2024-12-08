
.section .text
.globl _start

_start:
    mov $1, %rax
    call imprime_num
    call sair

.include "runtime.s"
