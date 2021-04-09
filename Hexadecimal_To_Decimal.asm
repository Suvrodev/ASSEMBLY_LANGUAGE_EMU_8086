.MODEL SMALL
.STACK 100H
.DATA 
  MSG1 DB 10,13,"ENTER A HEXADECIMAL NUMBER: $"   
  MSG2 DB 10,13,"IN DECIMAL IT IS: $"
  MSG3 DB 10,13,10,13,"DO YOU WANT TO DO IT AGAIN? Y/N: $"
  MSG4 DB 10,13,"ILLIGAL CHARACTER $" 
  
  REMAIN DB 10,13,"YOU HAVE REMAINING $"
  TIME DB  " TIMES$"  
  RT DB ?
  
  NUMBER DB ?
  
  .CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    MOV RT,'3'
    
    START:
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUMBER,AL 
    
    CMP NUMBER,30H
    JGE NUMBER1_9: 
    JL INVALID:
    
    INVALID:
    LEA DX,MSG4
    MOV AH,9
    INT 21H  
    
    LEA DX,REMAIN
    MOV AH,9
    INT 21H
    
    DEC RT
    MOV AH,2
    MOV DL,RT
    INT 21H
    
    LEA DX,TIME
    MOV AH,9
    INT 21H
    
    CMP RT,'0'
    JE EXIT:  
    JMP AGAIN:
    
    NUMBER1_9: 
    CMP NUMBER,39H
    JLE PRINT(N):
    JG CHECK_CHARACTER:
    
    PRINT(N):
    LEA DX,MSG2 
    MOV AH,9
    INT 21H  
    
    MOV AH,2
    MOV DL,NUMBER
    INT 21H
    JMP AGAIN: 
    
    CHECK_CHARACTER:
    CMP NUMBER,41H
    JGE CHECK_CHARACTE_AGAIN:
    JL INVALID:  
    
    CHECK_CHARACTE_AGAIN:
    CMP NUMBER,46H 
    JLE DISPLAY: 
    JG INVALID:
    
    DISPLAY:
    LEA DX,MSG2 
    MOV AH,9
    INT 21H  
    
    MOV AH,2
    MOV DL,'1'
    INT 21H    
    MOV AH,2
    SUB NUMBER,11H 
    MOV DL,NUMBER
    INT 21H 
    
    
    
    AGAIN:
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    CMP AL,59H  
    JE START:
    

    
    
    EXIT:
    MOV AH,2
    MOV DL,07H
    INT 21H
    MOV AH,4CH
    INT 21H
    MAIN ENDP
  END MAIN