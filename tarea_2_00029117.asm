	org 100h
	
section .text

		mov ax, 0h
		mov bx, 0h
		mov cx, 0h
		mov ax, 2h
		mov bx, 9h
		mov cx, 1h
		mov dx, 5h ; divisor
		add ax,bx
		add ax, cx
		add ax, cx
		mov cx, 0h
		mov cx, 7h
		add ax, cx
		div dx
		mov [220h], ax ;cociente
		mov [222h], dx ;residuo

		mov di, 0d
		mov cx, [len]
lupi:	mov bl, [comnt+di]
		mov [di+200h],bl
		inc di
		loop lupi

		int 20h

section .data

comnt	db	"Me recupero"
len		equ	$-comnt

	
