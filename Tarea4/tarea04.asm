org 	100h

section .text

        call    texto
        mov     dx, msg
        call    w_strng

        xor 	si, si 	
lupi:	call 	kb
        mov     cl, 30h
        sub     al, cl
        mov	[200h+si], al
        inc 	si
        cmp 	si, 5h
        je	calculoP
        jmp 	lupi
        int     20h

calculoP:	
        call    texto
        call    promedio
        call    mensajeF
        call 	kb	
        int 	20h

promedio:
        mov     al, [200h]
        add     al, [201h]
        add     al, [202h]
        add     al, [203h]
        add     al, [204h]
        mov     cl, 5h
        div     cl
        ret

mensajeF:         
    cmp al, 10d
    je  mostrar10
    cmp al,9d
    je  mostrar9
    cmp al,8d
    je  mostrar8
    cmp al,7d
    je  mostrar7
    cmp al,6d
    je  mostrar6
    cmp al,5d
    je  mostrar5
    cmp al,4d
    je  mostrar4
    cmp al, 3d
    je  mostrar3
    cmp al, 2d
    je  mostrar2
    cmp al,1d
    je  mostrar1
    jne mostrarf
    ret

mostrarf:  
	mov 	dx, msgf
	call 	w_strng
    jmp final

mostrar10:  
	mov 	dx, msg10
	call 	w_strng
    jmp final
mostrar9:  
	mov 	dx, msg9
	call 	w_strng
    jmp final
mostrar8:  
	mov 	dx, msg8
	call 	w_strng
    jmp final
mostrar7:  
	mov 	dx, msg7
	call 	w_strng
    jmp final
mostrar6:  
	mov 	dx, msg6
	call 	w_strng
    jmp final
mostrar5:  
	mov 	dx, msg5
	call 	w_strng
    jmp final
mostrar4:  
	mov 	dx, msg4
	call 	w_strng
    jmp final
mostrar3:  
	mov 	dx, msg3
	call 	w_strng
    jmp final
mostrar2:  
	mov 	dx, msg2
	call 	w_strng
    jmp final
mostrar1:  
	mov 	dx, msg1
	call 	w_strng
    jmp final


texto:	mov 	ah, 00h
        mov	    al, 03h
        int 	10h
        ret
        
final: 
	int 	20h

w_strng:mov	ah, 09h
	int 	21h
	ret

kb: 	mov     ah, 1h
        int 	21h
        ret

section .data
msg 	db 	"Ingrese su mensaje: $"
nl	db 	0xA, 0xD, "$"
msg10    db  "Perfecto solo Dios $"
msg9   db  "Siempre me esfuerzo $"
msg8    db  "Colocho $"
msg7   db  "Muy bien $"
msg6    db  "Peor es nada $"
msg5   db  "En el segundo $"
msg4    db  "Me recupero $"
msg3   db  "Hay salud $"
msg2    db  "Aun se pasa $"
msg1   db  "Solo necesito el 0 $"
msgf db  "Murio $"