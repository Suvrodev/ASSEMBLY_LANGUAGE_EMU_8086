.MODEL SMALL
.STACK 100H
.DATA  
   T DB 'TOTAL NUMBER: $'
   T1 DB 'ENTER A NUMBER: $'
   T2 DB 'ENTER ANOTHER NUMBER: $'  
   T3 DB 'BIGGEST NUMBER IS: $' 
   T4 DB 'SMALLEST NUMBER IS: $'
   N1 DB ?
   N2 DB ? 
   H_N DB ?
   
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
               
    
    MOV AH,9  ;ENTER A NUMBER
    LEA DX,T1
    INT 21H
    
    MOV AH,1  ;INPUT 1
    INT 21H
    MOV N1,AL
    
    MOV AH,2    ;NL
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
               
    MOV AH,9   ;ENTER ANOTHER NUMBER
    LEA DX,T2
    INT 21H
    
    MOV AH,1    ;INPUT 2
    INT 21H
    MOV N2,AL
    
    MOV AH,2    ;NL
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
            
    MOV AH,9  ;TOTAL VALUE
    LEA DX,T
    INT 21H 
    
    MOV AH,2
    MOV DL,N1
    MOV BL,N2 
    MOV H_N,BL
    ADD DL,H_N 
    SUB DL,30H
    INT 21H 
    
     MOV AH,2    ;NL
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CH,N1   ; COMPARE 2 NUMBER
    MOV DH,N2
    CMP CH,DH
    JG BIG_NUMBER
    
    MOV AH,9
    LEA DX,T4
    INT 21H
    
    MOV AH,2
    MOV DL,N1
    INT 21H 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,T3
    INT 21H
    
    MOV AH,2
    MOV DL,N2
    INT 21H 
    
    
    
    JMP EXIT:
    
    
    BIG_NUMBER:
    MOV AH,9   ;BIGGEST NUMBER
    LEA DX,T3
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9   ;SMALLEST NUMBER
    LEA DX,T4
    INT 21H
    
    MOV AH,2
    MOV DL,N2
    INT 21H 
    
    JMP EXIT:
          
   
    
    EXIT:
    MOV AH,2  ;BEEP
    MOV DL,7
    INT 21H
    
     
    MOV AH,4CH
    INT 21H
    MAIN ENDP
   END MAIN
    