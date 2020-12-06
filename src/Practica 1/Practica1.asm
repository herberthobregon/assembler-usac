;Debian 8.4 -Jessie


org 100h

section .data 
	;cadena de caracteres a imprimir en consola
	header: db 0ah,"*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*",0,0ah,0ah,"Universidad de San Carlos de Guatemala",0,0ah,"Faculta de Ingenieria",0,0ah,"Arquitectura de Computadores y Ensambladores 1",0,0ah, "Segundo Semestre 2016",0,0ah,"Seccion A",0,0ah, "Juan Ramon Veleche Bran",0,0ah,"201314076$",0,0ah,0ah
	cad1: db 0ah,0ah,"*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*$",0,0ah,0ah
	menu: db 0ah,0ah,9h,"1) Leer Archivo",0ah,0dh,9h,"2) Salir",0ah,0dh,24h
	msgPath: db 0ah,0ah,"Ingrese la ruta del archivo:",0ah,0dh,24h
	menu2: db 0ah,0ah,9h,"1) Obtener numeros pares",0ah,0dh,9h,"2) Obtener numeros impares",0ah,0dh,9h,"3) Obtener numeros primos",0ah,0dh,9h,"4) Ordenar ascendente",0ah,0dh,9h,"5) Ordenar descendente",0ah,0dh,9h,"6) Crear Archivo",0ah,0dh,9h,"7) Regresar",0ah,0dh,24h
	cadena: db '                                            $',0
	correcto: db 0ah,0ah,"Archivo Leido Correctamente",0ah,0dh,24h  
	errorLectua : db 0ah,0ah,"Error al leer el archivo",0ah,0dh,24h
	caracter1: db '0','$'
	caracter2: db '0','$'
	result: db 0
	coma: db ",$",0
	pyc: db ";$",0
	espacio: db ' ','$',0
	MsgImpares: db "Numeros Impares: ",0ah,0dh,24h
	MsgPares: db "Numeros Pares: ",0ah,0dh,24h
	MsgPrimos: db "Numeros Primos: ",0ah,0dh,24h
	Handler: dw 00h
	Handler2: dw 00h
	entero: dw 0,'$'
	uniTot: db 0
	cenTot: db 0
	decTot: db 0
	unidad: db 0
	residuo: db 0
	ValorTemporal: db 0
    resultado:   dw 0
    temp1: dw 0
    temp2: dw 0
    array: dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    posx: dw 0
    posy: dw 0
    MsgFile: db "RESULTADOS.RES", 0
    Numero_bytes: 	dw 00h
    sizeHeader2: equ $-header2
    header1: db "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*",0,10,13
    header2: db "Universidad de San Carlos de Guatemala",0,10,13
    header3: db "Faculta de Ingenieria",0,10,13
    header4: db "Arquitectura de Computadores y Ensambladores 1",0,10,13
    header5: db "Segundo Semestre 2016",0,10,13
    header6: db "Seccion A",0,10,13
    header7: db "Juan Ramon Veleche Bran",0,10,13
    header8: db "201314076",0,10,13
    MsgReporte: db "Reporte Salida: ",0,10,13
    DosP: db ":",0
    SaltoLinea:	db 0Ah
    espac: db ' ',0
    diagonal: db '/',0
	anio: db '16',0
	MsgPares_Archivo: db "Numeros Pares: ",0,10,13
	MsgImpares_Archivo: db "Numeros Impares: ",0,10,13
	MsgPrimos_Archivo: db "Numeros Primos: ",0,10,13
	MsgOriginal: db "Lista Original: ",0,10,13
	MsgA: db "Numeros orden ascendente: ",0,10,13
	MsgB: db "Numeros orden descendente: ",0,10,13

section .bss
	vector: resd 99
	vector_pares: resd 100

section .text
	global _start

_start:
	mov ah,00h		; limpiar pantalla
	mov al,03h
	int 10h			;llame a la interrupción de video

	mov ah,09h 		;activar la opción de impresión en pantalla
	mov dx,header   ;deposita en dx la cadena a imprimir 
	int 21h			;interrupción al kernel para la impresión de la cadena

	mov ah,09h
	mov dx,cad1
	int 21h

	mov ah,09h
	mov dx,menu
	int 21h

	call leer_opcion
ret

leer_opcion:
	
	mov ah,08h
	int 21h

	cmp al,31h
	je msg_path
	cmp al,32h
	je Salir
	jmp _start
ret

msg_path:
	
	mov ah,00h
	mov al,03h
	int 10h

	mov ah,09h
	mov dx,header
	int 21h

	mov ah,09h
	mov dx,cad1
	int 21h

	mov ah,09h
	mov dx,msgPath
	int 21h

	call recibir_entrada

