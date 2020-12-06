;Debian 8.4 -Jessie


org 100h

section .data 
	;cadena de caracteres a imprimir en consola
	header: db 0ah,"*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-",0,0ah,0ah,"Universidad de San Carlos de Guatemala",0,0ah,"Faculta de Ingenieria",0,0ah,"Arquitectura de Computadores y Ensambladores 1",0,0ah, "Segundo Semestre 2016",0,0ah,"Seccion A",0,0ah, "Juan Ramon Veleche Bran",0,0ah,"201314076$",0,0ah,0ah
	cad1: db 0ah,0ah,"*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-$",0,0ah,0ah,0ah,24h
	headerFile: db "Nombre,Password", 0  
	menu: db 0ah,0ah,9h,"1) Ingresar",0ah,0dh,9h,"2) Registrarse",0ah,0dh,9h,"3) Salir",0ah,0dh,24h
	menu2: db 0ah,0ah,9h,"1) Ingresar Funcion",0ah,0dh,9h,"2) Imprimir Funcion Ingresada",0ah,0dh,9h,"3) Imprimir la derivada de la funcion",0ah,0dh,9h,"4) Imprimir la integral de la funcion",0ah,0dh,9h,"5) Encontrar la solucion de la funcion",0ah,0dh,9h,"6) Cerrar Sesion",0ah,0dh,24h
	MsgErrorUsuario: db "Usuairo Incorrecto$",0ah,0dh,24h
	MsgErrorPass: db "Contrasenia Incorrecta$",0ah,0dh,24h
	MsgErrorUsarioDuplicado: db "El usuairo ingresado ya existe por favor ingrese un nuevo nombre de usuario$",0ah,0dh,24h
	MsgErrorPassNum: db "Error, ingrese solamente numeros para su contrasenia$",0ah,0dh,24h
	MsgGrado: db "Ingrese el grado de la ecuacion que se almacenera$",0
	MsgDerivada: db "Derivada de la funcion almacenada$",0ah,0dh,24h
	MsgIntegral: db "Integral de la funcion almacenada$",0ah,0dh,24h
	MsgErrorGrado: db "Error, Ingrese un grado mayor a 0 o menor o igual a 4$",0
	MsgUsuario: db "Ingese su nombre de usuario: $"
	Msg4: db "Ecucion de la forma: ax^4+bx^5+cx^2+dx+e$",0
	Msg3: db "Ecucion de la forma: ax^3+bx^2+cx+d$",0
	Msg2: db "Ecucion de la forma: ax^2+bx+c$",0
	Msg1: db "Ecucion de la forma: ax+b$",0 
	MsgA: db "Ingrese el coeficiente A:$",0
	MsgB: db "Ingrese el coeficiente B:$",0
	MsgC: db "Ingrese el coeficiente C:$",0
	MsgD: db "Ingrese el coeficiente D:$",0
	MsgE: db "Ingrese el coeficiente E:$",0
	MsgFuncionAnterior: db "Ingrese un funcion primoer$",0
	MsgMasC: db "+C$",0
	MsgNewton: db "Metodo de Newton$",0
	MsgContIteraciones: db "# Iteracion $",0
	MsgIteraciones: db "Ingrese el numero de interaciones maximas:$",0
	MsgCoeficiente: db "Ingrese el coeficiente de tolerancia:$",0
	MsgGradoTol: db "Ingrese el grado de tolerancia:$",0
	MsgInferior: db "Ingrese el limite inferior:$",0
	MsgSuperior: db "Ingrese el limite superior:$",0
	MsgAlmacenada: db "Funcion almacenada correctamente$",0
	MsgXn: db "Xn=$",0
	MsgXn1: db "Xn+1=$",0
	MsgErrorActual: db "Error actual=$",0
	MsgFuncion: db "Funcion almacenada$",0
	MsgBienvenida: db "Bienvenido :) $",0ah,0dh,24h
	MsgPass: db "Ingrese su contrasenia:$ "
	MsgUsuarionoPerimitido: db "Usuario no Permitido$", 0ah,0dh,24h
	
	MsgError: db "Se ha producido un error$", 0ah,0dh,24h
	MsgErrorArchivo: db "Se ha producido un erro al cerrar el archivo$",0ah,0dh,24h
	MsgAdvertencia: db "No hay usuarios registrados, por favor registrese$",0ah,0dh,24h
	MsgRegistro: db 9h,9h,"Registro de un nuevo Usuario",0ah,0dh,24h
	MsgExito: db "Usuario registrado exitosamente! $",0ah,0dh,24h
	
	PasswordR: db "$$$$$$", 0
	File: db "USUARIOS.TXT", 0
	Coma: db ",",'$'
	MsgX: db 'x','$',0
	Potencia: db '^','$',0
	Numero_bytes: 	dw 00h

	mUserLogin: db "     $", 0
	UserRegistro: db "     ", 0
	Usuario: db "     $", 0
	NombreR: db "$$$$$$", 0
	PasswordLogin: db "     $", 0
	PasswordRegistro: db "     ", 0

	
	Grado: db '0','$'
	Operador: db '0','$'
	Caracter: db '0','$'
	Unidad: db '0','$'
	Decena: db '0','$'
	Centena: db '0','$'
	Mil: db '0','$'
	Mas: db '+','$'
	Menos: db '-','$'
	Cuatro: db '4','$'
	Tres: db '3','$'
	Dos: db '2','$'
	Cinco: db '5','$'
	SignoA: db 2Bh,'$'
	SignoB: db 2Bh,'$'
	SignoC: db 2Bh,'$'
	SignoD: db 2Bh,'$'
	SignoE: db 2Bh,'$'
	Signo: db 2Bh,'$'
	uniTot: db 0
	cenTot: db 0
	decTot: db 0
	milTot: db 0
	SaltoLinea: db 0Ah,'$'
	Punto: db '.','$'
	Na: dw 0
	Nb: dw 0
	Nc: dw 0
	Nd: dw 0
	Ne: dw 0 
	DevA: dw 0
	DevB: dw 0
	DevC: dw 0
	DevD: dw 0
	DecA: dw 0
	DecB: dw 0
	DecC: dw 0
	DecD: dw 0
	DecE: dw 0
	Iteraionces: dw 0
	Ct: dw 0
	Gt: dw 0
	li: dw 0
	ls: dw 0
	NumDecimales: dw 0
	Resultado: dw 0
	ResultadoDecimal: dw 0
	AuxResultadoDecimal: dw 0
	AuxResultado: dw 0
	GradoNumero: dw 0
	Handler: dw 00h
	bandera: db 30h,'$'
	

