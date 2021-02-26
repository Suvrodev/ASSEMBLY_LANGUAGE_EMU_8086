.MODEL SMALL
.STACK 100H
.DATA
   T1 DB 'ENTER A LETTER: $'
   T2 DB 'THATS LETTER: $'
   T3 DB 'THATS SIGN IS NOT BETWEEN A-Z$'
   INPUT1 DB ?
   
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
      
    LEA DX,T1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV INPUT1,AL                 ;https://www.csee.umbc.edu/courses/undergraduate/313/fall04/burt_katz/lectures/Lect05/decisionMaking.html
    
    MOV BH,INPUT1
    CMP BH,'A'
    JGE NEXT: 
    
    JMP EXIT:
    
    NEXT:
    MOV BH,INPUT1
    CMP BH,'Z'
    JLE PRINT:
    
    JMP EXIT_AGO:
    
    
    PRINT:  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9 
    LEA DX,T2
    INT 21H
    
    
    MOV AH,2
    MOV DL,INPUT1
    INT 21H
    JMP EXIT:
    
    EXIT_AGO:
    
     MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,T3
    INT 21H 
    JMP EXIT:
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
   END MAIN