.MODEL SMALL
.STACK 100H
.DATA
 WISH DB "HAPPY VALENTINES DAY$"
 EMOJI DB 03H  
 .CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV BX,22
     
    TOP:
       
    MOV AH,2
    MOV DL,03H 
    INT 21H
    DEC BX      
    JNZ TOP:
                 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,EMOJI
    INT 21H 
              
    MOV AH,9
    LEA DX,  WISH
    INT 21H
    
    MOV AH,2
    MOV DL,EMOJI
    INT 21H  
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    
    
    MOV BX,22
    AA:    
    MOV AH,2
    MOV DL,03H 
    INT 21H
    DEC BX  
    
    JNZ AA:
   
             
    MOV AH,4CH
    INT 21H         
    MAIN ENDP
 END MAIN