section .text
	global _start

_start:
	;limpiar_pantalla:
	mov ah,00h 			;modo video			; limpiar pantalla
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla			;llame a la interrupción de video

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx 		;activar la opción de impresión en pantalla
	mov dx,header   ;deposita en dx la cadena a imprimir 
	int 21h				; interrupcion DOS			;interrupción al kernel para la impresión de la cadena

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,cad1
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,menu
	int 21h				; interrupcion DOS

	call comparar_entrada
ret

comparar_entrada:
	
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS
	cmp al,31h
	je Verificar_Usuario
	cmp al,32h
	je Registrar_Usuario
	cmp al,33h
	je Salir
	jmp _start
ret

imprimir_menu2:
	
	xor ah,ah
	xor al,al
	xor ax,ax
	xor cx,cx
	xor bx,bx
	xor dx,dx

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,header
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,cad1
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,menu2
	int 21h				; interrupcion DOS

	call comparar_entrada2
ret

comparar_entrada2:
	
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS
	cmp al,31h
	je Ingresar_Ecuacion
	cmp al,32h
	je Imprimir_Funcion
	cmp al,33h
	je Imprimir_Derivada
	cmp al,34h
	je Imprimir_Integral
	cmp al,35h
	je Metodo_Newton
	cmp al,36h
	je _start
	jmp imprimir_menu2
ret

