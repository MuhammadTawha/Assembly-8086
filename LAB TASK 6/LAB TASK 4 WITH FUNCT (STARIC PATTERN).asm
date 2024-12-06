.model small
.stack 100h
.data
.code

main proc
    mov bl, 1           ; Initialize BL as the outer loop counter (for rows)

outer:
    call print_stars     ; Call function to print stars for the current row
    call print_newline   ; Call function to move to the next line

    inc bl               ; Move to the next row
    cmp bl, 6            ; Check if BL has reached 6 (5 rows printed)
    jne outer           

    mov ah, 4Ch         
    int 21h              
main endp


print_stars proc
    mov bh, bl          ; Set BH to BL (to control how many stars to print per row)

inner:
    mov dl, '*'       
    mov ah, 2         
    int 21h             

    dec bh             
    cmp bh, 0          
    jne inner          

    ret
print_stars endp

print_newline proc
    mov dl, 13          ; Carriage return
    mov ah, 2           
    int 21h             

    mov dl, 10          ; Line feed
    mov ah, 2           
    int 21h             

    ret
print_newline endp

end main
