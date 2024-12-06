
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
    call PrintNumber   

    dec bh              ; Decrement BH (to control the number of times printed)
    cmp bh, 0           
    jne inner           ; Repeat inner loop until BH is 0

    call NewLine       

    pop bx              ; Restore the row number from the stack
    inc bl              ; Increment BL for the next row
    cmp bl, 6           
    jne outer           ; Repeat outer loop until BL is 6

    mov ah, 4Ch         
    int 21h            

main endp

; Function to print a number (in DL)
PrintNumber proc
    mov dl, bl          ; Move the current number to DL
    add dl, 48          ; Convert number to ASCII
    mov ah, 2           
    int 21h            
    ret
PrintNumber endp

NewLine proc
    mov dl, 13          
    mov ah, 2           
    int 21h             
    mov dl, 10         
    mov ah, 2           
    int 21h            
    ret
NewLine endp

end main
