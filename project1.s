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

loop_digit:
    li $t0, 1
    addi $a0, $a0, 1 
    add $t0, $t0, 1 
    bge $t3, 97, is_lower 
    j loop
    #created seperate loop for numbers

loop_letter:
    li $t0, 0 
    
    addi $a0, $a0, 1 # increment input string pointer
    add $t0, $t0, 1 # increment position counter

    
    bge $t3, 97, is_lower 
    bge $t3, 65, is_upper 
    bge $t3, 48, is_digit 
    j loop
    #created letter loop to check letters seperately

is_digit:
    ble   $t3, 48, next    
    sub $t3, $t3, 48 
    j process_digit

is_lower:
    bge $t3, 113, next
    sub $t3, $t3, 103 
    
    j process_digit

#created digit and lower labels to insure correct ranges
is_upper:
    bge $t3, 81, next

    sub $t3, $t3, 55 
    j process_digit
process_digit:
    beq $s1, 2, even
    #create upper label and process_digit label
    j odd
    j loop

next: 
    addi $t0,$t0,1
    j loop
even:
    sub $t1, $t1, $t3   
    addi $s1,$s1,1
    j loop
#created next and even laels

 