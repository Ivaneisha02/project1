.data
input: .space 11    
prompt: .asciiz "input: "
result: .asciiz "\noutput: "

.text
main:  #I created my user input field with space for 11 characters
    li $v0,4 
    la $a0, prompt
    syscall

    li $v0,8
    la $a0, input #put prompt and input into $a0
    li $a1, 11
    syscall

    li $t0, 0
    li $t1, 0
    li $t2, 0
    #initialized input lenght, even and odd trackers

 