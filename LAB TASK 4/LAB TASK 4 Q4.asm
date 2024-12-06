.model small
.stack 100h
.data
.code

main proc
    mov bl, 1           ; Initialize BL as the outer loop counter (for rows)

outer:
    mov bh, bl          ; Set BH to BL (to control how many stars to print per row)

inner:
    mov dl, '*'         
    mov ah, 2           
    int 21h             

    dec bh              ; Decrement BH (to control the number of stars printed)
    cmp bh, 0           ; Check if we've printed enough stars for the current row
    jne inner           ; If BH is not 0, repeat the inner loop to print more stars

    ; Move to the next line
    mov dl, 13          
    mov ah, 2           
    int 21h             

    mov dl, 10          
    mov ah, 2           
    int 21h             

    inc bl              
    cmp bl, 6           ; Check if BL has reached 6 (5 rows printed)
    jne outer           

    
    mov ah, 4Ch         
    int 21h             

main endp
end main
