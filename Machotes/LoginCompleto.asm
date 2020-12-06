; Universidad de San Carlos de Guatemala
; Herberth Guillermo Obregón Espino
; Arquitectura de computadores y ensambladores 1
; Seccion B
;|======================================================================|
;|				F	U	N	C	T	I	O	N	S						|				       |
;|======================================================================|
%macro write_archivo 3
	mov dx, %1 		; prepara la ruta del archivo
	mov ah, 3ch 	; funcion 3c, crear un archivo
	mov cx, 0 		; crear un archivo normal
	int 21h 		; interrupcion DOS

	mov bx, ax  	; se guarda el puntero del archivo retornado de la funcion
	mov ah, 40h  	; funcion 40, escribir un archivo
	mov cl, %2
	mov dx, %3  	; preparacion del texto a escribir
	int 21h  		; interrupcion DOS

	mov ah, 3eh  	; funcion 3e, cerrar un archivo
	int 21h  		; interrupcion DOS
%endmacro

%macro println 1
	mov dx, %1			; coloca direccion de cadena en dx
	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	int 21h				; interrupcion DOS
%endmacro

%macro printlnWait 1
	println mEnter

	mov dx, %1			; coloca direccion de cadena en dx
	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	int 21h				; interrupcion DOS

	call readline
%endmacro

;%macro readBytesFile 1
;Lectura de Fichero o dispositivo
;LLAMADA:
;AH = 3FH
;BX = Handle.
;CX = Número de bytes a leer.
;DS:DX = Segmento: Desplazamiento del buffer donde se depositarán los caracteres leídos
 
;DEVUELVE:
;Si se ejecutó correctamente: Flag de acarreo (Cf) = 0
;AX = Bytes transferidos
;Si NO se ejecutó correctamente: Flag de acarreo (Cf) = 1
;AX = Código de error.
;	xor ah,ah
;	xor dx,dx
;	xor bx,bx
;	xor cx,cx
;	mov ah, 3Fh			; Lectura de fichero
;	mov bx, [Handler]	; Le mando el handler del fichero
;	mov cx, %1			; Numero_bytes por leer
;	mov dx, mBufferNameReg
;	int 21h				; interrupcion DOS
;	jc Salir_Error
;%endmacro

ORG 100h
section .text
	global _start


_start:
	call cls
	println mHeader			; Imprime el Header
	printlnWait mMenu		; Imprime el Header y espera el input
	call comparar_entrada

ret

_startAdmin:
	call cls
	println mHeader			; Imprime el Header
	printlnWait mMenuAdmin	; Imprime el Header y espera el input
	call comparar_entrada
ret

cls:
	mov ah,00h 			;modo video
	mov al,03h			;03 Video Normal
	int 10h 			;servicio de pantalla
ret

error_usuario_NoPermitido:
	println mEnter
	println mUsuarioNoPermitido
	call readline
ret

error_pass_NoPermitido:
	println mEnter
	println mPassNoPermitido
	call readline
ret
readline:
	;(si AH =08H) es servicio sin Echo)
	;AH = 01H es servicio con Echo)
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS
ret

readlineEcho:
	;mov ah,08h es servicio sin Echo)
	;mov ah,01h es servicio con Echo)
	;return
	;al = Código ASCII del Carácter leído y Echo a pantalla
	mov ah,01h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS
ret

Salir:
	call cls
	mov ah,04ch		;termina el programa
	int 21h			;llama el kernel para realizar la acción
ret

oArchUsuarios:
	mov word[Handler], 0
	mov ah,3dh 				;Para Abrir un Archivo
	mov al,2h 				;0h solo lectura, 1h solo escritura, 2 lectura y escritura
	mov dx, userstxt
	int 21h					; interrupcion DOS
	mov [Handler], ax
ret

Escribir_Archivo:
	mov ah,40h			; Escritura en Fichero o dispositivo.
	mov bx,[Handler]
	int 21h				; interrupcion DOS
ret

Seek_End:

	mov ah, 42h         ;mov file pointer
	mov al, 2           ;set to end
	mov bx, [Handler]			; Le mando el handler del fichero
	mov cx, 0           ;desplazamiento
	mov dx, 0
	int 21h				; interrupcion DOS
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

Error_Cerrar_Archivo:

	printlnWait mErrorCerrarArchivo
ret

Usuario_Duplicado:

	printlnWait errorUsarioDuplicado

	call Close_File

	mov dx,00h
	mov [Handler],dx

	jmp _start
ret

Solo_Numeros:

	printlnWait mErrorSoloNumPass
ret

