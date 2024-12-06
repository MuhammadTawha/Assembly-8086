.model small
.stack 100h
.data
.code

main proc
    mov bl, 1            
             

outer:
    push bx             ; Push the current row number onto the stack (BL)

    
    mov bh, bl          ; Set BH to BL (to control how many times to print the current number)
    
inner:
    mov dl, bl          ; Move the current number to DL
    add dl , 48
    mov ah, 2           
    int 21h             

    dec bh              ; Decrement BH (to control the number of times printed)
    cmp bh, 0           
    jne inner           

    ; next line
    mov dl, 13          
    mov ah, 2           
    int 21h             

    mov dl, 10          
    mov ah, 2           
    int 21h             
    
    pop bx              
    inc bl              ; Increment BL for the next row
    cmp bl, 6           
    jne outer           

    mov ah, 4Ch         
    int 21h             

main endp
end main
