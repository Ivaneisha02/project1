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

loop:
    lb $t3, ($a0) 
    beqz $t3, done

    addi $a0, $a0, 1
    addi $t0, $t0, 1

    ble $t3, 57, next
    #load each char into a1
    #increment length and char


 