Ingresar_Ecuacion:
	mov dx,31h
	mov [bandera],dx
	
	call Limpiar_Numeros

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgGrado
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS

	cmp al,34h
	ja Error_Grado

	mov [Grado],al

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,Grado
	int 21h				; interrupcion DOS

	mov al,[Grado]
	cmp al,34h
	je Grado4
	cmp al,33h
	je Grado3
	cmp al,32h
	je Grado2
	cmp al,31h
	je Grado1
	cmp al,30h
	je Error_Grado
	
	Grado4:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Msg4
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgA
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoA],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Na],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgB
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoB],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nb],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgC
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoC],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nc],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgD
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoD],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nd],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgE
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoE],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Ne],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgAlmacenada
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2

	Grado3:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Msg3
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgA
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoA],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Na],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgB
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoB],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nb],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgC
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoC],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nc],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgD
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoD],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nd],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgAlmacenada
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2

	Grado2:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Msg2
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgA
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoA],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Na],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgB
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoB],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nb],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgC
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoC],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nc],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgAlmacenada
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2

	Grado1:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Msg1
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgA
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoA],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Na],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgB
		int 21h				; interrupcion DOS

		call recibir_numero

		mov ax,[Signo]
		mov [SignoB],ax

		call AsciiToDecimalNum

		mov ax,[Resultado]
		mov [Nb],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgAlmacenada
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2

	Error_Grado:
		mov dx,30h
		mov [bandera],dx

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgErrorGrado
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

recibir_numero:
	
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS

	cmp al,2Dh	;menos
	je esSigno
	cmp al,2Bh	;mas
	je esSigno
	cmp al,71h
	je Salir_Numero
	jmp esNumero

	esSigno:
		cmp al,2dh
		je Imprimir_menos
		jmp Imprimir_mas

		Imprimir_menos:
			mov al,2dh
			mov [Signo],al
			mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
			mov dx,Menos
			int 21h				; interrupcion DOS
			jmp Seguir

		Imprimir_mas:
			mov al,2bh
			mov [Signo],al
			mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
			mov dx,Mas
			int 21h				; interrupcion DOS

		Seguir:
			mov ah,08h			; Capturar la entrada del teclado
			int 21h				; interrupcion DOS

	esNumero:
		mov [Decena],al

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Decena
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		mov [Unidad],al

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Unidad
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS
	ret

	Salir_Numero:

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

AsciiToDecimalNum:
	
	mov dx,0d			;se mueve a dx el valor de 0 decimal
	mov [Resultado],dx	;se inicializa la variable donde se guardara la conversión en cero

	;limpieza de registros
	xor al,al
	xor bl,bl
	xor ax,ax
	
	mov al, 10			;se mueve a al 10 para sumar decenas
	mov bl, [Decena]	;se obtiene el valor de la decena
	sub bl, 30h 		;se convierte el valor de la decena de ascii a decimal
	mul bl				;se multiplica el valor de la decena por 10
	add [Resultado], ax	;se agrega el resultado a la variable

	mov bl, [Unidad]	;se mueve a bl el valor de la unidad, por se unidad no es necesario multiplicarlo por 10
	sub bl, 30h 		;se convierte el valor de la unidad de ascii a decimal
	add [Resultado], bl ;se suma el valo de la unidad al resulado
ret