ret

recibir_entrada: 
    mov bx,cadena
    mov dx, bx
    mov byte [bx],80
    mov ah,0ah
    int 21h
    mov al, [bx+1]
    add al,02
    xor ah, ah
    mov si, ax
    mov byte[bx+si],'$'
    jmp abrir_archivo
ret

abrir_archivo:
	mov ah,9h
	mov dx, cadena
	int 21h

	mov ah,8h
	int 21h

    mov word[Handler], 0
    mov ah,3dh ;Para Abri Archivo 
    mov al,2h ;0h solo lectura, 1h solo escritura, 2h lectura y escritura 
    mov dx, cadena+2
    int 21h
    jc  noexiste;Si el archivo no Existe
    mov [Handler], ax
    jmp OkArchivo ; si el archivo existe

    noexiste:
        mov dx, errorLectua ; muestra un mensaje de error
        mov ah,9h
        int 21h

        mov ah,8h
        int 21h
        jmp _start ;se regresa al menu inicial

    OkArchivo:

    	mov ah,00h
		mov al,03h
		int 10h

		mov ah,09h
		mov dx,header
		int 21h

		mov ah,09h
		mov dx,cad1
		int 21h

    	mov ah,9h
        mov dx, correcto
        int 21h

        mov ah,08h
        int 21h

        call imprimir_menu2
        
ret


imprimir_menu2:

	mov ah,00h
	mov al,03h
	int 10h

	mov ah,09h
	mov dx,header
	int 21h

	mov ah,09h
	mov dx,cad1
	int 21h

	mov ah,09h
	mov dx,menu2
	int 21h

	call leer_opcion2

ret

leer_opcion2:
	
	mov ah,08h
	int 21h

	cmp al,31h
	je obtener_pares
	cmp al,32h
	je obtener_impares
	cmp al,33h
	je obtener_primos
	cmp al,34h
	je ordenar_ascendente
	cmp al,35h
	je ordenar_descendente
	cmp al,36h
	je escribir_archivo
	cmp al,37h
	je _start
	jmp imprimir_menu2
ret

obtener_pares:
    call openFile
    mov ah ,00h
    mov al,03h
    int 10h

    mov dx, MsgPares
    mov ah,9h
    int 21h
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx
    mov eax,0
    mov ebx,0
    mov ecx,0

    mov bx,'0$'
    mov [caracter2],bx
    mov ebx,vector_pares

    encontrarPar:
        ;lectura del archivo
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error

        mov cx, 1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        jne analizar_pc_p
        je encontrarPar

        analizar_pc_p:
            mov cx,1
            lea si,[pyc]
            lea di,[caracter1]
            repe cmpsb
            je salirPares

            xor ah,ah 	;limpio los registros ah, dx, y bx
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler]
        	mov cx, 1
        	mov dx, caracter2
        	int 21h 

            mov cx, 1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i_p

        	mov cx,1
        	lea si,[pyc]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i_p
        	jmp imprimir_numero_ii_p
        ret

        imprimir_numero_i_p:
            mov ax,[caracter1]
            and ax,1
            jnz encontrarPar
            jmp esPar
            esPar:
            	mov ah,9h
            	mov dx,caracter1
            	int 21h

        		mov ecx,caracter1
        		mov [ebx],ecx
        		add ebx,1

            	mov cx, 1
        		lea si,[coma]
        		lea di,[caracter2]
        		repe cmpsb
        		je saltoi_p

        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		je salirPares

        		jmp encontrarPar
        	ret

                saltoi_p:
                	mov ah,9h
                	mov dx, espacio
                	int 21h

        			mov ecx,espacio
        			mov [ebx],ecx
        			add ebx,1

                	jmp encontrarPar
                ret
        ret

        imprimir_numero_ii_p:

            mov ax,[caracter2]
            and ax,1
            jnz encontrarPar
            jmp esPari
            esPari:

            	mov ah,9h
            	mov dx,caracter1
            	int 21h

        		mov ecx,caracter1
        		mov [ebx],ecx
        		add ebx,1

            	mov ah,9h
                mov dx, caracter2
                int 21h

        		mov ecx,caracter2
        		mov [ebx],ecx
        		add ebx,1

                mov dx, espacio
                mov ah,9h
                int 21h

        		mov ecx,espacio
        		mov [ebx],ecx
        		add ebx,1

                jmp encontrarPar
            ret
        ret

        salirPares:
   
            mov ah,8h
            int 21h
            call Close_File
            jmp imprimir_menu2
        ret
ret

