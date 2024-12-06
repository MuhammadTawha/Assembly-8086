.model small
.stack 100h
.data
.code
main proc
    
    mov cx, 26          ; Count of letters a to z
    mov dl, 'z'         ; Starting character

print_loop:
    mov ah, 2           ; Function to display a character
    int 21h            
    dec dl              ; Move to the previous character
    loop print_loop     

    mov ah, 4ch         
    int 21h
main endp
end main