DecimalToAscii:
	;se limpian los registors
	xor ah, ah
	xor al, al
	xor ax, ax
	xor dl,dl
	xor dx,dx

	mov ax,[Resultado]
	mov [AuxResultado],ax
	
	mov ax,[AuxResultado]
	sub ax,1000d
	jc MenorAMil
	jmp ConvertirMil

	MenorAMil:
		mov ax,[Resultado]
		sub ax,100d
		jc MenorACien
		jmp ConvertirCien

	MenorACien:
		xor dx,dx
		xor ax,ax
		xor bx,bx
		xor ah,ah
		;decenas
		mov al,[AuxResultado]	;se mueve ax el valor del dividendo
		mov bl,10d			;se mueve a bl el valor del divisor
		div bl				;se efectual la división


		mov [decTot], al	;al almacena el valor del cociente
		mov [uniTot], ah	;ah almacena el valor del residuo

		mov ah,02h			;macro para impresión
		mov dl, [decTot]	;se mueve a dl el valor de las decenas
		add dl,30h			;se convierte la decena de decimal a ascii
		int 21h				; interrupcion DOS				;llamada al kernel

		mov ah, 02h
		mov dl, [uniTot]	;se mueve a dl el valor de la unidad
		add dl,30h			;se convierte la unidad de deicmal a ascii
		int 21h				; interrupcion DOS				;llamda al kernel
	ret

	ConvertirMil:
		xor bl,bl
		xor ax,ax
		xor al,al
		xor ah,ah

		mov bx,1000d
		mov ax,[AuxResultado]
		div bx

		mov [milTot],al
		mov [AuxResultado],dx

		mov ah,02h
		mov dl,[milTot]
		add dl,30h
		int 21h				; interrupcion DOS 

	ConvertirCien:

		xor bl,bl
		xor ax,ax
		xor al,al
		xor ah,ah

		mov bl,100d
		mov ax,[AuxResultado]
		div bl

		mov [cenTot],al
		mov [AuxResultado],ah

		mov ah,02h
		mov dl,[cenTot]
		add dl,30h
		int 21h				; interrupcion DOS

		jmp MenorACien
ret

Imprimir_Funcion:

	mov al,[bandera]
	cmp al,30h
	je Salir_funcion

	;limpiar_pantalla:
	mov ah,00h 			;modo video			; limpiar pantalla
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla			;llame a la interrupción de video

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgFuncion
	int 21h				; interrupcion DOS

	mov al,[Grado]
	cmp al,34h
	je ImprimirGrado4
	cmp al,33h
	je ImprimirGrado3
	cmp al,32h
	je ImprimirGrado2
	cmp al,31h
	je ImprimirGrado1
	jmp Salir_funcion

	ImprimirGrado4:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,[Na]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Cuatro
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,[Nb]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		mov ax,[Nc]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoD
		int 21h				; interrupcion DOS

		mov ax,[Nd]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoE
		int 21h				; interrupcion DOS

		mov ax,[Ne]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	ImprimirGrado3:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,[Na]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,[Nb]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		mov ax,[Nc]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoD
		int 21h				; interrupcion DOS

		mov ax,[Nd]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	ImprimirGrado2:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,[Na]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Potencia
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,[Nb]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		mov ax,[Nc]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	ImprimirGrado1:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,[Na]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,[Nb]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Salir_funcion:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgFuncionAnterior
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS
		jmp imprimir_menu2
ret

Imprimir_Derivada:
	
	mov al,[bandera]
	cmp al,30h
	je Salir_Derivada

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgDerivada
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov al,[Grado]
	cmp al,34h
	je Derivada4
	cmp al,33h
	je Derivada3
	cmp al,32h
	je Derivada2
	cmp al,31h
	je Derivada1

	Derivada4:

		call Limpiar_Registros

		mov ax,4d
		mov bx,[Na]
		mul bx
		mov [Resultado],eax
		mov [DevA],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx 
		mov dx,SignoA
		int 21h				; interrupcion DOS

		call DecimalToAscii

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,3d
		mov bx,[Nb]
		mul bx
		mov [Resultado],eax
		mov [DevB],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		call DecimalToAscii
		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,2d
		mov bx,[Nc]
		mul bx
		mov [Resultado],eax
		mov [DevC],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,[Nd]
		mov [DevD],ax
		mov [Resultado],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoD
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Derivada3:

		call Limpiar_Registros

		mov ax,3d
		mov bx,[Na]
		mul bx
		mov [Resultado],eax
		mov [DevA],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx 
		mov dx,SignoA
		int 21h				; interrupcion DOS

		call DecimalToAscii

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,2d
		mov bx,[Nb]
		mul bx
		mov [Resultado],eax
		mov [DevB],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,[Nc]
		mov [DevC],ax
		mov [Resultado],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Derivada2:
		call Limpiar_Registros

		mov ax,2d
		mov bx,[Na]
		mul bx
		mov [Resultado],eax
		mov [DevA],eax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx 
		mov dx,SignoA
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		call Limpiar_Registros

		mov ax,[Nb]
		mov [DevB],ax
		mov [Resultado],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Derivada1:
		call Limpiar_Registros

		mov ax,[Na]
		mov [DevA],ax
		mov [Resultado],ax

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		call DecimalToAscii

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Salir_Derivada:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgFuncionAnterior
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