obtener_impares:
    call openFile
    mov ah ,00h
    mov al,03h
    int 10h

    mov dx, MsgImpares
    mov ah,9h
    int 21h
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    mov bx,'0$'
    mov [caracter2],bx

    encontrarImpar:
        ;lectura del archivo
       	mov cx,1
       	lea si,[pyc]
        lea di,[caracter2]
        repe cmpsb
        je salirImpares
        jne Seguir

    Seguir:
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error 

        mov cx, 1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        jne analizar_pc
        je encontrarImpar

        analizar_pc:
            mov cx,1
            lea si,[pyc]
            lea di,[caracter1]
            repe cmpsb
            je salirImpares

            xor ah,ah 	;limpio los registros ah, dx, y bx
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler]
        	mov cx, 1
        	mov dx, caracter2
        	int 21h 

            mov cx, 1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i

        	mov cx,1
        	lea si,[pyc]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i
        	
        	jmp imprimir_numero_ii

        imprimir_numero_i:
            mov ax,[caracter1]
            and ax,1
            jz encontrarImpar
            jmp esImpar

            esImpar:
            	mov ah,9h
            	mov dx,caracter1
            	int 21h

            	mov cx, 1
        		lea si,[coma]
        		lea di,[caracter2]
        		repe cmpsb
        		je saltoi

        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		je salirImpares

        		jmp encontrarImpar

                saltoi:
                	mov ah,9h
                	mov dx, espacio
                	int 21h
        			jmp encontrarImpar
        		ret
        	ret
       	ret

        imprimir_numero_ii:
            mov ax,[caracter2]
            and ax,1
            jz encontrarImpar
            jmp esImpari
            esImpari:

            	mov ah,9h
            	mov dx,caracter1
            	int 21h

            	mov ah,9h
                mov dx, caracter2
                int 21h

                mov dx, espacio
                mov ah,9h
                int 21h

                jmp encontrarImpar
            ret
        ret

        salirImpares:

            mov ah,8h
            int 21h
            call Close_File
            jmp imprimir_menu2
        ret
ret

obtener_primos:
	call openFile
    mov ah ,00h
    mov al,03h
    int 10h

    mov dx, MsgPrimos
    mov ah,9h
    int 21h
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    unir_numero:
    	;lectura del archivo
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error

        mov cx,1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        je unir_numero

        mov cx,1
        lea si,[pyc]
        lea di,[caracter1]
        repe cmpsb
        je SalirPrimos

        jmp leer_cifra2

        leer_cifra2:

        	xor ah,ah
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler]
        	mov cx,1
        	mov dx,caracter2
        	int 21h

        	mov cx,1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	jne and2
        	je imprimirNum1

        	and2:
        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		jne imprimirNum2
        		je SalirPrimos
        	ret

        	imprimirNum1:
        		call AsciiToDecimal1 		;llama a etiqueta que convierte el ascii a decimal

        		call calcularPrimo 			;etiqueta encargada de verificar la primalida de un numero

        		cmp cx,1d					;¿contador igual a 1?
        		je ip1 						;sí, salto a impresion del numero primo
        		jmp  unir_numero 			;no, regrese para analizar los siguientes números

        		ip1:
        			call DecimalToAscii1 	;llamada a procedimiento

					mov ah,9h				;macro para imprimir en pantalla
					mov dx, espacio 		;imprime un espacio en blanco
        			int 21h					;llamada al kernel

        			jmp unir_numero 		;salta a etiqueta inicial
        		ret
        	ret

        	imprimirNum2:
        		
        		;mov ah,9h
        		;mov dx,caracter1
        		;int 21h

        		;mov ah,9h
        		;mov dx,caracter2
        		;int 21h

        		call AsciiToDecimal2

        		call calcularPrimo

        		cmp cx,1d
        		je imprimir_primo
        		jmp unir_numero

        		imprimir_primo:
        			call DecimalToAscii2
        			
        			mov ah,9h
        			mov dx,espacio
        			int 21h

        			jmp unir_numero
        		ret
       	ret
    ret 

    SalirPrimos:
    	call AsciiToDecimal1

    	call calcularPrimo

    	cmp cx,1d
    	je ip2
    	jmp sout
    	ip2:
			call DecimalToAscii1

    		mov ah,8h
    		int 21h

    		call Close_File
    		jmp imprimir_menu2
    	ret

    	sout:
    		mov ah,8h			;macro para escribir en pantall
    		int 21h				;llamada al kernel

    		call Close_File 	;se cierra el archivo 
    		jmp imprimir_menu2 	
    	ret
    ret
ret

