.model small
.stack 100h
.data
.code

     main proc
        mov al, 3  ; move value to register al
        add al, 5  ; add value to al register and vice versa
        sub al, 2
        sub al, 1
        add al, 48
         mov dl,al ; mov al value to dl register to display
         
         mov ah, 2    ; to display
         int 21h      ; interupt
         
         mov ah ,4ch
         int 21h
         main endp
     end main
        
        
        
        
        