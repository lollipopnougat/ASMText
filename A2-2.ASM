;====================================================
; �ļ���:   A2-2.ASM
; ��������: ��ʮ��������ASCII��ת��ΪBCD��
;====================================================

SSTACK	SEGMENT STACK
		DW 64 DUP(?)
SSTACK	ENDS

CODE	SEGMENT
		ASSUME CS:CODE

START:	MOV CX, 0005H			;ת��λ��
		MOV DI, 3500H			;ASCII���׵�ַ
A1:		MOV BL, 0FFH			;�������־����BL
		MOV AL, [DI]
		CMP AL, 3AH
	 	JNB A2					;������3AH��תA2
		SUB AL, 30H
		JB  A2					;����30H��תA2
		MOV BL, AL
A2:		MOV AL, BL				;���������־����AL
		MOV [DI+0AH],AL			;�������Ŀ���ַ
		INC DI
		LOOP A1
		MOV AX,4C00H
		INT 21H					;������ֹ
CODE	ENDS
		END START