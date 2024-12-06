
.model small
.stack 100h
.data
tty db 'THE AVERAGE IS: $' ; varible to store sthe string
.code

     main proc
            mov ax,@data  ; call the data section
            mov ds,ax     ; move to data segment
            
            LEA dx, tty   ; LEA is a load affective address that stores first character address 
             mov ah,9     ; interupt to display string
             int 21h
            mov ax, 3    ; mov value to ax register 
            add ax, 4    ; add value to ax simultanuously
            add ax, 5
            add ax, 3
            add ax, 5
            
            mov dl,5        ; store the total numbers that are being divided by sum to dl rsgister
            
            div dl          ; ax/dl  
            add ax, 48      ; add 48 to display that result
            mov dx,ax       ; to display  
            
            mov ah,2        ; to display  integers
            int 21h         ; interupt
            
            mov ah,4ch
            int 21h
            
         main endp
     end main
        
        
        
        
        