ordenar_ascendente:

	call meter_num_vector
	
	mov ecx,0
	mov ebx,vector
	mov eax,0
	mov edx,0

	iterar_ciclo:

		mov ebx,vector
		mov ecx,[ebx+eax*4]
		mov edx,ecx
		
	incrementar_ciclo:
		inc edx

		cmp edx,99d	;preguntar si es el mayor
		jz salir_orden
		
		mov [temp1],edx; cambio del valor
		mov [temp2],ecx

		mov al,[temp1]	;para poder hacer la comparacion
		mov ah,[temp2]

		cmp al,ah
		ja incrementar_ciclo

		call DecimalToAscii2
		mov ah,9h
		mov dx,espacio
		int 21h

	salir_orden:
		inc eax
		cmp si,50d
		jnz iterar_ciclo


		mov ah,8h
		int 21h

		jmp imprimir_menu2
ret

ordenar_descendente:
	call meter_num_vector

	jmp imprimir_menu2
ret

meter_num_vector:

	call openFile
    mov ah ,00h
    mov al,03h
    int 10h

    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    mov cx,0

    mov ebx,vector
    mov ecx,1
    mov eax,0

    nv:
    	;lectura del archivo
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error

        mov cx,1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        je nv

        mov cx,1
        lea si,[pyc]
        lea di,[caracter1]
        repe cmpsb
        je SalirVector

        jmp leer_cifra2p

        leer_cifra2p:

        	xor ah,ah
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler]
        	mov cx,1
        	mov dx,caracter2
        	int 21h

        	mov cx,1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	jne and2p
        	je imprimirNum1p

        	and2p:
        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		jne imprimirNum2p
        		je SalirVector
        	ret

        	imprimirNum1p:
        		call AsciiToDecimal1 		;llama a etiqueta que convierte el ascii a decimal

        		mov ah,9h
        		mov dx,espacio
        		int 21h

        		mov ebx,vector
        		mov ecx,[resultado]
        		mov [ebx+eax*4],ecx
        		add eax,1

        		call DecimalToAscii1
        		jmp  nv 			

        		
        	ret

        	imprimirNum2p:
        		call AsciiToDecimal2

        		mov ah,9h
        		mov dx,espacio
        		int 21h

        		mov ebx,vector
        		mov ecx,[resultado]
        		mov [ebx+eax*4],ecx
        		add eax,1

        		call DecimalToAscii2
        		jmp nv
            ret
       	ret
    ret 

    SalirVector:
    	mov ah,9h
    	mov dx, espacio
    	int 21h

    	call AsciiToDecimal1

    	mov ebx,vector
    	mov ecx,[resultado]
        mov [ebx+eax*4],ecx
        add eax,1

    	call DecimalToAscii1

    	mov ah,8h			;macro para escribir en pantall
    	int 21h				;llamada al kernel

    	call Close_File 	;se cierra el archivo 
    ret
ret

escribir_archivo:
	mov ah,3ch
	mov cx,0
	mov dx,MsgFile
	int 21h
	jc Salir_Error

	mov bx,[Handler]
	mov ah,3eh ;cierra el archivo
	int 21h	

	call abrir_paraEscribir

	mov si,header1
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header1
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header2
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header2
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido
	
	mov si,header3
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header3
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header4
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header4
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header5
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header5
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header6
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header6
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header7
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header7
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header8
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header8
	call Escribir_Contenido

	
	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,header1
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,header1
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,MsgReporte
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,MsgReporte
	call Escribir_Contenido

	mov ah,2ch
	int 21h

	mov [resultado],ch
	call DecimalToAscii2

	mov si,caracter1
	mov cx,1
	mov dx,caracter1
	call Escribir_Contenido

	mov si,caracter2
	mov cx,1
	mov dx,caracter2
	call Escribir_Contenido

	mov si,DosP
	mov cx,1
	mov dx,DosP
	call Escribir_Contenido

	mov ah,2ch
	int 21h

	mov [resultado],cl
	call DecimalToAscii2

	mov si,caracter1
	mov cx,1
	mov dx,caracter1
	call Escribir_Contenido

	mov si,caracter2
	mov cx,1
	mov dx,caracter2
	call Escribir_Contenido

	mov si,espac
	mov cx,1
	mov dx,espac
	call Escribir_Contenido

	mov ah,2Ah
	int 21h

	mov [resultado],dl
	call DecimalToAscii2

	mov si,caracter1
	mov cx,1
	mov dx,caracter1
	call Escribir_Contenido

	mov si,caracter2
	mov cx,1
	mov dx,caracter2
	call Escribir_Contenido	

	mov si,diagonal
	mov cx,1
	mov dx,diagonal
	call Escribir_Contenido	

	mov ah,2Ah
	int 21h

	mov [resultado],dh
	call DecimalToAscii2

	mov si,caracter1
	mov cx,1
	mov dx,caracter1
	call Escribir_Contenido

	mov si,caracter2
	mov cx,1
	mov dx,caracter2
	call Escribir_Contenido

	mov si,diagonal
	mov cx,1
	mov dx,diagonal
	call Escribir_Contenido

	mov si,anio
	mov cx,2
	mov dx,anio
	call Escribir_Contenido

	mov cx,1
	mov dx,SaltoLinea
	call Escribir_Contenido

	mov si,MsgOriginal
	call Obtener_Numero_Bytes
	mov cx,[Numero_bytes]
	mov dx,MsgOriginal
	call Escribir_Contenido

	call imprimir_lista_original

	call Close_File


	jmp imprimir_menu2