Imprimir_Integral:

	mov al,[bandera]
	cmp al,30h
	je Salir_Integral

	mov dx,2d
	mov [NumDecimales],dx

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgIntegral
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov al,[Grado]
	cmp al,34h
	je Integral4
	cmp al,33h
	je Integral3
	cmp al,32h
	je Integral2
	cmp al,31h
	je Integral1

	Integral4:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,5d
		mov [GradoNumero],ax
		mov ax,[Na]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Cinco
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,4d
		mov [GradoNumero],ax
		mov ax,[Nb]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Cuatro
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		mov ax,3d
		mov [GradoNumero],ax
		mov ax,[Nc]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoD
		int 21h				; interrupcion DOS

		mov ax,2d
		mov [GradoNumero],ax
		mov ax,[Nd]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoE
		int 21h				; interrupcion DOS
		mov ax,[Ne]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgMasC
		int 21h				; interrupcion DOS


		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Integral3:
		
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,4d
		mov [GradoNumero],ax
		mov ax,[Na]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Cuatro
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,3d
		mov [GradoNumero],ax
		mov ax,[Nb]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS

		mov ax,2d
		mov [GradoNumero],ax
		mov ax,[Nc]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoD
		int 21h				; interrupcion DOS
		mov ax,[Nd]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgMasC
		int 21h				; interrupcion DOS


		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Integral2:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,3d
		mov [GradoNumero],ax
		mov ax,[Na]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Tres
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS

		mov ax,2d
		mov [GradoNumero],ax
		mov ax,[Nb]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoC
		int 21h				; interrupcion DOS
		mov ax,[Nc]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgMasC
		int 21h				; interrupcion DOS


		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Integral1:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoA
		int 21h				; interrupcion DOS

		mov ax,2d
		mov [GradoNumero],ax
		mov ax,[Na]
		mov [Resultado],ax

		call Calcular_Decimal

		call Xpotencia

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Dos
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SignoB
		int 21h				; interrupcion DOS
		mov ax,[Nb]
		mov [Resultado],ax

		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgX
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgMasC
		int 21h				; interrupcion DOS


		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	ret

	Salir_Integral:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgFuncionAnterior
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

Calcular_Decimal:
	
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor ah,ah
	xor dx,dx

	mov ax,[Resultado]
	mov bx,[GradoNumero]
	div bx  ;ax cociente y dx residuo

	mov [Resultado],ax
	mov [AuxResultadoDecimal],dx

	call DecimalToAscii

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,Punto
	int 21h				; interrupcion DOS

	mov cx,[NumDecimales]

	loop_decimal:

		xor al,al
		xor bl,bl
		xor ax,ax
		xor bx,bx
		xor dx,dx

		mov al,10
		mov bl,[AuxResultadoDecimal]
		mul bl
		
		mov [AuxResultadoDecimal],ax
		mov ax,[AuxResultadoDecimal]
		mov bx,[GradoNumero]
		div bx

		mov [Resultado],ax
		mov [AuxResultadoDecimal],dx

		call DecimalToAscii

		dec cx
		jnz loop_decimal

	Salir_Decimal:
ret

