; UNIVERSIDAD DE SAN CARLOS DE GUATEMALA
; FACULTAD DE INGENIERIA
; ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1
; PRIMER SEMESTRE
; SECCION B
; AUXILIAR: WILLIAM FERNANDO VALLADARES MUÑOZ
; NASM
;
; Comando para compilar: #nasm video.asm -o video.com
; Presionar ENTER para finalizar
;======================================================================|
;							M 	A 	I 	N 						       |
;======================================================================|

ORG	100h

mov ah,00h 			;modo video
mov al,13h			;320x200 256 colores
int 10h 			;servicio de pantalla
		
call Ejes 			;pintar ejes
call GetCh2 		;leer caracter

mov ah,00h 			;modo video
mov al,03h 			;80x25 16 colores
int 10h 			;servicio de pantalla

mov ah, 4ch			; funcion 4C, finalizar ejecucion
int 21h				; interrupcion DOS

;======================================================================
	; funcion Ejes
	; muestra los ejes X y Y centrados en la pantalla

Ejes:
	mov es, word[startaddr]		;colocar direccion de segmento de video en ES
	mov ax, 10					;color verde = 10 (usar cualquier registro temporal para setearlo)

	;F(0,100) = x + y*320
	mov di, 32000				;y*320 = 100*320 = 32000
	add di, 0					;sumar x
	mov cx, 320					;contador (320 pixeles = una fila completa)
	
	hplot:
		mov [es:di], ax			;setear color al pixel
		inc di					;siguiente pixel
	loop hplot

	;F(160,0) = x + y*320
	mov di, 0					;y*320 = 0*320 = 0
	add di, 160					;sumar x
	mov cx, 100					;contador (100 pixeles = mitad de una columna)

	vplot1:
		mov [es:di],ax
		add di, 320				;siguiente pixel (cada fila tiene 320)
	loop vplot1

	;F(160,101) = x + y*320
	mov di, 32320				;y*320 = 101*320 = 32320
	add di, 160					;sumar x
	mov cx, 100					;contador (100 pixeles = mitad de una columna)

	vplot2:
		mov [es:di],ax 			;setear color al pixel
		add di, 320				;siguiente pixel (cada fila tiene 320)
	loop vplot2

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