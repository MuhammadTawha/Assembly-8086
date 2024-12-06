.model small
.stack 100h
.data
var1 db "PLEASE SELECT THE NUMBER FROM THE FOLLOWING ",10,13,"1. ADDITION ",10,13,"2. SUBTRACTION ",10,13,"3. DIVISION $"
var2 db "ENTER FIRST NUMBER: $"
var3 db "ENTER SECOND NUMBER: $"
num1 db ?                    ; Stores the first input number
num2 db ?                    ; Stores the second input number
result db ?                  ; Stores the result of the operation
menucice db ?                ; Stores user's menu choice
displ db "THE RESULT IS: $"  ; Result display message

.code
main proc
    mov ax, @data
    mov ds, ax               ; Initialize data segment
    
    call display_menu
    call space
    call user_input          ; Get user choice
    
    cmp al, '1'
    je addd
    cmp al, '2'
    je subs
    cmp al, '3'
    je divis
    jmp exit                 ; Exit if input is invalid

addd:
    call two_numinput
    call addition            ; Call addition function
    call display_result
    jmp exit 

subs:
    call two_numinput
    call substraction        ; Call subtraction function
    call display_result
    jmp exit

divis:
    call two_numinput
    call division            ; Call division function
    call display_result

exit:
    mov ah, 4ch              ; Exit program
    int 21h
main endp

display_menu proc
    lea dx, var1
    mov ah, 9
    int 21h                  ; Display menu options
    ret
display_menu endp

user_input proc
    mov ah, 1
    int 21h
    mov menucice, al         ; Store menu choice
    ret
user_input endp

two_numinput proc
    call space
    lea dx, var2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48               ; Convert ASCII to number
    mov num1, al             ; Store first number

    call space
    lea dx, var3
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48               ; Convert ASCII to number
    mov num2, al             ; Store second number
    ret
two_numinput endp

addition proc
    mov al, num1
    add al, num2
    mov result, al           ; Store result of addition
    ret
addition endp

substraction proc
    mov al, num1
    sub al, num2
    mov result, al           ; Store result of subtraction
    ret
substraction endp

division proc
    mov al, num1
    mov ah, 0
    div num2
    mov result, al           ; Store quotient as result
    ret
division endp

display_result proc
    call space
    lea dx, displ
    mov ah, 9
    int 21h                  ; Display result message
    
    mov dl, result
    add dl, 48               ; Convert result to ASCII
    mov ah, 2
    int 21h                  ; Display single-digit result
    ret
display_result endp

space proc
    mov dl, 10
    mov ah, 2
    int 21h                  ; Line feed
    mov dl, 13
    int 21h                  ; Carriage return
    ret
space endp

end main