Metodo_Newton:

	mov al,[bandera]
	cmp al,30h
	je Salir_Newton

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgNewton
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgIteraciones
	int 21h				; interrupcion DOS

	call recibir_numero

	call AsciiToDecimalNum

	mov ax,[Resultado]
	mov [Iteraionces],ax


	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgCoeficiente
	int 21h				; interrupcion DOS

	call recibir_numero

	call AsciiToDecimalNum

	mov ax,[Resultado]
	mov [Ct],ax

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgGradoTol
	int 21h				; interrupcion DOS

	call recibir_numero

	call AsciiToDecimalNum

	mov ax,[Resultado]
	mov [Gt],ax

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgInferior
	int 21h				; interrupcion DOS

	call recibir_numero

	call AsciiToDecimalNum

	mov ax,[Resultado]
	mov [li],ax

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgSuperior
	int 21h				; interrupcion DOS

	call recibir_numero

	call AsciiToDecimalNum

	mov ax,[Resultado]
	mov [ls],ax

	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov cx,1d

	loop_iteraciones:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,cad1
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgContIteraciones
		int 21h				; interrupcion DOS

		mov [Resultado],cx
		call DecimalToAscii

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgXn
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgXn1
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgErrorActual
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,cad1
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		inc cx
		mov ax,[Iteraionces]
		sub ax,cx
		jnc loop_iteraciones

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
	
	Salir_Newton:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgFuncionAnterior
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

Registrar_Usuario:

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,header
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,cad1
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgRegistro
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	call LimpiarVariables

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgUsuario
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov di, 0
	EscribirNombreRegistro:
		
		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirUserR
		jmp SeguirUserR

		UnirUserR:
		mov si, 0
		mov si, UserRegistro
		add si, di 
		mov byte [si], al

		mov si, 0
		mov si, Usuario
		add si, di 
		mov byte [si], al

		SeguirUserR:

		mov [Caracter],al

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Caracter
		int 21h				; interrupcion DOS

		inc di
		cmp di, 7
		je Error_Usuario_no_Permitido
		cmp al,0dh			; Compara si es "ENTER"
		jne EscribirNombreRegistro

	call Abrir_Archivo
	
	;Lectura de Encabezado
	xor ah,ah
	xor dx,dx
	xor bx,bx
	xor cx,cx
	mov ah, 3Fh
	mov bx, [Handler]
	mov cx, 16
	int 21h				; interrupcion DOS 
	jc Salir_Error


	EncontrarUsuarioR:

		;Lectura de Usuario
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh
		mov bx, [Handler]:
		mov cx, 5
		mov dx, NombreR
		int 21h				; interrupcion DOS 
		jc Salir_Error

		Comprobacion_UsuarioR:
			mov cx, 5
			lea si, [Usuario]
			lea di, [NombreR]
			repe cmpsb
			jne AvanzarR
			je Usuario_Duplicado


	AvanzarR:
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh
		mov bx, [Handler]
		mov cx, 7
		int 21h				; interrupcion DOS 
		jc Salir_Error

		cmp ax, 0
		jne EncontrarUsuarioR

	call Close_File

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgPass
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS
	
	
	mov di, 0
	EscribirPasswordRegistro:

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		cmp al,39H			;compara con el ascii de 9 si se ingresa un ascii mayor a ese despliega el error
		ja Solo_Numeros 	;se activa cuando el segundo es mayor 

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirPassR
		jmp SeguirPassR

		UnirPassR:

			mov si, 0
			mov si, PasswordRegistro
			add si, di 
			mov byte [si], al
		SeguirPassR:

		mov [Caracter],al
		
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Caracter
		int 21h				; interrupcion DOS

		inc di
		cmp di, 7

		je Error_Password_No_Permitida
		cmp al,0dh			; Compara si es "ENTER"
		jne EscribirPasswordRegistro


	Registrar:
		call Abrir_Archivo

		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx

		call Seek_End

		mov si,UserRegistro
		call Obtener_Numero_Bytes
		mov cx,[Numero_bytes]
		mov dx,UserRegistro
		call Escribir_Archivo

		mov cx,1
		mov dx,Coma
		call Escribir_Archivo

		mov si,PasswordRegistro
		call Obtener_Numero_Bytes
		mov cx,[Numero_bytes]
		mov dx,PasswordRegistro
		call Escribir_Archivo

		mov cx,1
		mov dx,SaltoLinea
		call Escribir_Archivo

		call Close_File

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgExito
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp _start

	Usuario_Duplicado:
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgErrorUsarioDuplicado
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		call Close_File

		mov dx,00h
		mov [Handler],dx

		jmp _start

	Solo_Numeros:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgErrorPassNum
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS
ret

