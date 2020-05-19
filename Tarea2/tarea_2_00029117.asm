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

		;longitud loop
		mov cx, 11d

		;imprimiendo valores
		mov di, 0d
		mov cx, 10d

euno:	mov bx, [comnt+di]
		mov [di+200h],bx
		inc di
		loop euno


		;Ejercicio 2

		;limpiando valores
		mov ax, 0h
		mov bx, 0h
		mov cx, 0h
		mov di, 0d

		;Asignando valores claves
		mov ax, 4h ;inicio 4 casos
		mov bx, 2h ;se duplican los casos
		;mov cx, 000bh ;11 resultados

edosA:	mov [di+210h],ax
		mul bx
		inc di
		cmp ax, 256d
		jb edosA

edosb:	mov [di+210h],ax
		mul bx
		inc di
		inc di
		cmp di, 15d
		jb edosb

		;Ejercicio 3

		;Limpiando valores
		mov ax, 0h
		mov bx, 0h
		mov cx, 0h
		mov dx, 0d

		;valores triviales
		mov bx, 0h
		mov dx, 1h
		mov cx, 000dh

		mov di, 0d

		;ingresando valores triviales
		mov [di+220h],bx
		inc di
		mov [di+220h],dx
		inc di

etres:	mov ax, bx
		add ax,dx
		mov [di+220h],ax
		inc di
		mov bx,dx
		mov dx,ax
		loop etres
		
		int 20h

section .data

comnt	db	"Me recupero"
len		equ	$-comnt

	
