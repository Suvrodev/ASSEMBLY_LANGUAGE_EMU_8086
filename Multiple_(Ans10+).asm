;include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA 
  T1 DB 'ENTER A NUMBER: $'
  T2 DB 'ENTER ANOTHER NUMBER: $'
  T3 DB 'ANS: $'
  
  IP1 DB ?
  IP2 DB ?
  ANS DB ?
  
  .CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,T1
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
              
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
    MOV AH,9
    LEA DX,T2
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV AL,AL
    SUB AL,48 
    MUL BL
    
    ;---------------------
    MOV AH,0
    AAM
       
    MOV BX,AX
    ADD BH,30H
    ADD BL,30H
    ;--------------------
   
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,9
    LEA DX,T3
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    
            
              
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
  END MAIN
