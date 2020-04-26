	org 100h
	
section .text
		;calculando promedio
		mov ax, 0h
		mov bx, 0h
		mov bx, 2h
		add ax, bx
		mov bx, 9h
		add ax, bx
		mov bx, 1h
		add ax, bx
		add ax, bx
		mov bx, 7h
		add ax, bx
		mov bx, 5h
		div bx

		;Limpiando antes de usar otra vez
		mov cx, 0h
		mov di, 0d
		mov cx, 11d

		;imprimiendo valores
		mov di, 0d
		mov cx, 10d

euno:	mov bx, [comnt+di]
		mov [di+200h],bx
		inc di
		loop euno

		int 20h

section .data

comnt	db	"Me recupero"
len		equ	$-comnt

	
