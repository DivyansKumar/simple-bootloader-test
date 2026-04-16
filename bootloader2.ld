/* Linker script for ARM VersatilePB SoC */
ENTRY(_start)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 16K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 32K
}

SECTIONS
{
    .text : {
        . = ALIGN(4);     /* Ensures the CPU can fetch instructions efficiently */
        *(.vectors)
        *(.text*)
        *(.rodata*)
        . = ALIGN(4);
        _etext = .;
    } > ROM

    /* BSS must be cleared by the startup script */
    .bss (NOLOAD) : {
        _sbss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > RAM
}
