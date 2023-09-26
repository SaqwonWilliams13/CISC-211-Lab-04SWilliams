/*** asmFunc.s   ***/
/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified

#include <xc.h>

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
/* define and initialize global variables that C can access */

.global balance,transaction,eat_out,stay_in,eat_ice_cream,we_have_a_problem
.type balance,%gnu_unique_object
.type transaction,%gnu_unique_object
.type eat_out,%gnu_unique_object
.type stay_in,%gnu_unique_object
.type eat_ice_cream,%gnu_unique_object
.type we_have_a_problem,%gnu_unique_object

/* NOTE! These are only initialized ONCE, right before the program runs.
 * If you want these to be 0 every time asmFunc gets called, you must set
 * them to 0 at the start of your code!
 */
balance:           .word     0  /* input/output value */
transaction:       .word     0  /* output value */
eat_out:           .word     0  /* output value */
stay_in:           .word     0  /* output value */
eat_ice_cream:     .word     0  /* output value */
we_have_a_problem: .word     0  /* output value */

 /* Tell the assembler that what follows is in instruction memory    */
.text
.align

/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified

    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ()
     
where:
     output: the integer value returned to the C function
     
     function description: The C call ..........
     
     notes:
        None
          
********************************************************************/    
.global asmFunc
.type asmFunc,%function
asmFunc:   

    /* save the caller's registers, as required by the ARM calling convention */
    push {r4-r11,LR}
 
.if 0
    /* profs test code. */
    LDR r1,=balance
    LDR r2,[r1]
    ADD r0,r0,r2
.endif
    
    /*** STUDENTS: Place your code BELOW this line!!! **************/
    
    /* Load memory address transaction into r3 and store value at r0 into r3 */
    
  /*Setting transaction equal to zero using register r4 as a holder for 0 */
    LDR r4, =1000 /* Setting r4 to the upper threshold that transaction can lie in*/
    LDR r5, =-1000 /* Setting r5 to the lower threshold that transaction can lie in*/
    CMP r0, r4 /* Comparing vaules to see if r0 is greater than 1000*/
    BGT bad_transaction /* if r0 is > 1000 initiate bad_transaction instructions*/
    CMP r10, r5  /* Comparing vaules to see if r0 is less than 1000*/
    
    BLT bad_transaction
    
    LDR r6, =balance /*  */
    
    ADDS r7,r0,r6 
    
    /*Temporary balance stored in r6 */
    
    
    CMP r6, 0
    BGT eat_there

    CMP r6, 0
    BLT stay_home
    
    
    
    bad_transaction:
    LDR r6, =0
    STR r6, [r3]
    
    LDR r7, =we_have_a_problem
    LDR r8, =1
    STR r8, [r7]
    
    LDR r9, =balance
    STR r0, [r9]
     
    eat_there:
    LDR r7, =eat_out
    LDR r8, =1
    STR r8, [r7]
    STR r0, [r6]
    
     stay_home:
    LDR r7, =stay_in
    LDR r8, =1
    STR r8, [r7]
    STR r0, [r6]
    
    
    
    
    
    /*** STUDENTS: Place your code ABOVE this line!!! **************/

done:    
    /* restore the caller's registers, as required by the 
     * ARM calling convention 
     */
    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




