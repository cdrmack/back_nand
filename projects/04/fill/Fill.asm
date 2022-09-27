// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192 // 256 rows * 32 registers per row
D=A
@number_of_registers
M=D

(LOOP)
  @current_register
  M=0
  @KBD
  D=M
  @FILLWHITE
  D;JEQ
  @FILLBLACK
  0;JMP

(FILLBLACK)
  @current_register
  D=M
  @number_of_registers
  D=M-D
  @LOOP
  D;JEQ // screen updated

  @SCREEN
  D=A
  @current_register
  A=D+M
  M=-1

  @current_register
  M=M+1

  @FILLBLACK
  0;JMP

(FILLWHITE)
  @current_register
  D=M
  @number_of_registers
  D=M-D
  @LOOP
  D;JEQ // screen updated

  @SCREEN
  D=A
  @current_register
  A=D+M
  M=0

  @current_register
  M=M+1

  @FILLWHITE
  0;JMP

(END)
  @END
  0;JMP
