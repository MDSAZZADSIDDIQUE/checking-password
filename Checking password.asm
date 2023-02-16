.model small
.stack 100h
.data
str db 'Enter your password:$'
str2 db 'mypassword$'
str1 db 100 dup('$')  
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, str
    int 21h
    
    mov si, offset str1
    
    l1:
    mov ah, 1
    int 21h
    
    cmp al, 13
    je programmed
    mov [si], al
    inc si
    jmp l1
    
    mov cl, str2
    
    programmed:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov ah, 9
    mov dx, offset str1

    int 21h
    mov ah, 4ch
    int 21h
    main endp
end main