ret

abrir_paraEscribir:
	mov word[Handler], 0
	mov ah,3dh ;Para Abri Archivo 
	mov al,2h ;0h solo lectura, 1h solo escritura, 2 lectura y escritura 
	mov dx, MsgFile
	int 21h
	jc  escribir_archivo ;Si el archivo no Existe
    mov [Handler], ax
ret

Obtener_Numero_Bytes:
    mov word [Numero_bytes], 0
    ContadordeCaracters:
        mov al, [si]
        mov bl, 0
        cmp al, bl
        je Salida_NumeroBytes
        
        add si, 1
        inc word [Numero_bytes]        
        jmp ContadordeCaracters
        
    Salida_NumeroBytes:
ret

Escribir_Contenido:
	mov ah,40h
	mov bx,[Handler]
	int 21h
ret

openFile:
    mov word[Handler], 0
    mov ah,3dh 			;macro para Abri Archivo 
    mov al,2h 			;0h solo lectura, 1h solo escritura, 2 lectura y escritura 
    mov dx, cadena+2 	;se obtiene la path de la variable
    int 21h				; llamada al kernel
    mov [Handler], ax 	;se guarda en el Handler el contenido del archivo
ret

openFile2:
    mov word[Handler2], 0
    mov ah,3dh 			;macro para Abri Archivo 
    mov al,2h 			;0h solo lectura, 1h solo escritura, 2 lectura y escritura 
    mov dx, cadena+2 	;se obtiene la path de la variable
    int 21h				; llamada al kernel
    mov [Handler2], ax 	;se guarda en el Handler el contenido del archivo
ret

Close_File2:
	call Seek_End2
	mov bx,[Handler2]
	mov ah,3eh
	int 21h
ret

Seek_End2:
	mov ah,42h
	mov al,2
	mov bx,[Handler2]
	mov cx,0
	mov dx,0
	int 21h
ret

Close_File:
    call Seek_End 		;envia el puntero al final del archivo
    mov bx,[Handler]	;variable que contiene el abrir_archivo
    mov ah,3eh 			;cierra el archivo
    int 21h				;llamada al kernel
ret

Seek_End:
    mov ah, 42h         ;mueve el puntero del archivo
    mov al, 2           ;lo envia al final
    mov bx, [Handler]	;el archiov que se leera
    mov cx, 0           ;desplazamiento
    mov dx, 0
    int 21h   
ret

Salir_Error:
    jmp imprimir_menu2
ret

DecimalToAscii2:
	;se limpian los registors
	xor ah, ah
    xor al, al
    xor ax, ax
	xor dl,dl

    ;decenas
    mov ax, [resultado]	;se mueve ax el valor del dividendo
    mov bl, 10d			;se mueve a bl el valor del divisor
    div bl				;se efectual la división


 	mov [decTot], al	;al almacena el valor del cociente
 	mov [uniTot], ah	;ah almacena el valor del residuo

 	mov ah,02h			;macro para impresión
	mov dl, [decTot]	;se mueve a dl el valor de las decenas
	add dl,30h			;se convierte la decena de decimal a ascii
	mov [caracter1],dl
	int 21h				;llamada al kernel

	mov ah, 02h
	mov dl, [uniTot]	;se mueve a dl el valor de la unidad
	add dl,30h			;se convierte la unidad de deicmal a ascii
	mov [caracter2],dl
	int 21h				;llamda al kernel
ret

AsciiToDecimal2:
	
	mov dx,0d			;se mueve a dx el valor de 0 decimal
    mov [resultado],dx	;se inicializa la variable donde se guardara la conversión en cero

    ;limpieza de registros
	xor al,al
	xor bl,bl
	xor ax,ax
	
	mov al, 10			;se mueve a al 10 para sumar decenas
	mov bl, [caracter1]	;se obtiene el valor de la decena
	sub bl, 30h 		;se convierte el valor de la decena de ascii a decimal
	mul bl				;se multiplica el valor de la decena por 10
	add [resultado], ax	;se agrega el resultado a la variable

	mov bl, [caracter2]	;se mueve a bl el valor de la unidad, por se unidad no es necesario multiplicarlo por 10
	sub bl, 30h 		;se convierte el valor de la unidad de ascii a decimal
	add [resultado], bl ;se suma el valo de la unidad al resulado
