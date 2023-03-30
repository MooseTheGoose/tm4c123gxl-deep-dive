#!/bin/sh

BINNAME="blinky"
CFLAGS="-Wl,-T../tm4c123gxl.ld -ffreestanding -nostdlib -mthumb"
PREFIX="arm-none-eabi-"
CC=$PREFIX"gcc"
OBJCOPY=$PREFIX"objcopy"

$CC $CFLAGS bootloader.s main.c -o $BINNAME.elf
$OBJCOPY -O binary $BINNAME.elf $BINNAME.out