Close_File:
	call Seek_End			; Se va al final del archivo para comenzar a escribir 		;envia el puntero al final del archivo
	mov bx,[Handler]	;variable que contiene el abrir_archivo
	mov ah,3eh 			;cierra el archivo
	int 21h				; interrupcion DOS
	jc Error_Cerrar_Archivo
ret

Salir_Error:
		printlnWait MsgError
		jmp _start
ret

LimpiarVariables:
	mov word [Handler], 00h
	mov di, 0			; Inicializa cont = 0
	RegresarUsuario:
		mov si, 0
		mov si, mUserLogin
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, mUserRegistro
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, mUsuario
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, mBufferNameReg
		add si, di
		mov byte[si], ' '

		inc di			; contador++
		cmp di, 5
	jl RegresarUsuario
	mov byte [si], '$'


	mov di, 0			; Inicializa cont = 0
	RegresarPassword:
		mov si, 0
		mov si, mPasswordLogin
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, mPasswordRegistro
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, mPasswordR
		add si, di
		mov byte[si], ' '

		inc di			; contador++
		cmp di, 5
	jl RegresarPassword
	mov byte [si], '$'
ret


;======================================================================|
;							D 	A 	T 	A 						       |
;======================================================================|


section .data
	mHeader db "|=====================================================|",0,0ah,"| Universidad de San Carlos de Guatemala              |",0,0ah,"| Faculta de Ingenieria                               |",0,0ah,"| Arquitectura de Computadores y Ensambladores 1      |",0,0ah,"| Seccion B                                           |",0,0ah, "| Herberth Guillermo Obregon Espino                   |",0,0ah,"| 201314237                                           |",0,0ah,"|=====================================================|",0,0ah,"$"
	mMenu db 0ah,0ah,9h,"1. Ingresar",0ah,0dh,9h,"2. Registrarse",0ah,0dh,9h,"3. Salir",0ah,0dh,24h,"Eliga una opcion:",0ah,0dh,24h
	mMenuAdmin db 0ah,0ah,9h,"1. Top 10 puntos",0ah,0dh,9h,"2. Top 10 tiempos",0ah,0dh,9h,"3. Salir",0ah,0dh,24h,"Eliga una opcion:",0ah,0dh,24h
	mEnter db 0Ah,'$'
	userstxt: db "USUARIOS.TXT", 0
	; Registro de usuario
	mMsgRegistro db 9h,9h,"Registro de un nuevo Usuario",0ah,0dh,24h
	mIngreseUsuario: db "Ingrese el nombre de usuario: $"
	mUsuarioNoPermitido: db "Usuario no Permitido$", 0ah,0dh,24h

	mIngresePassword: db "Ingrese su contrasenia:$ "
	mErrorSoloNumPass db "Solo se aceptan numeros$", 0ah,0dh,24h
	mMsgExito db "Usuario registrado exitosamente! $",0ah,0dh,24h
	mPassNoPermitido: db "Pass no Permitida$", 0ah,0dh,24h


	mErrorCerrarArchivo: db "Ingese el nombre de usuario: $"
	MsgError: db "Se ha producido un error$", 0ah,0dh,24h
	errorUsarioDuplicado: db " Error Usuario Duplicado$", 0ah,0dh,24h
	; Verificar ingreso de usuario
	mMsgErrorUsuario: db "Usuairo Incorrecto$",0ah,0dh,24h
	mMsgErrorPass: db "Password Incorrecto$",0ah,0dh,24h


	mUserLogin: db "       $", 0
	mUserRegistro: db "       ", 0
	mUsuario: db "       $", 0

	mPasswordLogin: db "     $", 0
	mPasswordRegistro: db "     ", 0

	Numero_bytes: 	dw 00h

	mBufferNameReg: db "$$$$$$$$", 0
	mPasswordR: db "$$$$$$", 0

	Handler: dd 00h
	Caracter: db '0','$'
	Coma: db ",",'$'

	admin: db "adminbi",0ah,0dh,24h
	adminpass: db "4321",0ah,0dh,24h
	path: db "arch.dat",00h
	usac: db "Universidad de San Carlos de Guatemala$",0ah,0dh,24h
	usac2: db "Universidad de San Carlos de Guatemala ADMIN$",0ah,0dh,24h
	usaclen: equ $ - usac

	filename: 	db 	"./output.txt", 0
	text: 		db 	"Universidad de san carlos$"
	textlen: 	equ	$ - text
;======================================================================|
;							M 	A 	I 	N 						       |
;======================================================================|

