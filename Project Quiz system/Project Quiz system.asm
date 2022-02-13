include emu8086.inc
.MODEL SMALL
.STACK 100H

.DATA    

MSG1 DB '                .....WELCOME TO YOUR FIRST QUIZ.....$'
MSG2 DB 'Rules : $'
MSG3 DB '*. For Every Correct answer you will get 1 point.$'
MSG4 DB '*. For Every Wrong answer 1 Point will cut from your total point.$'
MSG5 DB 'Press Enter to start the quiz : $'
MSG8 DB 'You have successfully completed your quiz.$'
MSG9 DB 'Your Total obtained point is : $'
MSG10 DB 'Press 1 to Re-attempt quiz or 0 to Exit.$' 
MSG11 DB '                    ***Thank you.! ***$'
Q1 DB    '1. A microprocessor is a chip integrating all the functions of a CPU of a computer$'
QA1 DB  ' A. single B. multiple C. double$'
           
Q2 DB '2.The purpose of the microprocessor is to control$'
QA2 DB 'A. switches B. memory C. processing $'
Q3 DB '3.The intel 8086 microprocessor is a........ processor$'
QA3 DB 'A. 8 bit B. 32 bit C. 16 bit$'
Q4 DB '4.The OF is called as ........?$'
QA4 DB ' A. overdue flag B. overflow flag C. one flag$'
Q5 DB '5.The CF is known as........?$'
QA5 DB '  A. carry flag B. condition flag C. common flag$'
Q6 DB '6.The SF is called as.........?$'
QA6 DB ' A. service flag B. single flag C. sign flag$'
Q7 DB '7.The IF is called as..... ?$'
QA7 DB ' A. initial flag B. interrupt flag C. indicate flag$'
Q8 DB '8.The SP is indicated by........?$'
QA8 DB ' A. single pointer B. source pointer C. stack pointer$'
Q9 DB '9.. The SS is called as........?$'
QA9 DB ' A. stack segment B. single segment C. sequence stack$'
Q10 DB '10.The IP is......... bits in length?$'
QA10 DB 'A. 16 bits B. 4 bits C. 8 bits $'
.CODE
MAIN PROC 
    
    MOV AX,@DATA
	MOV DS,AX
    
	LEA DX,MSG1
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,MSG2
	MOV AH,9
	INT 21H
    
	CALL NL
    
	LEA DX,MSG3
	MOV AH,9
	INT 21H
    
    CALL NL
    
	LEA DX,MSG4
	MOV AH,9
	INT 21H
	
	START:
	MOV BL, 0  
    CALL NL
    
	LEA DX,MSG5
	MOV AH,9
	INT 21H
	
	
	MOV AH, 1
	INT 21H
	
	CMP AL, 0DH
	JE QSN1
	JNE START
	
	QSN1:
	CALL NL
    
	LEA DX,Q1
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA1
	MOV AH,9
	INT 21H
	
	CALL NL
    
	MOV AH, 1
	INT 21H
	CMP AL, 'a'
	JE QSN2
    JNE QSNW2
	
	QSN2:
	CALL NL
	PRINTN "Right answer"
	
	INC BL
	CALL NL
    
	CALL QN2 
	
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN3
	JNE QSNW3
	
	QSNW2:
	CALL NL 
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN2 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN3 
	JNE QSNW3
	
	
	QSN3:
	CALL NL
    
	printn "right answer"
	
	INC BL
	CALL NL    

    
	CALL QN3 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN4
	JNE QSNW4
	
	QSNW3:
	CALL NL 
	printn "Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN3
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN4 
	JNE QSNW4
	
	QSN4:
	CALL NL
    
	printn "right answer"
	
	INC BL
	CALL NL
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN5
	JNE QSNW5
	
	QSNW4:
	CALL NL
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN5 
	JNE QSNW5
	
	QSN5:
	CALL NL
    
	printn "Right answer"
	
	INC BL
	CALL NL
    
	CALL QN5 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN6
	JNE QSNW6
	
	QSNW5:
	CALL NL
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN5 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN6 
	JNE QSNW6
	
	QSN6:
	CALL NL
    
	printn "RIGHT ANSWER"
	
	INC BL
	CALL NL
    
	CALL QN6 
	
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN7
	JNE QSNW7
	
	QSNW6:
	CALL NL
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN6 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN7 
	JNE QSNW7
	
	QSN7:
	CALL NL
    PRINTN "Right answer"
	
	INC BL
	CALL NL
    
	CALL QN7
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN8
	JNE QSNW8
	
	QSNW7:
	CALL NL
	printn "Wrong answer"
    
	DEC BL
	CALL NL
    
	CALL QN7 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN8 
	JNE QSNW8
	
	QSN8:
	CALL NL
    
	printn " Right answer"
	
	INC BL
	CALL NL
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN9
	JNE QSNW9
	
	QSNW8:
	CALL NL
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN9 
	JNE QSNW9
	
	QSN9:
	CALL NL
    
	printn "Right answer"
	
	INC BL
	CALL NL
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN10
	JNE QSNW10
	
	QSNW9:
	CALL NL 
	printn " Wrong answer"
	
	DEC BL
	CALL NL
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN10 
	JNE QSNW10
	
	QSN10:
	CALL NL
    printn " Right answer"
	
	INC BL
	CALL NL
    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT
	JNE EXITW
	
	QSNW10:
	CALL NL
	printn " Wrong answer"
    
	DEC BL
	CALL NL
    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT 
	JNE EXITW
	
	EXIT:
	CALL NL 
    
   printn "Right answer"
	
	INC BL
	CALL NL
	CALL NL
    
	LEA DX,MSG8
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,MSG9
	MOV AH,9
	INT 21H
	
	ADD BL, 48
	
	CMP BL,57
	JG TEN
	MOV AH, 2
	MOV DL, BL
	INT 21H
	JMP EXIT1
	
	EXITW:
	CALL NL
	printn " Wrong answer"
    
	DEC BL
	CALL NL
	CALL NL  

    
	LEA DX,MSG8
	MOV AH,9
	INT 21H 
	
	CALL NL
    CALL NL
    
	LEA DX,MSG9
	MOV AH,9
	INT 21H
	
	ADD BL,48
	MOV AH,2
	MOV DL, BL
	INT 21H
	
	JMP EXIT1
	
	TEN:
	MOV AH,2
	MOV DL,"1"
	INT 21H  
	MOV DL,"0"
	INT 21H
	JMP EXIT1
	
	NL: 
	MOV AH,2
	MOV DL, 0AH
	INT 21H   
    MOV DL, 0DH
    INT 21H
    RET 
    
    QN2:
    LEA DX,Q2
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA2
	MOV AH,9
	INT 21H
	RET 
	
	QN3:
    LEA DX,Q3
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA3
	MOV AH,9
	INT 21H
	RET
	
	QN4:
    LEA DX,Q4
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA4
	MOV AH,9
	INT 21H
	RET
	
	QN5:
    LEA DX,Q5
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA5
	MOV AH,9
	INT 21H
	RET 
	
	QN6:
    LEA DX,Q6
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA6
	MOV AH,9
	INT 21H
	RET
	
	QN7:
    LEA DX,Q7
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA7
	MOV AH,9
	INT 21H
	RET 
	
	QN8:
    LEA DX,Q8
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA8
	MOV AH,9
	INT 21H
	RET  
	
	QN9:
    LEA DX,Q9
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA9
	MOV AH,9
	INT 21H
	RET 
	
	QN10:
    LEA DX,Q10
	MOV AH,9
	INT 21H
	
	CALL NL
    
	LEA DX,QA10
	MOV AH,9
	INT 21H
	RET  
	
	INPUT:
	CALL NL
    
	MOV AH, 1
	INT 21H
	RET
	
	
	EXIT1: 
	CALL NL 
	CALL NL
	
	LEA DX,MSG10
	MOV AH,9
	INT 21H
	
	MOV AH,1
	INT 21H
	
	CMP AL,'1'
	JE START 
	
	CALL NL
	CALL NL
	
	LEA DX,MSG11
	MOV AH,9
	INT 21H
	
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP
END MAIN