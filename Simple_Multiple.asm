.MODEL SMALL
.STACK 100H
.DATA
   T1 DB 10,13,"ENTER A NUMBER: $"
   T2 DB 10,13,"ENTER ANOTHER NUMBER: $"
   T3 DB 10,13,"TOTAL VALUE: $"
   
   IP1 DB ?
   IP2 DB ?
   TOTAL_ DB ?
   
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AH,9 
    LEA DX,T1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV IP1,AL
    SUB IP1,30H
    
    LEA DX,T2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV IP2,AL
    SUB IP2,30H
    
    
    LEA DX,T3
    MOV AH,9
    INT 21H 
    
    MOV AL,IP1
    MOV BL,IP2
    MUL BL
    MOV AH,2
    MOV DL,AL  
    ADD DL,30H
    INT 21H
  
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
   END MAIN