verificar_usuario:
	call cls
	println mHeader
	call LimpiarVariables
	println mIngreseUsuario
	println mEnter
	mov di, 0			; Inicializa cont = 0
	EscribirNombreLogin:
		
		call readlineEcho

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirUser
		jmp SeguirUser

		UnirUser:
			mov si, 0
			mov si, mUserLogin
			add si, di 
			mov byte [si], al

			mov si, 0
			mov si, mUsuario
			add si, di 
			mov byte [si], al

		SeguirUser:
			inc di				; contador++
			cmp di, 9			; Compara que sea < 8 (9 porque el \n cuenta como char)
			je error_usuario_NoPermitido
			cmp al,0dh			; Compara si es "ENTER"
			jne EscribirNombreLogin

	println mEnter
	println mIngresePassword
	println mEnter	
	
	mov di, 0			; Inicializa cont = 0

	EscribirPasswordLogin:

		call readlineEcho

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirPass
		jmp SeguirPass

		UnirPass:
			mov si, 0
			mov si, mPasswordLogin
			add si, di 
			mov byte [si], al

		SeguirPass:
			inc di			; contador++
			cmp di, 6		; Compara que sea < 5 (6 porque el \n cuenta como char)
			je error_pass_NoPermitido

			cmp al,0dh			; Compara si es "ENTER"
			jne EscribirPasswordLogin

	call Leer_Archivo_Usuarios
ret

registrar_usuario:
	call cls
	println mHeader
	println mEnter
	println mMsgRegistro
	println mEnter
	call LimpiarVariables
	println mIngreseUsuario
	println mEnter
	mov di, 0			; Inicializa cont = 0

	; ======= AHORA PIDO EL USUARIO ============
	wNombreRegistro:

		call readlineEcho

		cmp al,0dh				; Compara si es "ENTER"
		jne concatUserChar 		; else -> concatenar caracteres
		jmp SeguirUserR 		; IF(keypressed = ENTER) -> Seguir con registro Usuario


		concatUserChar:
			mov si, 0
			mov si, mUserRegistro
			add si, di
			mov byte [si], al

			mov si, 0
			mov si, mUsuario
			add si, di
			mov byte [si], al

		SeguirUserR:
			inc di				; contador++		
			cmp di, 9			; Compara que sea < 8 (9 porque el \n cuenta como char)
			je error_usuario_NoPermitido
			cmp al,0dh			; Compara si es "ENTER"
			jne wNombreRegistro

		call oArchUsuarios

		EncontrarUsuarioR:
			;Lectura de Usuario
			xor ah,ah
			xor dx,dx
			xor bx,bx
			xor cx,cx
			mov ah, 3Fh			; Lectura de fichero
			mov bx, [Handler]	; Le mando el handler del fichero
			mov cx, 7			; Numbytes x leer, 7 por el tamaño del username
			mov dx, mBufferNameReg
			int 21h				; interrupcion DOS
			jc Salir_Error

			Comprobacion_UsuarioR:
				lea si, [mUsuario]
				lea di, [mBufferNameReg]
				repe cmpsb				; compara 2 str de si == di
				jne AvanzarR
				je Usuario_Duplicado


		AvanzarR:
			xor ah,ah
			xor dx,dx
			xor bx,bx
			xor cx,cx
			mov ah, 3Fh			; Lectura de fichero
			mov bx, [Handler]	; Le mando el handler del fichero
			mov cx, 7			; Leo otros 7 porque asi llego al sig username
			int 21h				; interrupcion DOS
			jc Salir_Error

			cmp ax, 0		; IF (bytes trasferidos){ NADA.. } else -> jne
			jne EncontrarUsuarioR

		call Close_File

	; ====== AHORA PIDO LA CONTRASEÑA ============
	println mEnter
	println  mIngresePassword
	println mEnter

	mov di, 0			; Inicializa cont = 0

	EscribirPasswordRegistro:

		call readlineEcho

		cmp al,39H			;compara con el ascii de 9 si se ingresa un ascii mayor a ese despliega el error
		ja Solo_Numeros 	;se activa cuando el segundo es mayor

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirPassR
		jmp SeguirPassR

		UnirPassR:

			mov si, 0
			mov si, mPasswordRegistro
			add si, di
			mov byte [si], al

		SeguirPassR:
			inc di			; contador++
			cmp di, 6		; Compara que sea < 5 (6 porque el \n cuenta como char)
			je error_pass_NoPermitido

			cmp al,0dh			; Compara si es "ENTER"
			jne EscribirPasswordRegistro


	Registrar:
		call oArchUsuarios

		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx

		call Seek_End			; Se va al final del archivo para comenzar a escribir

		; Escribo el nombre del usuario
		mov si, mUserRegistro
		call Obtener_Numero_Bytes
		mov cx,[Numero_bytes]
		mov dx, mUserRegistro
		call Escribir_Archivo

		; Escribo una coma
		mov cx,1
		mov dx,Coma
		call Escribir_Archivo

		; Escribo la pass del usuario
		mov si, mPasswordRegistro
		call Obtener_Numero_Bytes
		mov cx,[Numero_bytes]
		mov dx,mPasswordRegistro
		call Escribir_Archivo

		; Escribo un enter del usuario
		mov cx,1
		mov dx,mEnter
		call Escribir_Archivo

		call Close_File

		println mEnter

		printlnWait mMsgExito

		jmp _start