Verificar_Usuario:

	;limpiar_pantalla:
	mov ah,00h 			;modo video	
	mov al,03h			;320x200 256 colores
	int 10h 			;servicio de pantalla

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,header
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,cad1
	int 21h				; interrupcion DOS

	call LimpiarVariables

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgUsuario
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov di, 0
	EscribirNombreLogin:
		
		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirUser
		jmp SeguirUser

		UnirUser:

		mov si, 0
		mov si, mUserLogin
		add si, di 
		mov byte [si], al

		mov si, 0
		mov si, Usuario
		add si, di 
		mov byte [si], al

		SeguirUser:

		mov [Caracter],al

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Caracter
		int 21h				; interrupcion DOS

		inc di
		cmp di, 7
		je Error_Usuario_no_Permitido
		cmp al,0dh			; Compara si es "ENTER"
		jne EscribirNombreLogin

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgPass
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS
	
	
	mov di, 0
	EscribirPasswordLogin:

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		cmp al,0dh			; Compara si es "ENTER"
		jne UnirPass

		jmp SeguirPass

		UnirPass:

		mov si, 0
		mov si, PasswordLogin
		add si, di 
		mov byte [si], al

		SeguirPass:

		mov [Caracter],al
		
		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Caracter
		int 21h				; interrupcion DOS

		inc di
		cmp di, 7

		je Error_Password_No_Permitida
		cmp al,0dh			; Compara si es "ENTER"
		jne EscribirPasswordLogin

	call Leer_Archivo_Usuarios
ret

Leer_Archivo_Usuarios:

	call Abrir_Archivo

	;Lectura de Encabezado
	xor ah,ah
	xor dx,dx
	xor bx,bx
	xor cx,cx
	mov ah, 3Fh
	mov bx, [Handler]
	mov cx, 16
	int 21h				; interrupcion DOS 
	jc Salir_Error

	EncontrarUsuario:

		;Lectura de Usuario
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh
		mov bx, [Handler]
		mov cx, 5
		mov dx, NombreR
		int 21h				; interrupcion DOS 
		jc Salir_Error

		Comprobacion_Usuario:

			mov cx, 5
			lea si, [Usuario]
			lea di, [NombreR]
			repe cmpsb
			jne NoLeerPassword
			je LeerPassword


	 NoLeerPassword:
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh
		mov bx, [Handler]
		mov cx, 7
		int 21h				; interrupcion DOS 
		jc Salir_Error
		jmp Avanzar


	LeerPassword:
		;Lectura de la "Coma"
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah, 3Fh
		mov bx, [Handler]
		mov cx, 1
		int 21h				; interrupcion DOS 
		jc Salir_Error

		;Lectura de Password
		xor ah,ah
		xor dx,dx
		xor bx,bx
		xor cx,cx
		mov ah,3fh
		mov bx,[Handler]
		mov cx, 5
		mov dx, PasswordR
		int 21h				; interrupcion DOS 
		jc Salir_Error


		Comprobacion_Password:
			mov cx, 5
			lea si, [PasswordLogin]
			lea di, [PasswordR]
			repe cmpsb
			je Ingreso_Correcto
			jne No_Existe_Pass

	Avanzar: 
		cmp ax, 0
		jne EncontrarUsuario
		je No_Existe_Usuario

	No_Existe_Usuario:

		call Error_Usuario_No_Exisitente
		call Close_File

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp _start

	No_Existe_Pass:

		call Error_Password
		call Close_File

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp _start

	Ingreso_Correcto:

		call Close_File
	
		;limpiar_pantalla:
	mov ah,00h 			;modo video	
		mov al,03h			;320x200 256 colores
		int 10h 			;servicio de pantalla

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,MsgBienvenida
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,Usuario
		int 21h				; interrupcion DOS

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp imprimir_menu2
ret

