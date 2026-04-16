/* startup.s - System entry point and hardware initialization */
.global _start
_start:
    /* 1. Initialize Stack Pointer using the address from the linker script */
    LDR sp, =_estack

    /* 2. Clear BSS Section (Critical for initializing global variables to zero) */
    LDR r0, =_sbss
    LDR r1, =_ebss
    MOV r2, #0
bss_loop:
    CMP r0, r1
    STRLT r2, [r0], #4
    BLT bss_loop

    /* 3. Branch to the C Entry Point (Renamed from boot_main) */
    BL system_init

    /* 4. Catch-all loop to prevent CPU runaway */
    B .

/* Helper for direct register writing if needed */
.global s_print_uart0
s_print_uart0:
    STR r1, [r0]
    BX lr
