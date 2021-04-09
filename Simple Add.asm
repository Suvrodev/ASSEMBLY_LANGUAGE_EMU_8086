.MODEL SMALL
.STACK 100H
.DATA  
  QSN DB "HOW MANY TIME DO YOU WANT TO SHOW: $" 
  AGAIN DB 10,13,"DO YOU WANT TO DO IT AGAIN: Y/N: $"
  MSG1 DB "ENTER A NUMBER: $"
  MSG2 DB 10,13,"ENTER ANOTHER NUMBER: $" 
  MSG3 DB 10,13,"TOTAL NUMBER: $" 
  DOT DB ". $" 
  DOTN DB ?

  QSN_TIME DB ?
  NUM1 DB ?
  NUM2 DB ?
  TOTAL DB ?
  .CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    LEA DX,QSN
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H 
    MOV QSN_TIME,AL 
    SUB QSN_TIME,48
      
    
    MOV DOTN,'0'
    MOV CH,QSN_TIME
    START: 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    INC DOTN
    MOV AH,2
    MOV DL,DOTN
    INT 21H
    
    LEA DX,DOT
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM1,AL
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM2,AL
    ADD AL,NUM1 
    MOV TOTAL,AL
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H   
    
    MOV AH,2
    MOV DL,TOTAL 
    SUB DL,30H
    INT 21H   
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H      
    
    DEC CH
    CMP CH,00H
    JE EXIT:
    
    
    LEA DX,AGAIN
    MOV AH,9
    INT 21H  
    MOV AH,1 
    INT 21H
    MOV DL,AL
    
    CMP DL,59H
    JE START:
    
    
    EXIT:
    MOV AH,2
    MOV DL,07H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
  END MAIN
    
  