ret

Leer_Archivo_Usuarios:
	call oArchUsuarios

	xor ah,ah
	xor dx,dx
	xor bx,bx
	xor cx,cx
	mov ah, 3Fh			; Lectura de fichero
	mov bx, [Handler]	; Le mando el handler del fichero
	mov cx, 7			; Numbytes x leer, 7 por el tamaño del username
	mov dx, mBufferNameReg
	int 21h				; interrupcion DOS 
	jc Salir_Error		

	
	lea si, [mUsuario]
	lea di, [mBufferNameReg]
	repe cmpsb				; compara 2 str de si == di
	jne UserNormal

	;Lectura de la "Coma"
	xor ah,ah
	xor dx,dx
	xor bx,bx
	xor cx,cx
	mov ah, 3Fh			; Lectura de fichero
	mov bx, [Handler]	; Le mando el handler del fichero
	mov cx, 1			; Me salto una coma
	int 21h				; interrupcion DOS 
	jc Salir_Error

	;Lectura de Password
	xor ah,ah
	xor dx,dx
	xor bx,bx
	xor cx,cx
	mov ah, 3Fh			; lectura de fichero
	mov bx,[Handler]	; Le mando el handler del fichero
	mov cx, 5			; Leo la pass de 5 chars
	mov dx, mPasswordR	; Le mando el buffer para guardar
	int 21h				; interrupcion DOS 
	jc Salir_Error


	;Comprobacion_Password:
	lea si, [mPasswordLogin]
	lea di, [mPasswordR]
	repe cmpsb				; compara 2 str de si == di
	je UserAdmin

	UserAdmin:
		call Close_File
		call cls
		jmp _startAdmin


	UserNormal:
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh			; Lectura de fichero
		mov bx, [Handler]	; Le mando el handler del fichero
		mov cx, 7			; Leo otros 7 para llegar al sig username
		int 21h				; interrupcion DOS 
		jc Salir_Error	

	EncontrarUsuario:

		;Lectura de Usuario
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh			; Lectura de fichero
		mov bx, [Handler]	; Le mando el handler del fichero
		mov cx, 7			; Numbytes x leer, 7 por el tamaño del username
		mov dx, mBufferNameReg
		int 21h				; interrupcion DOS 
		jc Salir_Error		

		Comprobacion_Usuario:
			lea si, [mUsuario]
			lea di, [mBufferNameReg]
			repe cmpsb				; compara 2 str de si == di
			jne NoLeerPassword
			je LeerPassword


	 NoLeerPassword:
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh			; Lectura de fichero
		mov bx, [Handler]	; Le mando el handler del fichero
		mov cx, 7			; Leo otros 7 para llegar al sig username
		int 21h				; interrupcion DOS 
		jc Salir_Error
		jmp Avanzar


	LeerPassword:
		;Lectura de la "Coma"
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh			; Lectura de fichero
		mov bx, [Handler]	; Le mando el handler del fichero
		mov cx, 1			; Me salto una coma
		int 21h				; interrupcion DOS 
		jc Salir_Error

		;Lectura de Password
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh			; lectura de fichero
		mov bx,[Handler]	; Le mando el handler del fichero
		mov cx, 5			; Leo la pass de 5 chars
		mov dx, mPasswordR	; Le mando el buffer para guardar
		int 21h				; interrupcion DOS 
		jc Salir_Error


		Comprobacion_Password:
			lea si, [mPasswordLogin]
			lea di, [mPasswordR]
			repe cmpsb				; compara 2 str de si == di
			je Ingreso_Correcto
			jne No_Existe_Pass

	Avanzar: 
		cmp ax, 0
		jne EncontrarUsuario
		je No_Existe_Usuario

	No_Existe_Usuario:
		println mMsgErrorUsuario
		call Close_File
		call readline
		jmp _start

	No_Existe_Pass:
		println mMsgErrorPass
		call Close_File
		call readline
		jmp _start	

	Ingreso_Correcto:
		call Close_File
		call cls
		jmp _start

ret

comparar_entrada:
	cmp al,31h			; If(keypressed == 1) Then
	je verificar_usuario
	cmp al,32h			; If(keypressed == 2) Then
	je registrar_usuario
	cmp al,33h			; If(keypressed == 3) Then
	je Salir
	jmp _start 		; else{ ir a Start W}
ret