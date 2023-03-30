### Begin Interrupt Table ###

.section .isr_vector
.extern main
ISRVector:
# Reset SP
    .word _stack_end
# Reset PC
    .word _start
# NMI
    .word InterruptStub 
# Hard Fault
    .word InterruptStub 
# Memory Management Exception
    .word InterruptStub 
# Bus Fault
    .word InterruptStub 
# Usage Fault
    .word InterruptStub
# Reserved
    .word 0 
    .word 0
    .word 0
    .word 0
# SVCall
    .word InterruptStub
# Debug Monitor
    .word InterruptStub
# Reserved
    .word 0
# PendSV
    .word InterruptStub
# SysTick
    .word InterruptStub
# Interrupts 0 - 139
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub
    .word InterruptStub

### End Interrupt Table ###

.section .text
.globl _start
.thumb_func
InterruptStub:
    b InterruptStub

.thumb_func
_start:
    ldr r0,=_data
    ldr r1,=_ldata
    ldr r2,=_edata
    sub r2, r0
    bl BLmemcpy
    ldr r0,=_bss
    mov r1,#0
    ldr r2,=_ebss
    sub r2,r0
    bl BLmemset
    b main

.globl BLmemcpy
.globl BLmemset
.thumb_func
BLmemcpy:
    sub r2,#1
    bcs BLmemcpyDone
BLmemcpyLoop:
    ldr r3,[r0,r2]
    str r3,[r1,r2]
    sub r2,#1
    bcc BLmemcpyLoop
BLmemcpyDone:
    bx lr

.thumb_func
BLmemset:
    sub r2,#1
    bcs BLmemsetDone
BLmemsetLoop:
    str r1,[r0,r2]
    sub r2,#1
    bcc BLmemsetLoop
BLmemsetDone:
    bx lr

.section .data
testbyte:
    .byte 0

.section .bss

.lcomm testbyte2, 1
