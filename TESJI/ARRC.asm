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
    
     ; Imprimir el segundo elemento del arreglo (2)
     mov al, arreglo[0]    ; Carga el segundo elemento del arreglo (2) en AL
    add al, 30h           ; Convierte el n?mero 2 en car?cter ASCII ('2')
    mov dl, al            ; Mueve el car?cter a DL
    mov ah, 02h           ; Configura la funci?n para imprimir un car?cter
    int 21h               ; Imprime el car?cter '2'

    ; Imprimir el segundo elemento del arreglo (2)
    mov al, arreglo[1]    ; Carga el segundo elemento del arreglo (2) en AL
    add al, 30h           ; Convierte el n?mero 2 en car?cter ASCII ('2')
    mov dl, al            ; Mueve el car?cter a DL
    mov ah, 02h           ; Configura la funci?n para imprimir un car?cter
    int 21h               ; Imprime el car?cter '2'

    ; Imprimir el tercer elemento del arreglo (3)
    mov al, arreglo[2]    ; Carga el tercer elemento del arreglo (3) en AL
    add al, 30h           ; Convierte el n?mero 3 en car?cter ASCII ('3')
    mov dl, al            ; Mueve el car?cter a DL
    mov ah, 02h           ; Configura la funci?n para imprimir un car?cter
    int 21h               ; Imprime el car?cter '3'

    ; Imprimir el cuarto elemento del arreglo (4)
    mov al, arreglo[3]    ; Carga el cuarto elemento del arreglo (4) en AL
    add al, 30h           ; Convierte el n?mero 4 en car?cter ASCII ('4')
    mov dl, al            ; Mueve el car?cter a DL
    mov ah, 02h           ; Configura la funci?n para imprimir un car?cter
    int 21h               ; Imprime el car?cter '4'

    ; Finalizar el programa
    mov ah, 4Ch           ; Terminar el programa correctamente
    int 21h

main endp
end main
