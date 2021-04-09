INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA 
  TEXT DB "INPUT A STRING: $"
  .CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,TEXT
    MOV AH,9
    INT 21H   
    
   ; MOV CX,00H
    XOR CX,CX
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE AFTER_TAKING_INPUT:
    PUSH AX
    INC CX 
    JMP INPUT:
    
    
    
    AFTER_TAKING_INPUT:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    PRINT "REVERSE STRING: "     
    
    START:
    POP DX
    INT 21H
    DEC CX
    JNE START:
    
    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
  END MAIN