ret

DecimalToAscii1:
	xor ah, ah
    xor al, al
    xor ax, ax
	xor dl,dl

    mov ax, [resultado]
 	mov [uniTot], ax

	mov ah, 02h
	mov dl, [uniTot]
	add dl,30h
	mov [caracter1],dl
	int 21h
ret

AsciiToDecimal1:
	mov dx,0d
    mov [resultado],dx

	xor al,al
	xor bl,bl
	xor ax,ax

	mov bl, [caracter1]
	sub bl, 30h 	
	add [resultado], bl
ret

calcularPrimo:

	mov dl,[resultado]				;se inicializa el iterador en el valor del numero para ir decrementando el ciclo
	mov cx,0d						;se inicializa el contador en 0

	iterar:

		mov bl,dl					;se mueve a bl el valor del numero para iniciar la division, el valor de bl irá de n a 0
		mov ax,[resultado]			;se mueve a ax el dividendo	
		div bl						; se efectua la division al=igual al cocinete, ah=igual al residuo

		cmp ah,0d					;¿residuo es 0? 
		je contar 					;sí, entonces ya tiene un divisor aumentar contador cx
		jmp contar_interador 		;no, entonces seguir con el ciclo y disminuir el iterador

		contar: 
			inc cx					;incrementar contador
			jmp contar_interador 	;decrementar iterador
		ret
		
		contar_interador:
			dec dl					;decrementar iterador
			cmp dl,1d				;condicion de salida del ciclo
			je salir_primo 			;sí,salir del ciclo
			cmp dl,0d				;condicion especial para 1, ya que 1 no es un primo al decrementar el iterador es el único número que cumpliriía con esa condición
			je esUno 				;sí, significa que el número evaluado es un 1
			jmp iterar 				;no cumple con ninguna condición, seguir con el ciclo
		ret

	esUno:
		inc cx
	ret
		
	ret
	salir_primo:
	ret
ret

imprimir_pares:

    call openFile2

    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx
    mov eax,0
    mov ebx,0
    mov ecx,0

    mov bx,'0$'
    mov [caracter2],bx

    encontrarParp:
        ;lectura del archivo
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler2]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error

        mov cx, 1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        jne analizar_pc_pp
        je encontrarParp

        analizar_pc_pp:
            mov cx,1
            lea si,[pyc]
            lea di,[caracter1]
            repe cmpsb
            je salirParesp

            xor ah,ah 	;limpio los registros ah, dx, y bx
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler2]
        	mov cx, 1
        	mov dx, caracter2
        	int 21h 

            mov cx, 1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i_pp

        	mov cx,1
        	lea si,[pyc]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_i_pp
        	jmp imprimir_numero_ii_pp
        ret

        imprimir_numero_i_pp:
            mov ax,[caracter1]
            and ax,1
            jnz encontrarParp
            jmp esParp
            esParp:

            	mov si,caracter1
            	mov cx,1
            	mov dx,caracter1
            	call Escribir_Contenido

            	mov cx, 1
        		lea si,[coma]
        		lea di,[caracter2]
        		repe cmpsb
        		je saltoi_pp

        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		je salirParesp
        		jmp encontrarParp
        	ret

                saltoi_pp:

                	mov si,espac
                	mov cx,1
                	mov dx,espac
                	call Escribir_Contenido

                	jmp encontrarParp
                ret
        ret

        imprimir_numero_ii_pp:

            mov ax,[caracter2]
            and ax,1
            jnz encontrarParp
            jmp esParip
            esParip:

            	mov si,caracter1
            	mov cx,1
            	mov dx,caracter1
            	call Escribir_Contenido


            	mov si,caracter2
            	mov cx,1
            	mov dx,caracter2
            	call Escribir_Contenido

                mov si,espac
            	mov cx,1
            	mov dx,espac
            	call Escribir_Contenido

                jmp encontrarParp
            ret
        ret

        salirParesp:
            call Close_File2

            mov si,MsgImpares_Archivo
			call Obtener_Numero_Bytes
			mov cx,[Numero_bytes]
			mov dx,MsgImpares_Archivo
			call Escribir_Contenido

            call imprimir_impares

            jmp imprimir_menu2
        ret
ret

