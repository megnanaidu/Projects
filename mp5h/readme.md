### ECE 220 Honors Section
# MP5 - Preemptive Multitasking in LC-3

In this MP you will get to implement context switching for a simple preemptive multitasking LC-3 program we provided. The premise behind preemptive multitasking is that the operating system decides when to switch to another task. 

### General guideines:   
1. Do not touch any of the given code in os2.asm or usr2.asm.
2. You will need to implement the `TMR_INT`, `CNTX_SWITCH`, `TASK0_LOOP`, `TASK1_LOOP` functions.

### Files:

- os2.asm - A preemptive multitasking mechanism where you need to implement the `TMR_INT` and `CNTX_SWITCH` function.
- usr2.asm - In the code usr2.asm, two tasks will run: Task 0 and Task 1. You will be responsible for the code in `TASK0_LOOP` and `TASK1_LOOP`. Task 0 is responsible for incrementing both a local counter and a shared counter between Task 0 and Task 1. After the loop is ran once, the system will switch to Task 1 automatically using a timer interrupt you implement. Similarly, Task 1 is tasked with incrementing a local counter and the shared counter between Task 0 and Task 1. After Task 1 loop is ran, the system will switch back to Task 0.

---
### Modified LC3 Simulator
In the release there is a modified LC3 sim that allows for interrupts. Follow the steps to download and use the modified LC3 sim. **If you already did this in MP4H, you don't need to do it again.**

  1. Download the lc3htools zip file and extract it
  2. Change directories into the lc3htools extracted folder
  3. Run the provided bash script to install lc3htools

    $ bash ./lc3h.sh
  
  You should see the following output:

    lc3htools made
    lc3has set.
    lc3hconvert set.
    lc3hsim set.
    lc3hsim-tk set.

  4. Source the changes

    $ source ~/.bashrc

  5. Test lc3h commands
  
  You should now be able to call `lc3has`,`lc3hsim`,`lc3hconvert`,`lc3hsim-tk` to compile and test your code as you would in lc3tools!

---
### Testing:  
    
  1. Compile all the `.asm` files with Lumetta's assembler (lc3has). 

    $ lc3has usr2.asm 
    $ lc3has os2.asm 

  2. Load the `usr2.obj` and `os2.obj` files into the modified LC3 simulator.

    $ lc3hsim-tk

  3. After loading `os2.obj` and `usr2.obj` set **PC** to **0x0200** and **PSR** to **0x0000**. 

  4. If you run the program and see `TASK0_ACC`, `TASK1_ACC`, and `SHARED_ACC` incrementing with `TASK0_ACC`, `TASK1_ACC` should be very similar. If they are very similar your implementation is correct.


---
### Programming Tasks: 

  1. Complete the functions in os2.asm: `TMR_INT`, `CNTX_SWITCH`
  2. Complete the two tasks loops in usr2.asm: `TASK0_LOOP` and `TASK1_LOOP`.

### Report:
In your report answer the following questions and submit on Gradescope:
  1. What is the difference between your `TASK0_LOOP` implementation in MP4H and MP5H? Why is there a difference? 
    
  2. Step through your preemptive context switching program. You should notice that `TASK0_ACC` + `TASK1_ACC` != `SHARED_ACC` like in MP4H. What is the reason and is there a way to fix it? (Hint: Think about MP2H)
      
  3. What does setting `PSR` to `0x0000` represent?

  4. Why do you need to save the PC into the TCB? How do we restore the PC in MP4H vs MP5H? (Hint: what's the difference between the end of `TRAP_YIELD` vs `CNTX_SWITCH`)

---
##### End MP5