.model small
.stack 100h

.data
arreglo1 db 1, 2, 3, 4     ; Primer arreglo
arreglo2 db 5, 6, 7, 8     ; Segundo arreglo
cadena db "ISIC $", 0       ; Cadena para imprimir, terminada en null
resultado db 4 dup(0)       ; Arreglo para almacenar los resultados

.code
main proc
    ; Configuraci?n del segmento de datos
    mov ax, @data
    mov ds, ax

    ; Imprimir la cadena "ISIC"
    mov ah, 09h
    lea dx, cadena
    int 21h

    ; Inicializar ?ndice para recorrer los arreglos
    mov si, 0                ; ?ndice de los arreglos
    mov cx, 4                ; N?mero de elementos en los arreglos

sumar_arreglos:
    mov al, arreglo1[si]     ; Cargar elemento de arreglo1
    add al, arreglo2[si]     ; Sumar elemento correspondiente de arreglo2
    mov resultado[si], al     ; Guardar el resultado en el arreglo de resultados
    inc si                    ; Incrementar ?ndice
    loop sumar_arreglos       ; Repetir para todos los elementos

    ; Imprimir los resultados
    mov si, 0                 ; Reiniciar ?ndice para resultados
    mov cx, 4                 ; N?mero de elementos en los resultados

imprimir_resultados:
    mov al, resultado[si]      ; Cargar resultado
    call imprimir_numero        ; Llamar a la rutina para imprimir n?mero
    inc si                     ; Incrementar ?ndice
    loop imprimir_resultados    ; Repetir para todos los resultados

    ; Finalizar el programa
    mov ah, 4Ch                ; Terminar el programa correctamente
    int 21h
main endp                    ; Fin del procedimiento main

; Rutina para imprimir un n?mero en formato ASCII
imprimir_numero proc
    cmp al, 10                 ; Verificar si el n?mero es mayor o igual a 10
    jl imprimir_uno_digito     ; Si es menor a 10, imprimir directamente

    ; Imprimir decenas
    xor ah, ah                 ; Limpiar AH
    mov bl, 10                 ; Divisor
    div bl                     ; Dividir AL entre 10 -> AH = decenas, AL = unidades
    add ah, 30h                ; Convertir decenas a ASCII
    mov dl, ah                 ; Mover decenas a DL
    mov ah, 02h                ; Configurar interrupci?n para imprimir car?cter
    int 21h                    ; Imprimir car?cter

    ; Imprimir unidades
    add al, 30h                ; Convertir unidades a ASCII
    mov dl, al                 ; Mover unidades a DL
    mov ah, 02h                ; Configurar interrupci?n para imprimir car?cter
    int 21h                    ; Imprimir car?cter
    ret

imprimir_uno_digito:
    add al, 30h                ; Convertir n?mero a ASCII
    mov dl, al                 ; Mover a DL
    mov ah, 02h                ; Configurar interrupci?n para imprimir car?cter
    int 21h                    ; Imprimir car?cter
    ret

end main                    ; Fin del programa
