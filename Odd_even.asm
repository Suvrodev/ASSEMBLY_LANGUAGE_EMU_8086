.MODEL SMALL
.STACK 100H
.DATA   
     
    MSG1 DB 10,13,"ENTER A NUMBER: $"
    MSG2 DB 10,13,"THATS NUMBER IS EVEN $"
    MSG3 DB 10,13,"THATS NUMBER IS ODD $"
    
    INPUT DB ? 
   
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV CX,10
    START:
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV INPUT,AL
    
    MOV AL,INPUT
    MOV BL,2
    DIV BL
    
    
    CMP AH,0   ;Quotient stay in AL Register
    JG ODD:    ;Reminder stay in AH Register
    
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H     
    
    DEC CX
    JNZ START:
    JMP EXIT:
    
    ODD:
    MOV AH,9
    LEA DX,MSG3
    INT 21H   
    
    DEC CX
    JNZ START:
    JMP EXIT:
    
    EXIT:
    MOV AH,2
    MOV AH,4CH
    INT 21H
    MAIN ENDP
   END MAIN