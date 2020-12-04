.model small
.data
msg1 db 0dh,0ah,"enter alphanumeric charecter $"
res db 02 dup(0)
.code
mov ax,@data
mov ds,ax
lea dx,msg1                            
call disp
mov ah,01h;read
int 21h                                        
mov bl,al                                      
mov cl,4       ;   :=3A=3341                                  
shr al,cl     ;AL=3A   AL=03  BL=3A
cmp al,0ah    ;bl=3A      30     0F                             
jc digit       ;          33     0A
ADD AL,07H                       ;41           
digit: add al,30h                            
      mov res,al                             
      and bl,0fh
      cmp bl,0ah                               
      jc digit1                                
      add bl,07h
 digit1:add bl,30h
       mov res+1,bl

       mov ah,00h
       mov al,03h   ;TEXT MODE
       int 10h

       mov ah,02h   ; SET THE CURSOR POS
       mov bh,00h    ; PAGE NUMBER
       mov dh,0ch     ;ROW (00 IS TOP
       mov dl,28h    ;COLUMN VAL           
       int 10h                           
                                          
       mov res+2,'$'         
       lea dx,res
       call disp
       mov ah,4ch
       int 21h

       disp proc near
       mov ah,09h
       int 21h
       ret
       disp endp
       end
