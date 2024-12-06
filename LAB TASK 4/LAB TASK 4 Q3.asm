.model small
.stack 100h
.data
    array db "abcdefgh$"
    var1 db " Enter Alphabet To Find: $"
    var2 db " ALPHABET IS FOUND $"
    var3 db " ALPHABET IS NOT FOUND $"
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, var1
    mov ah, 9
    int 21h   

    mov ah, 1
    int 21h   

    mov si, 0          ; Initialize SI to 0 to start indexing the array
    mov cx, 8          ; Set loop counter to 8 (length of the array)

search_loop:
    mov dl, array[si]  ; Load the current character from the array into DL
    cmp dl, '$'        ; Check for the end of the string
    je not_found       ; If end of string, jump to not_found

    cmp dl, al         ; Compare the input character (in AL) with the array element (in DL)
    je found           ; If they are equal, jump to 'found'

    inc si             ; Move to the next character in the array
    loop search_loop   

not_found:
    lea dx, var3
    mov ah, 9
    int 21h            
    jmp exit           

found:
    lea dx, var2
    mov ah, 9
    int 21h            

exit:
    mov ah, 4Ch
    int 21h      

main endp
end main
