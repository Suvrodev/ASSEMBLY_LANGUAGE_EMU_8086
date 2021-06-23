.MODEL SMALL
.STACK 100H
.DATA  
  ARR DB  2,3,4,1,5,6,3,2,6,7
 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
   
    MOV AL,0
    MOV CX,9
    MOV DI,0
    
    SUM:
    MOV AL,ARR[DI]
    ADD AL,ARR[DI+1]
    MOV AH,2
    ADD AL,30H
    MOV DL,AL
    INT 21H
    
    INC DI
    DEC CX
    CMP CX,0
    JNE SUM
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN