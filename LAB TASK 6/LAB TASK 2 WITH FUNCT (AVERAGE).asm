.model small
.stack 100h
.data
tty db 'THE AVERAGE IS: $'  
.code

main proc
    
    mov ax, @data
    mov ds, ax

    ; Display the string
    LEA dx, tty
    call printstr

    ; Calculate the average
    call calc_average

    ; Display the result
    call printnum

    
    mov ah, 4Ch
    int 21h
main endp

printstr proc
    mov ah, 9
    int 21h
    ret
printstr endp

calc_average proc
    mov ax, 3   
    add ax, 4   
    add ax, 5   
    add ax, 3   
    add ax, 5    
    
    mov dl, 5    ; Total count of numbers
    div dl       
    ret
calc_average endp


printnum proc
    add ax, 48   
    mov dl, al   
    mov ah, 2    
    int 21h
    ret
printnum endp

end main
