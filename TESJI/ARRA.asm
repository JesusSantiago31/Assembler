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
mov ax,seg @data
mov ds,ax

mov ah,09h
lea dx,cadena
int 21h

mov al,arreglo[1]
mov bl,arreglo[2]
mov cl,arreglo[3]


mov ah,02
add al,30h
mov dl,al
int 21h

mov ah,02
add al,30h  
mov dl,bl
int 21h

mov ah,02
add al,30h
mov dl,cl
int 21h
.exit
main endp

end main