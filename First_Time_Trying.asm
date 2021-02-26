.MODEL SMALL
.STACK 100H
.DATA
  T1 DB "HOW MANY TIME DO YOU WANT TO SHOW: $"  
  T2 DB "ENTER A UPPERCASE LANGUAGE LETTER: $"
  T3 DB "THE LOWERCASE VALUE OF THATS LETTER: $"   
  T4 DB "HERE THE ALL LETER OF ENGLISH WORD: $"
  
  TIME_ DB ?     
  UCL DB ? 
  LCL DB ?
  I1 DB ?
  
  
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    MOV AH,9  ;HOW MANY TIME 
    LEA DX,T1
    INT 21H
    
    MOV AH,1  ;INPUT
    INT 21H
    MOV TIME_,AL   
    SUB TIME_,30H  
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CH,TIME_
    START:
    
    MOV AH,2  ; NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H     
    
   
            
            
    MOV AH,9  ;UPPERCASE VALUE 
    LEA DX,T2
    INT 21H
    
    MOV AH,1  ;INPUT
    INT 21H
    MOV I1,AL
    
    MOV AH,2  ; NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,9  ;LOWERCASE VALUE
    LEA DX,T3
    INT 21H
    
    
    MOV AH,2  ; OUTPUT
    MOV DL,I1
    ADD DL,20H
    INT 21H    
    
    DEC CH
    JNZ START:  
    
    MOV AH,2  ; NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H        
              
    MOV AH,2  ; NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H             
    
    LEA DX,T4
    MOV AH,9
    INT 21H    
    
   
    MOV CX,26
    MOV UCL,65 
   
    TOP:
    
    MOV AH,2
    MOV DL,UCL
    INT 21H 
    
    MOV AH,2
    ADD DL,20H
    INT 21H
    
    MOV AH,2  ;CREATE SPACE
    MOV DL,32
    INT 21H
    
    INC UCL
    LOOP TOP:
    
    
    
    
    MOV AH,2   ;ENDING SOUND
    MOV DL,7
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN