.model small
.data
a db 12
b db 25
c db 21
d db 13
.code
    mov ax,@data
    mov ds,ax
    mov al,a
    add al,b
    add al,c
    add al,d
    mov a,al
    mov ah,4ch
    int 21h
    end
