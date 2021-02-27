.MODEL SMALL
.STACK 100H
.DATA
   T1 DB 'ENTER A NUMBER: $'
   T2 DB 'ENTER ANOTHER NUMBER: $'
   T3 DB 'TOTAL VALUE: $'
   
   IP1 DB ?
   IP2 DB ? 
   ANS_ DB ?  
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
       MOV IP2,AL 
       
       ADD AL,IP1
       MOV AH,0
       AAA
       
       MOV BX,AX
       ADD BH,30H
       ADD BL,30H
       
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
       MAIN ENDP
   END MAIN
       