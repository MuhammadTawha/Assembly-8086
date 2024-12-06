.model small
.stack 100h
.data
.code

main proc
    mov dl, '1'         ; Initialize DL with character '1', which will be printed first
    mov bl, 0           ; Initialize BL as a counter for the outer loop

outer:
    mov bh, 4           ; Initialize BH with 4, to control the inner loop (4 iterations)

inner:
    mov ah, 2           
    int 21h             ; Display the character in DL starting from '1'

    inc dl              ; Increment DL to move to the next character '2', '3...'
    dec bh              ; Decrement BH counter
    cmp bh, 0           
    jne inner           ; If BH is not 0, repeat the inner loop

    mov cl, dl          ; Save the current DL value (the next character to be printed) in CL

    mov dl, 10          
    mov ah, 2           
    int 21h             

    mov dl, 13          
    mov ah, 2           
    int 21h            

    mov dl, cl          ; Restore DL to the next character to print in the outer loop
    inc bl             
    cmp bl, 2           ; Check if BL has reached 2 (end of outer loop)

    jne outer          

    jmp exit           

exit:
    mov ah, 4Ch        
    int 21h            

main endp
end main

 
           