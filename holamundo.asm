; HERBERTH GUILLERMO OBREGÓNN ESPINO - 201314237

ORG 100h

	mov dx, menu		; coloar direccion de cadena en 
	mov ah,9			; funcion 9, imprimir en pantalla
	int 21h				; interrupcion DOS

	mov ah,4ch			; funcion 4c finalizar ejecucion
	int 21h				; interrupcion DOS

menu db "hola mundo!",13,10,'$'


; call <PROC>
IF:
	mov ax, 01h			; asignar 1 al registro AX

	cmp ax, 02h			; comparar el registro AX con 02h
	je Es_1 			; si es igual saltar (jump equal)
	jne No_es_2			; si no es igual saltar (jump non equal)

	Es_2:
		jmp Siguiente

	No_es_2:
		jmp Siguiente 

	Siguiente:
		ret
	ret


SWITCH:
	mov ax, 01h			; asignar 1 al registro AX
	
	cmp ax, 01h			; comparar el registro AX con 02h
	je Op1				; Saltar a Op1

	cmp ax, 02h			; comparar el registro AX con 02h
	je Op2				; Saltar a Op1

	Op1:
		jmp Fin

	Op2:
		jmp Fin 

	Fin:
		ret
	ret

FOR:
	mov cx, 10h 		; Se inicia el contador CX en 10

	Cfor:
		ret
	loop Cfor  			; dECREMENTA cx y salta a la etq hasta llegar a 0
