;=======================================================
; �ļ���:   A2-3.ASM
; ��������: ��ʮ��λ��������ת��ΪASCII���ʾ��ʮ������
;=======================================================

SSTACK	SEGMENT STACK
		DW 64 DUP(?)
SSTACK	ENDS

CODE	SEGMENT
		ASSUME CS:CODE

START:	MOV SI,3500H		;Դ���ݵ�ַ
		MOV DX,[SI]
		MOV SI,3515H		;Ŀ�����ݵ�ַ
A1:		DEC SI
		MOV AX,DX
		MOV DX,0000H
		MOV CX,000AH		;����10
		DIV CX				;������AX, ��������DX
		XCHG AX,DX
		ADD AL,30H			;��Di��ASCII��
		MOV [SI],AL			;����Ŀ���ַ
		CMP DX,0000H
		JNE A1				;�ж�ת��������δ������תA1
A2:		CMP SI,3510H		;��Ŀ���ַ���׵�ַ�Ƚ�
		JZ A3				;�����׵�ַ��תA3������ʣ���ַ
		DEC SI				;����30H
		MOV AL,30H
		MOV [SI],AL
        JMP A2
A3:    	MOV AX,4C00H
		INT 21H				;������ֹ

CODE	ENDS
		END START