imprimir_impares:

    call openFile2
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    mov bx,'0$'
    mov [caracter2],bx

    encontrarImpari:
        ;lectura del archivo
       	mov cx,1
       	lea si,[pyc]
        lea di,[caracter2]
        repe cmpsb
        je salirImparesi
        jne Seguiri

    Seguiri:
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler2]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error 

        mov cx, 1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        jne analizar_pci
        je encontrarImpari

        analizar_pci:
            mov cx,1
            lea si,[pyc]
            lea di,[caracter1]
            repe cmpsb
            je salirImparesi

            xor ah,ah 	;limpio los registros ah, dx, y bx
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler2]
        	mov cx, 1
        	mov dx, caracter2
        	int 21h 

            mov cx, 1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_iip

        	mov cx,1
        	lea si,[pyc]
        	lea di,[caracter2]
        	repe cmpsb
        	je imprimir_numero_iip
        	
        	jmp imprimir_numero_iii

        imprimir_numero_iip:
            mov ax,[caracter1]
            and ax,1
            jz encontrarImpari
            jmp esImparip

            esImparip:
            	mov si,caracter1
            	mov cx,1
            	mov dx,caracter1
            	call Escribir_Contenido

            	mov cx, 1
        		lea si,[coma]
        		lea di,[caracter2]
        		repe cmpsb
        		je saltoii

        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		je salirImparesi

        		jmp encontrarImpari

                saltoii:
                	mov si,espac
            		mov cx,1
            		mov dx,espac
            		call Escribir_Contenido

        			jmp encontrarImpari
        		ret
        	ret
       	ret

        imprimir_numero_iii:
            mov ax,[caracter2]
            and ax,1
            jz encontrarImpari
            jmp esImparii
            esImparii:

            	mov si,caracter1
            	mov cx,1
            	mov dx,caracter1
            	call Escribir_Contenido

            	mov si,caracter2
            	mov cx,1
            	mov dx,caracter2
            	call Escribir_Contenido

                mov si,espac
            	mov cx,1
            	mov dx,espac
            	call Escribir_Contenido

                jmp encontrarImpari
            ret
        ret

        salirImparesi:
            call Close_File2

            mov cx,1
            mov dx,SaltoLinea
            call Escribir_Contenido

            mov si, MsgPrimos_Archivo
            call Obtener_Numero_Bytes
            mov cx,[Numero_bytes]
            mov dx,MsgPrimos_Archivo
            call Escribir_Contenido

            call imprimir_primos_archivo

            jmp imprimir_menu2
        ret
ret

