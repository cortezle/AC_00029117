	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call 	phrase2
	call 	phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 3d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 29d
lupi:	mov 	cl, [msg+di-29d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 13d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase2:	mov 	di, 20d
lupi2:	mov 	cl, [msg2+di-20d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 19d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase3:	mov 	di, 25d
lupi3:	mov 	cl, [msg3+di-25d]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

section .data

msg	db 	"There is a lady who assures "
len 	equ	$-msg+29d
msg2	db 	"That all that Gliters is gold"
len2 	equ	$-msg2+20d
msg3	db 	"And she's buying a stairway to heaven "
len3 	equ	$-msg3+25d