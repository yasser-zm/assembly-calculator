   
    DATA SEGMENT 
    
                                                                                         
                                                                                         
    STR0 DB 'CE PROJET CALCULATRICE EST DEVELOPPE PAR : ZAMOUM YASSER ET MEGARI RAMZI $' 
    
    
    NEWLINE DB 13, 10, '$' 
                                               
    
     STR1 DB 'Entrez la base (Binaire, Decimale, ou Hexadecimale): $'  
         
          BUFFER  DB 20        ; Max input length
        DB ?         ; Actual chars typed (output)
        DB 20 DUP(?) ; Space for characters typed    
        
          BUFFER1 DB 20, ?, 20 DUP(?) 
          BUFFER2 DB 20, ?, 20 DUP(?) 

      
        STR2 DB 13, 10, 'Entrer le premier operande $' 
        
          STR3 DB 13, 10, 'Entrer the second  operande $' 
    
    
DATA ENDS  
    

STACK SEGMENT
    DW 128 DUP(?)    
    
STACK ENDS      



CODE SEGMENT   
    
    ASSUME CS:CODE, DS:DATA, SS:STACK

START:
    MOV AX, DATA  
    MOV DS, AX

    MOV DX, OFFSET STR0   ; here it will load the address of str0 of the first element 
    MOV AH, 09H           ; print the  string
    INT 21H              

    MOV DX, OFFSET NEWLINE ; print newline
    MOV AH, 09H
    INT 21H

  MOV DX, OFFSET STR1   ; here it will load the address of str1 of the first element 
    MOV AH, 09H           ; print the  string
    INT 21H  
    
         ; Read user input
    MOV BUFFER, 20  ; defining the maximum characters     
    MOV BUFFER+1, 0       ; free it from prev values 
    LEA DX, BUFFER
    MOV AH, 0Ah
    INT 21H


    MOV AL, BUFFER+2

  
    CMP AL, 'B'
    JE ASK_OP1


    CMP AL, 'D'
    JE ASK_OP1

    CMP AL, 'H'
    JE ASK_OP1

  
     MOV AH, 4CH   
    INT 21H

ASK_OP1:
   
    MOV DX, OFFSET STR2
    MOV AH, 09H
    INT 21H    
    
    
     ; Read first operand    check 
    MOV BUFFER1, 20
    MOV BUFFER1+1, 0
    LEA DX, BUFFER1
    MOV AH, 0Ah
    INT 21H

    ; Ask for second operand  
    
    MOV DX, OFFSET STR3
    MOV AH, 09H
    INT 21H  
    
    ; Read second operand
      MOV BUFFER2, 20
    MOV BUFFER2+1, 0
    LEA DX, BUFFER2
    MOV AH, 0Ah
    INT 21H   

    MOV AH, 4CH   
    INT 21H

CODE  ENDS
END  START
