// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@R0
D=M
@ZERO
D;JEQ // jump to END if RAM[0] == 0

@R1
D=M
@ZERO
D;JEQ // jump to END if RAM[1] == 0

@R1
D=M
@count
M=D // how many times we need to iterate
@R2
M=0 // prepare register for the final output

(LOOP)
  @count
  D=M
  @END
  D;JEQ

  @R0
  D=M
  @R2
  M=M+D

  @count
  M=M-1

  @LOOP
  0;JMP

(ZERO)
  @R2
  M=0

(END)
  @END
  0;JMP