imprimir_primos_archivo:

	call openFile2
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    unir_numerop:
    	;lectura del archivo
        xor ah,ah 	;limpio los registros ah, dx, y bx
        xor dx,dx
        xor bx,bx
        mov ah,3fh
        mov bx,[Handler2]
        mov cx, 1
        mov dx, caracter1
        int 21h 
        jc Salir_Error

        mov cx,1
        lea si,[coma]
        lea di,[caracter1]
        repe cmpsb
        je unir_numerop

        mov cx,1
        lea si,[pyc]
        lea di,[caracter1]
        repe cmpsb
        je SalirPrimosp

        jmp leer_cifra2pp

        leer_cifra2pp:

        	xor ah,ah
        	xor dx,dx
        	xor bx,bx
        	mov ah,3fh
        	mov bx,[Handler2]
        	mov cx,1
        	mov dx,caracter2
        	int 21h

        	mov cx,1
        	lea si,[coma]
        	lea di,[caracter2]
        	repe cmpsb
        	jne and2pp
        	je imprimirNum1pp

        	and2pp:
        		mov cx,1
        		lea si,[pyc]
        		lea di,[caracter2]
        		repe cmpsb
        		jne imprimirNum2pp
        		je SalirPrimosp
        	ret

        	imprimirNum1pp:
        		call AsciiToDecimal1 		;llama a etiqueta que convierte el ascii a decimal

        		call calcularPrimo 			;etiqueta encargada de verificar la primalida de un numero

        		cmp cx,1d					;¿contador igual a 1?
        		je ip1p 					;sí, salto a impresion del numero primo
        		jmp  unir_numerop			;no, regrese para analizar los siguientes números

        		ip1p:
        			xor ah, ah
				    xor al, al
				    xor ax, ax
					xor dl,dl

				    mov ax, [resultado]
				 	mov [uniTot], ax

					mov dl, [uniTot]
					add dl,30h
					mov [caracter1],dl

					mov si,caracter1
					mov cx,1
					mov dx,caracter1
					call Escribir_Contenido

					mov si, espac
					mov cx,1
					mov dx,espac
					call Escribir_Contenido

        			jmp unir_numerop 		;salta a etiqueta inicial
        		ret
        	ret

        	imprimirNum2pp:

        		call AsciiToDecimal2

        		call calcularPrimo

        		cmp cx,1d
        		je imprimir_primop
        		jmp unir_numerop

        		imprimir_primop:
        			
        			xor ah, ah
				    xor al, al
				    xor ax, ax
					xor dl,dl

        			mov ax, [resultado]	;se mueve ax el valor del dividendo
				    mov bl, 10d			;se mueve a bl el valor del divisor
				    div bl				;se efectual la división


				 	mov [decTot], al	;al almacena el valor del cociente
				 	mov [uniTot], ah	;ah almacena el valor del residuo

					mov dl, [decTot]	;se mueve a dl el valor de las decenas
					add dl,30h			;se convierte la decena de decimal a ascii
					mov [caracter1],dl	

					mov si,caracter1
					mov cx,1
					mov dx,caracter1
					call Escribir_Contenido

					mov dl, [uniTot]	;se mueve a dl el valor de la unidad
					add dl,30h			;se convierte la unidad de deicmal a ascii
					mov [caracter2],dl

					mov si,caracter2
					mov cx,1
					mov dx,caracter2
					call Escribir_Contenido
        			
        			mov si,espac
        			mov cx,1
        			mov dx,espac
        			call Escribir_Contenido

        			jmp unir_numerop
        		ret
       	ret
    ret 

    SalirPrimosp:
    	call AsciiToDecimal1

    	call calcularPrimo

    	cmp cx,1d
    	je ip2p
    	jmp soutp
    	ip2p:
			xor ah, ah
			xor al, al
			xor ax, ax
			xor dl,dl

			mov ax, [resultado]
			mov [uniTot], ax

			mov dl, [uniTot]
			add dl,30h
			mov [caracter1],dl

			mov si,caracter1
			mov cx,1
			mov dx,caracter1
			call Escribir_Contenido

			mov si, espac
			mov cx,1
			mov dx,espac
			call Escribir_Contenido

			mov cx,1
    		mov dx,SaltoLinea
    		call Escribir_Contenido


    		mov si,MsgA
    		call Obtener_Numero_Bytes
    		mov cx,[Numero_bytes]
    		mov dx,MsgA
    		call Escribir_Contenido

    		mov cx,1
    		mov dx,SaltoLinea
    		call Escribir_Contenido

    		mov si,MsgB
    		call Obtener_Numero_Bytes
    		mov cx,[Numero_bytes]
    		mov dx,MsgB
    		call Escribir_Contenido


    		call Close_File2
    		jmp imprimir_menu2
    	ret

    	soutp:				

    		call Close_File2 	;se cierra el archivo 
    		mov cx,1
    		mov dx,SaltoLinea
    		call Escribir_Contenido


    		mov si,MsgA
    		call Obtener_Numero_Bytes
    		mov cx,[Numero_bytes]
    		mov dx,MsgA
    		call Escribir_Contenido

    		mov cx,1
    		mov dx,SaltoLinea
    		call Escribir_Contenido

    		mov si,MsgB
    		call Obtener_Numero_Bytes
    		mov cx,[Numero_bytes]
    		mov dx,MsgB
    		call Escribir_Contenido

    		jmp imprimir_menu2 	
    	ret
    ret
ret

imprimir_lista_original:
	
	call openFile2
    xor dx, dx
    xor ax, ax
    xor cx, cx
    xor bx, bx

    leer_caracter_archivo:
    	xor ah,ah 	;limpio los registros ah, dx, y bx
	    xor dx,dx
	    xor bx,bx
		mov ah,3fh
	    mov bx,[Handler2]
	    mov cx, 1
	    mov dx, caracter1
	    int 21h 
	    jc Salir_Error

		mov cx,1
	    lea si,[coma]
	    lea di,[caracter1]
	    repe cmpsb
	    je escribir_espacio

	    mov cx,1
	    lea si,[pyc]
	    lea di,[caracter1]
	    repe cmpsb
	    je salir_lista_original

	    jmp escribir_caracter

	    escribir_espacio:

	    	mov si,espac
	    	mov cx,1
	    	mov dx,espac
	    	call Escribir_Contenido

	    	jmp leer_caracter_archivo
	    ret

	    escribir_caracter:

	    	mov si,caracter1
	    	mov cx,1
	    	mov dx,caracter1
	    	call Escribir_Contenido

	    	jmp leer_caracter_archivo
	    ret
	ret

	salir_lista_original:

		call Close_File2

		mov cx,1
		mov dx,SaltoLinea
		call Escribir_Contenido

		mov si,MsgPares_Archivo
		call Obtener_Numero_Bytes
		mov cx,[Numero_bytes]
		mov dx,MsgPares_Archivo
		call Escribir_Contenido

		call imprimir_pares

		jmp imprimir_menu2
	ret
ret

Salir:
	mov ah,04ch		;termina el programa
	int 21h			;llama el kernel para realizar la acción
ret