LimpiarVariables:

	
	mov word [Handler], 00h
	mov di, 0
	RegresarUsuario:
		mov si, 0
		mov si, mUserLogin
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, UserRegistro
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, Usuario
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, NombreR
		add si, di
		mov byte[si], ' '

		inc di
		cmp di, 5
	jl RegresarUsuario
	mov byte [si], '$'

	mov di, 0
	RegresarPassword:
		mov si, 0
		mov si, PasswordLogin
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, PasswordRegistro
		add si, di
		mov byte[si], ' '

		mov si, 0
		mov si, PasswordR
		add si, di
		mov byte[si], ' '

		inc di
		cmp di, 5
	jl RegresarPassword
	mov byte [si], '$'
ret

Limpiar_Numeros:
	mov dx,0d
	mov [Na],dx
	mov dx,0d
	mov [Nb],dx
	mov dx,0d
	mov [Nc],dx
	mov dx,0d
	mov [Nd],dx
	mov dx,0d
	mov [Ne],dx
	mov dx,0d
	mov [Resultado],dx
	mov dx,0d
	mov [AuxResultado],dx
ret

;ERRORES DE USUARIO

Error_Usuario_no_Permitido:

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah, 09h
	mov dx, MsgUsuarionoPerimitido
	int 21h				; interrupcion DOS
	
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS

	jmp _start
ret

Error_Password_No_Permitida:

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah, 09h
	mov dx, MsgPasswordnoPerimitida
	int 21h				; interrupcion DOS
	
	mov ah,08h			; Capturar la entrada del teclado
	int 21h				; interrupcion DOS

	jmp _start
ret

Error_Password:

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS

	mov ah, 09h
	mov dx, MsgErrorPass
	int 21h				; interrupcion DOS
ret

Error_Usuario_No_Exisitente:
	
	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,SaltoLinea
	int 21h				; interrupcion DOS


	mov ah, 09h
	mov dx, MsgErrorUsuario
	int 21h				; interrupcion DOS
ret

Error_Cerrar_Archivo:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS

		mov ah, 09h
		mov dx, MsgErrorArchivo
		int 21h				; interrupcion DOS
		
		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS
ret

Abrir_Archivo:
	mov word[Handler], 0
	mov ah,3dh ;Para Abri Archivo 
	mov al,2h ;0h solo lectura, 1h solo escritura, 2 lectura y escritura 
	mov dx, File
	int 21h				; interrupcion DOS
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
	mov bx, [Handler]
	mov cx, 0           ;desplazamiento
	mov dx, 0
	int 21h				; interrupcion DOS   
ret

Close_File:
	call Seek_End 		;envia el puntero al final del archivo
	mov bx,[Handler]	;variable que contiene el abrir_archivo
	mov ah,3eh 			;cierra el archivo
	int 21h				; interrupcion DOS	
	jc Error_Cerrar_Archivo
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

Salir_Error:

		mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
		mov dx,SaltoLinea
		int 21h				; interrupcion DOS
	

		mov ah, 09h
		mov dx, MsgError
		int 21h				; interrupcion DOS

		mov ah,08h			; Capturar la entrada del teclado
		int 21h				; interrupcion DOS

		jmp _start
ret

Xpotencia:
	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,MsgX
	int 21h				; interrupcion DOS

	mov ah,09h			; funcion 09h, imprimir en pantalla lo que esta en dx
	mov dx,Potencia
	int 21h				; interrupcion DOS
ret

Limpiar_Registros:
	xor ax,ax
	xor bx,bx
	xor eax,eax
	xor dx,dx
	xor cx,cx
ret

Salir:
	mov ah,04ch		;termina el programa
	int 21h				; interrupcion DOS			;llama el kernel para realizar la acción
ret