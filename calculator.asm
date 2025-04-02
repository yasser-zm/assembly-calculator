DATA SEGMENT 
    
    
    STR0 DB 'CE PROJET CALCULATRICE EST DEVELOPPE PAR : ZAMOUM YASSER ET MEGARI RAMZI $'
    NEWLINE DB 13, 10, '$'  
    STR1  DB 'Entrez la base (Binaire, Decimale, ou Hexadecimale): $'
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

    MOV AH, 4CH   ; Exit program
    INT 21H

CODE ENDS
END START
