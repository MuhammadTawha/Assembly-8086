.model small
.stack 100h
.data
arrnum dw 0,1,2,3,4,5,6,7,8,9  
.code

sum_array macro array_ADDRES, count, result
    ; Initialize the sum to zero
    mov bx, 0                   
    lea di, array_ADDRES           ; Load array ADDRES
    mov cx, count               ; Set loop counter

sum_loop:
    mov ax, [di]                ; Load current element
    add bx, ax                  ; Add to sum
    add di, 2                   ; Move to next element (word size)
    loop sum_loop               ; Loop until CX is 0
    mov result, bx              ; Store the result in provided variable
endm

display_average macro sum, count
    ; Calculate the average
    mov ax, sum
    mov cx, count
    div cx                      ; Divide sum by count

    add al, 48                 
    mov dl, al                 
    mov ah, 2                  
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax

    ; Call sum_array macro to get the sum of array elements
    sum_array arrnum, 10, bx

    ; Call display_average macro to display the average
    display_average bx, 10

    ; Exit the program
    mov ah, 4Ch    
    int 21h
main endp
end main
