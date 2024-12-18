.model small
.stack 100h

quince equ 15
cero equ 0 

.data
arreglo db 1,2,3,4
cadena db "ISIC $"
var db 7

.code
main proc
    ; Configuraci?n del segmento de datos
    mov ax, seg @data
    mov ds, ax

    ; Imprimir la cadena "ISIC"
    mov ah, 09h
    lea dx, cadena
    int 21h

    ; Inicializar suma
    mov al, 0             ; AL = 0 (acumulador para la suma)
    
    ; Sumar elementos del arreglo
        ; AL = AL + arreglo[0] (1)
    add al, arreglo[1]    ; AL = AL + arreglo[1] (2)
    add al, arreglo[2]    ; AL = AL + arreglo[2] (3)
    add al, arreglo[3]    ; AL = AL + arreglo[3] (4)

    ; Guardar resultado en un registro
    mov bl, al            ; BL = suma total (10)

    ; Mostrar resultado de la suma
    ; Caso 1: Resultado es una sola cifra
    cmp bl, 10
    jl imprimir_uno_digito ; Si BL < 10, imprime un solo d?gito

    ; Caso 2: Resultado es dos cifras
    ; Dividir BL por 10 para obtener decenas y unidades
    mov cl, 10
    xor dx, dx            ; Limpiar DX para la divisi?n
    div cl                ; AL = unidades, AH = decenas

    ; Imprimir decenas
    add ah, 30h           ; Convertir a ASCII
    mov dl, ah
    mov ah, 02h
    int 21h               ; Imprimir decenas

    ; Imprimir unidades
    add al, 30h           ; Convertir a ASCII
    mov dl, al
    mov ah, 02h
    int 21h               ; Imprimir unidades

    jmp fin               ; Saltar al final

imprimir_uno_digito:
    add bl, 30h           ; Convertir a ASCII
    mov dl, bl
    mov ah, 02h
    int 21h               ; Imprimir un solo d?gito
fin:
    ; Finalizar el programa
    mov ah, 4Ch           ; Terminar el programa correctamente
    int 21h

main endp
end main
