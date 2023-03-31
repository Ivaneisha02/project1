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

    li $s1, 1
    li $t0, 0
    li $t1, 0
    li $t2, 0
    #initialized input lenght, even and odd trackers

loop:
    add $t0, $t0, 1
    lb $t3, ($a0) 
    beqz $t3, done

    #addi $a0, $a0, 1
    #addi $t0, $t0, 1

    bge $t3, 97, loop_digit 
    bge $t3, 65, loop_letter 
    bge $t3, 48, loop_letter  
    j next


 