.MODEL SMALL
.STACK 100H
.DATA   
   TM DB 'HOW MANY TIME DO YOU WANT TO SHOW: $'
   T DB 'TOTAL NUMBER: $'
   T1 DB 'ENTER A NUMBER: $'
   T2 DB 'ENTER ANOTHER NUMBER: $'  
   T3 DB 'BIGGEST NUMBER IS: $' 
   T4 DB 'SMALLEST NUMBER IS: $'
   TS DB 'TWO NUMBERA ARE SAME $'  
   TDOT DB '. $'
   N1 DB ?
   N2 DB ? 
   H_N DB ? 
   TMM DB ?   
   HELP_DIGIT DB ?
   
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9  ;HOW MANY TIME
    LEA DX,TM
    INT 21H
    
    MOV AH,1  ;INPUT TIME
    INT 21H
    MOV TMM,AL
    SUB TMM,48 
    
    MOV HELP_DIGIT,1
    ADD HELP_DIGIT,48
     
    MOV CH,TMM
    GO_MAN: 
    ;_________________________________________ 
    
    MOV AH,2    ;NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
        
    
    MOV AH,2    ;NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,2
    MOV DL,HELP_DIGIT   
    INT 21H
    INC HELP_DIGIT
    
    MOV AH,9
    LEA DX,TDOT
    INT 21H
    
     
               
    
    MOV AH,9  ;ENTER A NUMBER
    LEA DX,T1
    INT 21H
    
    MOV AH,1  ;INPUT 1ST NUMBER
    INT 21H
    MOV N1,AL
    
    MOV AH,2    ;NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
               
    MOV AH,9   ;ENTER ANOTHER NUMBER
    LEA DX,T2
    INT 21H
    
    MOV AH,1    ;INPUT 2ND NUMBER
    INT 21H
    MOV N2,AL
    
    MOV AH,2    ;NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
            
    MOV AH,9  ;TOTAL VALUE
    LEA DX,T
    INT 21H 
    
    MOV AH,2
    MOV DL,N1   ;PRINT TOTAL VALUE
    MOV BL,N2 
    MOV H_N,BL
    ADD DL,H_N 
    SUB DL,30H
    INT 21H 
    
     MOV AH,2    ;NEW LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV BH,N1   ; COMPARE 2 NUMBER
    MOV DH,N2
    CMP BH,DH 
    JE SAME:
    JG BIG_NUMBER_LEFT: 
    
    ;________________________________________________________
     MOV AH,9
    LEA DX,T4
    INT 21H
    
    MOV AH,2
    MOV DL,N1
    INT 21H 
    
    MOV AH,2
    MOV DL,10                    ;THATS MEAN JL= SMALL NUMBER IN LEFT
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,T3
    INT 21H
    
    MOV AH,2
    MOV DL,N2
    INT 21H  
    
    DEC CH  
    JNZ GO_MAN:
    JMP EXIT
    ;______________________________________________________
    
    BIG_NUMBER_LEFT:
    MOV AH,9   ;BIGGEST NUMBER
    LEA DX,T3
    INT 21H
    
    MOV AH,2
    MOV DL,N1
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
    
    DEC CH  
    JNZ GO_MAN:
    JMP EXIT
    
    
    SAME:
    MOV AH,9
    LEA DX,TS
    INT 21H 
    DEC CH  
    JNZ GO_MAN:
  
  
    
    EXIT:    
    MOV AH,2  ;BEEP SOUND
    MOV DL,7
    INT 21H
    
     
    MOV AH,4CH  ;RETURN 0
    INT 21H
    MAIN ENDP
   END MAIN
    
