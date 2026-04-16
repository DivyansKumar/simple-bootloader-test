/* * system_init.c - Core initialization and UART driver logic
 * Developer: Divyanshu Kumar 
 */

#include <stdint.h>

// UART0 Register for VersatilePB SoC
volatile uint32_t* const UART0_DR = (uint32_t*)0x101f1000;

// Polled UART implementation: Writes a single character to the Data Register
void uart_putc(char c) {
    *UART0_DR = (uint32_t)c;
}

// Higher-level string function for console output
void uart_puts(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

// Interview Gold: A function to print hex addresses for debugging
void uart_puthex(uint32_t d) {
    const char hex[] = "0123456789ABCDEF";
    for (int i = 28; i >= 0; i -= 4) {
        uart_putc(hex[(d >> i) & 0xF]);
    }
}

void system_init(void) {
    uart_puts("\r\n--- ARM SoC Initializer Booting ---\r\n");
    uart_puts("Kernel Load Address: 0x");
    uart_puthex(0x00000000); // Proves you understand the memory map
    uart_puts("\r\nSystem Ready.\r\n");
}
