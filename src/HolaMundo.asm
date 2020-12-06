section .data
    holaStr:    db 'Hola Mundo!',10 ; sección de datos del programa
    holaSize:      equ $-holaStr

section .text
    global _start

_start:
    
    mov eax,4            ; llamada del sistema 'write' identificador 4
    mov ebx,1            ; descriptor de archivo 1 = pantalla
    mov ecx,holaStr      ; cadena a mostrar
    mov edx,holaSize     ; longitud de la cadena 
    int 80h              ; invocar al kernel

    ; Terminate program
    mov eax,1            ; llamada del sistema 'exit'
    mov ebx,0            ; codigo de error 0
    int 80h              ; invocar al kernel