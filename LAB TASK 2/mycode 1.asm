
.model small
.stack 100h
.data
tty db 2 ;variable declared
tty1 db 4 
tty2 db 1
.code

     main proc
            mov ax, @data  ; data section called
            mov ds,ax      ; store ax to data segment register
            mov al,tty     ; store variable 1 value to al register 
            add al,tty1    
            add al,tty2    
            add al,48      ; add 48 to ascii change and for display
            mov dl,al      ; move al vlaue to dl register to dispaly on screen
            mov ah,2       ; this is op code to display intgers
            int 21h        ; this is interupt
            
            mov ah,4ch     ; interupt
            int 21h       
            
         main endp      
     end main              
        
        
        
        
        
