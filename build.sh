#!/bin/bash
# Professional build script for ARM targets

# Toolchain definitions
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy

echo "Compiling for ARMv7-A Architecture..."

$AS -g startup.s -o startup.o
$CC -c -g -O0 -mcpu=cortex-a15 system_init.c -o system_init.o
$LD -T bootloader2.ld startup.o system_init.o -o kernel.elf
$OBJCOPY -O binary kernel.elf kernel.bin

echo "Build Complete: kernel.bin generated."
