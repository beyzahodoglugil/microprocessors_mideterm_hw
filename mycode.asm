DSEG    SEGMENT 'DATA' 
    
DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*****

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX

; Copy your code here-

MOV DX, 2000H
MOV AL, 03EH
OUT DX, AL

MOV DX, 2001H
MOV AL, 041H
OUT DX, AL
MOV DX, 2002H
MOV AL, 049H
OUT DX, AL

MOV DX, 2003H
MOV AL, 049H
OUT DX, AL

MOV DX, 2004H
MOV AL, 039H
OUT DX, AL

  

MOV DX, 2005H
MOV AL, 00H
OUT DX, AL

MOV DX, 2006H
MOV AL, 00H
OUT DX, AL

MOV DX, 2007H
MOV AL, 07DH
OUT DX, AL

MOV DX, 2008H
MOV AL, 00H
OUT DX, AL

MOV DX, 2009H
MOV AL, 00H
OUT DX, AL
MOV DX, 200AH
MOV AL, 061H
OUT DX, AL

MOV DX, 200BH
MOV AL, 051H
OUT DX, AL

MOV DX, 200CH
MOV AL, 049H
OUT DX, AL

MOV DX, 200DH
MOV AL, 045H
OUT DX, AL

MOV DX, 200EH
MOV AL, 043H
OUT DX, AL

MOV DX, 200FH
MOV AL, 07FH
OUT DX, AL

MOV DX, 2010H
MOV AL, 049H
OUT DX, AL

MOV DX, 2011H
MOV AL, 049H
OUT DX, AL
MOV DX, 2012H
MOV AL, 049H
OUT DX, AL

MOV DX, 2013H
MOV AL, 049H
OUT DX, AL

MOV DX, 2014H
MOV AL, 07FH
OUT DX, AL

MOV DX, 2015H
MOV AL, 02H
OUT DX, AL

MOV DX, 2016H
MOV AL, 04H
OUT DX, AL

MOV DX, 2017H
MOV AL, 02H
OUT DX, AL

MOV DX, 2018H
MOV AL, 07FH
OUT DX, AL; return to operating system:
    RET
  
START   ENDP
       
DELAY:
    MOV AX,0
    LOOP1:
	INC AX
	CMP AX,1
	JNE LOOP1

    RET

;*****

CSEG    ENDS 

        END    START    ; set entry point 
        
;
 data segment 
 str1 db "Please enter a string: $" 
 str2 db 13,10,"Your string output is:$"
 Arr db 10 dup('$')
 ends

 stack segment
    dw 128 dup(0)
 ends

 code segment
 start:

 mov ax,@data
 mov ds,ax  

 lea dx,str1
 mov ah,09h
 int 21h 

 mov ah,10
 lea dx,Arr
 mov arr,6
 int 21h

 lea dx,str2
 mov ah,09h
 int 21h 

 lea dx,Arr+2
 mov ah,09h
 int 21h

 mov ax,4c00h
 int 21h

 ends  

 end start
 
;