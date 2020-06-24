org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 45d ; X -> Columna
	mov 	di, 65d ; Y -> Fila
	call 	linea_h

	mov 	si, 25d ; X -> Columna
	mov 	di, 85d ; Y -> Fila
	call 	linea_h

	mov	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v

	mov	si, 45d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v2

	mov	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_aux
	call 	kb		; Utilizamos espera de alguna tecla

	mov	si, 21d ; X -> Columna
	mov 	di, 15d ; Y -> Fila
	call 	linea_vaux
	call 	kb		; Utilizamos espera de alguna tecla
	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 75d
	jne 	lupi_h
	ret


linea_aux: 
lupi_aux:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 45d
	jne 	lupi_aux
	ret

linea_v2:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 65d
	jne 	lupi_v
	ret

linea_v:
lupi_v2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 85d
	jne 	lupi_v2
	ret

linea_vaux:
lupi_vaux:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 55d
	jne 	lupi_vaux
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data