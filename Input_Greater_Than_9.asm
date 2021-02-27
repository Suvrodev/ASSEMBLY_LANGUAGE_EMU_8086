.MODEL SMALL
.STACK 100H
.DATA
    T1 DB 'INPUT A NUMBER: $'
    
    .CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX  
        
        MOV BH,0
        MOV BL,10D
        
        INPUT:
        MOV AH,1
        INT 21H
        CMP AL,13D
        JNE NUMBER
                  
        JMP EXIT          
        
        NUMBER:
        SUB AL,30H
        MOV CL,AL
        MOV AL,BH
        MUL BL
        ADD AL,CL
        MOV BH,AL
        
        JMP INPUT
        
        
        EXIT:
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN