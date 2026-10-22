# Half-Precision Floating-Point Adder

A term project implementing a Half-Precision IEEE 754 Floating-Point Adder Calculator using Intel Quartus Prime, paired with a physical KeyPad and HexBoard for input and display.

## 🚀 Overview
The project is split into two main components:
1. **Arithmetic Module (`HalfPrecisionFloatingPointAddSub`):** Handles the core 16-bit binary floating-point addition, managing logical shifting, increments, and IEEE 754 formatting for inputs A and B.
2. **Hardware Interface:** Utilizes a KeyPad for sequential input loading and a HexBoard display to show the resulting hexadecimal output values (derived from adjusted binary inputs and outputs).

### Key Controls
* **Key 2, 3, & 4:** Used to load inputs and results sequentially.
* **Key 0 (Reset):** Clears current input and output values to prepare for the next calculation.

---

## 📂 Project Structure
- `/src` - Verilog/VHDL source files
- `/quartus` - Intel Quartus Prime project files

---

## 🚧 Future Work & In-Progress Features
The following features were partially explored during development and are planned for future updates:
* Subtraction operation support.
* Real-time overflow and underflow detection and display flags.
