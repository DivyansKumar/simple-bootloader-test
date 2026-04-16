# ARM-SoC-Hardware-Initializer: Bare-Metal Bootloader & UART Driver

A low-level systems project focused on the **ARMv7-A architecture**, demonstrating the fundamental sequence of hardware initialization, memory mapping, and peripheral driver development without an underlying Operating System.

---

## 🎯 Project Overview
This project simulates the **First Stage Bootloader (FSBL)** process for an ARM-based System-on-Chip (SoC). Developed on an **Apple M3 (ARMv8-A)** host and targeting an emulated **Cortex-A15**, it serves as a proof-of-concept for:
* **Startup Code:** Initializing CPU state, stack pointers, and vector tables.
* **Linker Scripts:** Defining custom memory layouts for Flash and RAM.
* **Peripheral Drivers:** Developing a polled UART driver via Direct Register Access (Memory-Mapped I/O).

## 🛠 Technical Requirements & Environment
* **Host OS:** macOS (Darwin/ARM64) or Ubuntu 20.04 LTS
* **Architecture:** ARMv7-A (Target), ARMv8-A (Development Host)
* **Target SoC:** VersatilePB (Emulated Cortex-A15)
* **Toolchain:** `arm-none-eabi` (Bare-metal GNU Toolchain)
* **Emulator:** QEMU (System Emulation Mode)

## 📁 Key Components
* **`startup.s`**: The entry point. Written in ARM Assembly to handle the reset vector, initialize the stack pointer (`sp`), and branch to the C runtime.
* **`bootloader2.ld`**: A custom Linker Script that maps code sections (`.text`) to Read-Only memory and data sections (`.data`, `.bss`) to RAM, ensuring the binary matches the SoC’s memory map.
* **`bootloader2.c`**: The "Kernel" logic. Implements a polled **UART driver** by writing directly to the `UART0` data register at base address `0x101f1000`.

## 🚀 Getting Started

### 1. Install Toolchain (macOS M3)
Since this project is developed on an ARM-based Mac, use Homebrew to install the cross-compiler:
```bash
brew install --cask gcc-arm-embedded
brew install qemu
