
  ###SELTEN-CPU

  The SELTEN CPU is a 19-bit processor, breaking away from the usual 8, 16, 32, or 64-bit designs. With its 19-bit architecture and casual design, SELTEN features a unique instruction set, multi-stage pipeline, optimized register file, and an ALU designed for efficient, high-performance computing across various applications.

<img width="748" alt="image" src="https://github.com/user-attachments/assets/cd10b2b6-d457-411e-a188-e44bc4ca1287">



<details>
  <summary>19-Bit CPU Architecture</summary>

  A 19-bit CPU architecture is an unconventional design that deviates from more standard bit-widths such as 8, 16, 32, or 64 bits, typically seen in most modern processors. This custom architecture addresses specific computational needs or experiments with unique instruction sets, memory management, or data processing capabilities.

![image](https://github.com/user-attachments/assets/ac01ae2b-3c7e-448e-b2c5-1e59e884d303)


  ## Key Components and Design Considerations
  
  ### 1. Word Size and Data Width
  - The 19-bit architecture processes data and instructions in 19-bit chunks. This unique word size affects everything from memory addressing to arithmetic operations.
  - Data registers, memory addresses, and buses are all 19 bits wide, allowing for representing numbers up to 2^19 - 1 (524,287 in decimal).
  
  ### 2. Instruction Set Architecture (ISA)
  - The ISA defines the set of instructions the CPU can execute. For a 19-bit CPU, the instructions would likely be 19 bits in length, enabling the encoding of various operations.
  - The instruction set may include standard operations such as arithmetic (ADD, SUB, MUL, DIV), logical operations (AND, OR, XOR), control flow (JUMP, BRANCH), and memory access (LOAD, STORE).
  - Custom instructions might be designed for specific tasks, such as Fast Fourier Transform (FFT) operations, encryption/decryption algorithms, or specialized bitwise manipulations.
  
  ### 3. Registers
  - The CPU features General-Purpose Registers (GPRs) that are 19 bits wide, allowing the storage of intermediate values during computation.
  - Depending on the design, there could be a varying number of registers (e.g., 8, 16, or more), each capable of holding 19-bit values.
  - Specialized registers such as a Program Counter (PC), Stack Pointer (SP), and Status Registers are designed to operate on 19-bit data.
  
  ### 4. Memory Addressing
  - With a 19-bit address bus, the CPU can directly address up to 524,288 memory locations. If each memory location is a byte (8 bits), this amounts to 512 KB of addressable memory.
  - If memory needs to exceed this, techniques such as bank switching or segmented memory addressing would be required.
  
  ### 5. Arithmetic Logic Unit (ALU)
  - The ALU is designed to perform arithmetic and logical operations on 19-bit data. Operations like addition, subtraction, multiplication, division, increment, and decrement are all performed on 19-bit operands.
  - The ALU also sets condition flags (such as zero, carry, or overflow) based on the results of operations.
  
  ### 6. Pipeline and Execution Stages
  - The CPU might incorporate a pipeline architecture to improve instruction throughput. Common pipeline stages could include Fetch, Decode, Execute, Memory Access, and Write Back.
  - Given the custom nature of the 19-bit architecture, the pipeline stages are carefully designed to handle 19-bit instructions and data efficiently.
  
  ### 7. Custom Features
  - The 19-bit architecture allows for flexibility in the design of custom instructions tailored to specific applications, such as digital signal processing (DSP), cryptography, or scientific computing.
  - This architecture might also be optimized for specific types of workloads that benefit from a 19-bit data width, such as those involving narrow bit-width calculations or specialized algorithms.
  
  ### 8. Memory Interface
  - The CPU interfaces with memory modules that can handle 19-bit data paths. This may involve custom memory designs or interfaces to handle non-standard word sizes.
  - Memory access instructions account for the unique word size, ensuring data is correctly aligned and accessed.
  
  ### 9. Control Unit
  - The control unit orchestrates the operations of the CPU, interpreting the 19-bit instructions and generating the necessary control signals to manage data flow, ALU operations, and memory access.
  
  ## Applications and Use Cases
  - A 19-bit CPU could be used in specialized embedded systems where the unique word size offers advantages in terms of power efficiency, speed, or simplicity.
  - It might also be employed in educational or experimental settings, where the goal is to explore novel CPU designs or develop custom processing units for niche applications.
  
  ## Challenges and Considerations
  - **Compatibility**: A 19-bit architecture is not compatible with standard software and tools, requiring custom development environments, compilers, and software.
  - **Design Complexity**: Designing a custom CPU with a non-standard word size involves significant challenges, particularly in ensuring efficient instruction encoding, memory management, and interfacing with other hardware components.
  - **Optimization**: The architecture needs careful optimization to balance performance, power consumption, and chip area, especially if used in embedded or specialized applications.
  
  In summary, a 19-bit CPU architecture represents a highly specialized and unconventional design choice, typically driven by specific computational needs or experimental purposes. It provides a unique opportunity to explore custom data processing, instruction sets, and hardware design challenges.

</details>

<details>
  <summary>Arithmetic Logic Unit (ALU)</summary>
  
 Arithmetic Logic Unit (ALU)

 <img width="445" alt="image" src="https://github.com/user-attachments/assets/b5352cb0-91f7-4264-94d5-414fc6db095a">


An Arithmetic Logic Unit (ALU) is a critical component of a CPU that performs arithmetic and logical operations on binary data. It takes input operands, processes them based on control signals, and produces a result.



The ALU in the provided Verilog code has the following features:

## Inputs:
- Two 19-bit operands.
- A 4-bit control signal to select the operation. 

## Outputs:
- A 19-bit result that holds the outcome of the operation.
- A 1-bit flag that indicates whether the result is zero.

<img width="755" alt="image" src="https://github.com/user-attachments/assets/ea7129a9-b769-4b4d-8882-f0e12416a7b0">


ADD, SUB, MUL, DIV, INC, DEC, AND, OR, XOR, NOT, Zero Flag Test


## Operations:
- Various arithmetic and logical operations, including addition, subtraction, multiplication, division, increment, decrement, AND, OR, XOR, and NOT, are defined using a case statement based on the control signal.

## Zero Flag:
- The code includes logic to set a flag based on whether the result is zero, which can be useful for conditional branching in programs.

The ALU is an essential component that enables the CPU to perform arithmetic and logical operations on data, which are fundamental to executing instructions and performing computations.

  

</details>



<details>
  <summary>ControlUnit</summary>

 CPU (Central Processing Unit), the Control Unit (CU) is a critical component responsible for directing the operations of the processor. It acts as the brain of the CPU, managing the execution of instructions and coordinating the activities of other components like the Arithmetic Logic Unit (ALU), registers, and memory.

<img width="743" alt="ControlUnit_Schematic" src="https://github.com/user-attachments/assets/4210fbd8-a5b3-4d4a-8234-cbefe5ec5989">




A clock signal (`clk`) is toggled every 5 nanoseconds to simulate the behavior of a system clock.

## Input Initialization:
All inputs to the `Datapath_Unit` are initialized to zero. This means no control signals are active at the beginning of the simulation.

Control Signals and ALU Operation Code

Control Signals:
These are signals that control the various operations within the CPU, such as memory access, ALU operations, and register operations. Examples include `jump`, `beq`, `bne`, `call`, `ret`, etc.

## ALU Operation Code (`alu_op`):

Simple PC Increment:
The testbench first waits for 10 nanoseconds and checks if the program counter (`pc_current`) increments normally.

Call:
The `call` signal is activated for 10 nanoseconds to simulate jumping to a subroutine, then deactivated to see how the PC is updated.

Return:
The `ret` signal is activated to simulate returning from a subroutine.

Jump:
The `jump` signal is activated to test an unconditional jump.

Branch if Equal (BEQ):
The `beq` signal is activated to simulate a branch if equal condition.

Branch if Not Equal (BNE):
The `bne` signal is activated to simulate a branch if not equal condition.

<img width="740" alt="ControlUnit_tb" src="https://github.com/user-attachments/assets/5efee1e1-f980-46c1-8a63-0d1a69566b89">


</details>

<details>
  <summary>Memory Interface Unit</summary>

The **Memory Interface Unit (MIU)** is essential in handling **Store (ST)** and **Load (LD)** operations in a processor. It ensures that data is accurately and efficiently transferred between the CPU and memory during these operations. For a **Load (LD)** operation, the MIU retrieves data from a specified memory address and delivers it to the CPU. In a **Store (ST)** operation, the MIU takes data from the CPU and writes it to a specified memory address. The MIU manages the address translation, data transfer, and timing to ensure that these memory operations are performed correctly and without conflicts.


<img width="659" alt="MemoryInterface_Schematic" src="https://github.com/user-attachments/assets/0c77e6d5-92fb-46fd-bd53-1a96e0addbbb">

# Memory Module Description

## Inputs:
- **clk**: Clock signal.
- **mem_read**: Control signal to read from memory.
- **mem_write**: Control signal to write to memory.
- **address**: The 19-bit address where data is either read from or written to.
- **write_data**: The 19-bit data to be written to memory.

## Outputs:
- **read_data**: The 19-bit data read from the memory.

Test Case 1: Write 19'h1A2B to memory address 2.

Test Case 2: Read from memory address 2 and check if the data is 19'h1A2B.

Test Case 3: Write 19'h3F4E to memory address 3.

Test Case 4: Read from memory address 3 and check if the data is 19'h3F4E.

Test Case 5: Read from an unwritten memory address (4), and display the result (could show x or unknown values since it hasn't been written to).

<img width="743" alt="MemoryInterface_tb" src="https://github.com/user-attachments/assets/2d7100ea-267e-4208-b4d7-bb87217f510b">




## Memory Array:
We define a memory array `memory_array` with 16 locations, each 19 bits wide (you can adjust the size if needed).

## Memory Operations:
On the positive edge of the clock, the module checks if `mem_write` is asserted. If so, the data in `write_data` is stored at the memory location defined by the lower 4 bits of `address` (so a 4-bit address range is used). If `mem_read` is asserted, the data from the memory location defined by `address` is loaded into `read_data`.



</details>
