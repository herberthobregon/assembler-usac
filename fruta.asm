; UNIVERSIDAD DE SAN CARLOS DE GUATEMALA
; FACULTAD DE INGENIERIA
; ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1
; PRIMER SEMESTRE
; SECCION B
; HERBERTH GUILLERMO OBREGÓNN ESPINO - 201314237
; NASM
;
; Comando para ensamblar: #nasm fruta.asm -o fruta.com
; Presionar tecla para finalizar
;======================================================================|
;							M 	A 	I 	N 						       |
;======================================================================|

ORG	100h

mov ah,00h 			;modo video
mov al,13h			;320x200 256 colores
int 10h 			;servicio de pantalla
		
call Put_Fruit 			;pintar ejes
call GetCh2 		;leer caracter

mov ah,00h 			;modo video
mov al,03h 			;80x25 16 colores
int 10h 			;servicio de pantalla

mov ah, 4ch			; funcion 4C, finalizar ejecucion
int 21h				; interrupcion DOS

;======================================================================
	; funcion Put_Fruit
	; coloca la fruta

Put_Fruit:
	mov es, word[startaddr]		;colocar direccion de segmento de video en ES

	;f(158,98) = x + y*320
	mov di, 31360				;y*320 = 98*320 = 31360
	add di, 158					;sumar x

	mov si, fruta1 				;colocar direccion de dato source
	mov cx, 5 					;tamaño del dato a mover
	cld 						;clear direction flag (direccion en que se copian los datos)
	rep movsb 					;mover dato

	mov si, fruta2 				;colocar direccion de dato source
	add di, 315 				;cambiar de fila
	mov cx, 5 					;tamaño del dato a mover
	cld  						;clear direction flag (direccion en que se copian los datos)
	rep movsb 					;mover dato

	mov si, fruta3 				;colocar direccion de dato source
	add di, 315 				;cambiar de fila
	mov cx, 5 					;tamaño del dato a mover
	cld  						;clear direction flag (direccion en que se copian los datos)
	rep movsb  					;mover dato

	mov si, fruta4 				;colocar direccion de dato source
	add di, 315  				;cambiar de fila
	mov cx, 5 					;tamaño del dato a mover
	cld  						;clear direction flag (direccion en que se copian los datos)
	rep movsb 					;mover dato

	mov si, fruta5 				;colocar direccion de dato source
	add di, 315 				;cambiar de fila
	mov cx, 5 					;tamaño del dato a mover
	cld  						;clear direction flag (direccion en que se copian los datos)
	rep movsb 					;mover dato

	ret
;======================================================================
	; funcion GetCh2
	; ascii tecla presionada

GetCh2:
	mov ah,08h			; funcion 8, capturar caracter sin mostrarlo
	int 21h				; interrupcion DOS
	ret					; return

;======================================================================|
;							D 	A 	T 	A 						       |
;======================================================================|	

SEGMENT data 
  	startaddr dw 0A000h				;inicio del segmento de memoria de video

  	;fruta
	fruta1 DB 00, 00, 10, 00, 00
	fruta2 DB 00, 04, 04, 04, 00
	fruta3 DB 04, 04, 04, 04, 04
	fruta4 DB 00, 04, 04, 04, 00
	fruta5 DB 00, 00, 04, 00, 00