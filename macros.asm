
.model small
.stack 100h
.data
    msg1 db "Hola Mundo con Macros $", 0Dh, 0Ah, "$"
    msg2 db "¡Esto es un segundo mensaje!$"

; --- DEFINICIÓN DE LA MACRO ---
; Esta macro se llama 'imprimir' y recibe un parámetro llamado 'texto'
imprimir macro texto
    mov dx, offset texto  ; Carga la dirección del texto en DX
    mov ah, 9             ; Función 9 de la INT 21h (imprimir cadena)
    int 21h               ; Llama a la interrupción de DOS
endm
; ------------------------------

.code
    main PROC 
        ; Carga del segmento de datos
        mov ax, @data
        mov ds, ax 

        ; --- USO DE LA MACRO ---
        ; En lugar de escribir las 3 líneas de código cada vez,
        ; solo llamamos a la macro y le pasamos el mensaje.
        
        imprimir msg1
        imprimir msg2

        ; Salida del programa
        mov ah, 4ch
        int 21h
    main ENDP

end main