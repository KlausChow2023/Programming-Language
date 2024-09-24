*-----------------------------------------------------------
* Title      : RTS
* Written by : Shihao Zhou
* Date       : 2024/08/01
* Description: RTS 
*-----------------------------------------------------------
                                ;system call equates
sys     equ     0               ; system call trap (trap 0)
syscr   equ     1               ; create new task
sysdel  equ     2               ; delete task
syswtmx equ     3               ; wait on mutex
syssgmx equ     4               ; signal mutex
sysinmx equ     5               ; initialise mutex 
syswttm equ     6               ; wait on timer

usrcode equ     $1000           ;address of user task 0
usrstk  equ     $8000           ;address of user stack

ntcblst equ     4               ;number of records in tcb list,I only need 4

tcb     org     0               ;tcb record
tcbd0   ds.l    1               ; D register save
tcbd1   ds.l    1
tcbd2   ds.l    1
tcbd3   ds.l    1
tcbd4   ds.l    1
tcbd5   ds.l    1
tcbd6   ds.l    1
tcbd7   ds.l    1
tcba0   ds.l    1               ; A register save
tcba1   ds.l    1
tcba2   ds.l    1
tcba3   ds.l    1
tcba4   ds.l    1
tcba5   ds.l    1
tcba6   ds.l    1
tcba7   ds.l    1
tcbsr   ds.l    1               ; SR (status reg) save
tcbpc   ds.l    1               ; PC save          
tcbnext ds.l    1               ; link to next record
tcbused ds.l    1               ; record in use flag
tcbwtim ds.l    1               ; timer wait expiry time
tcblen  equ     *               ; length of tcb record

;******************************************************************************
rts                                     ;RUNTIME SYSTEM
;******************************************************************************
   
;******************************************************************************
                                        ;INTERRUPT VECTORS
;******************************************************************************

        org     0
        
        dc.l    usrstk                  ; initial SP
        dc.l    res                     ; reset
        ds.b    $5C             ;Hardware interrupt address, every automatic hardware interrupt execution enters the fltint

        dc.l    fltint                  ; interrupt 1 (timer)
        ds.b    $18             ;Software interrupt address, every trap #0 execution goes to flsint
        dc.l    flsint                  ; trap 0 (system call)
        
;*******************************************************************************        
res                                     ;RESET
;*******************************************************************************

        move.l #$10000,a0        ;tcb0 start address,10000
        move.l #0,tcbused(a0)       ;mark tcb0 as unused
        move.l #0,tcbwtim(a0)       ;initialize the wait time to 0
        move.l #$12000,a0      
        move.l #0,tcbused(a0)       ;mark tcb1 as unused
        move.l #0,tcbwtim(a0)
        move.l #$14000,a0        
        move.l #0,tcbused(a0)       ;mark tcb2 as unused
        move.l #0,tcbwtim(a0)
        move.l #$16000,a0        
        move.l #0,tcbused(a0)       ;mark tcb3 as unused
        move.l #0,tcbwtim(a0)
        
        move.l #0, wttcb
        
create_task0:
        move.l #$10000,a0  
        move.l #1,tcbused(a0)        ;mark tcb0 as used
        move.l #$10000,tcbnext(a0)       ;link to itself as a loop,because now we only have 1 task
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        
        move.l a0,rdytcb        :put task 0 in ready list(link list)
        
        bra t0
;*******************************************************************************        
flih                                    ;FIRST-LEVEL INTERRUPT HANDLER
;*******************************************************************************

fltint                                  ;ENTRY FROM TIMER INTERRUPT  
        move.l  d0,d0sav                ;save D0
        move.l  #$0,d0                  ;set id = 0
        move.l  d0,id
        move.l  d0sav,d0                ;restore D0
        bra     fl1  

flsint                                  ;ENTRY FROM TRAP (SOFTWARE INTERRUPT)
        or      #%0000011100000000,sr   ;disable hardware interrupts
        move.l  d0,id                   ;store id,every time I check the value of "id ',i can undersdtand which function I am using.
        bra     fl1
       
fl1     move.l  a0,a0sav                ;save working reg
        
        move.l  rdytcb,a0               ;A0 ^ 1st ready tcb (ie running tcb)
            
        move.l  d0,tcbd0(a0)            ;store registers
        move.l  d1,tcbd1(a0)       
        move.l  d2,tcbd2(a0)
        move.l  d3,tcbd3(a0) 
        move.l  d4,tcbd4(a0)
        move.l  d5,tcbd5(a0)       
        move.l  d6,tcbd6(a0)
        move.l  d7,tcbd7(a0)
        move.l  a0sav,d0 
        move.l  d0,tcba0(a0)
        move.l  a1,tcba1(a0)       
        move.l  a2,tcba2(a0)
        move.l  a3,tcba3(a0) 
        move.l  a4,tcba4(a0)
        move.l  a5,tcba5(a0)       
        move.l  a6,tcba6(a0)

        move    (sp),d0                 ;pop and store SR
        add.l   #2,sp              
        move.l  d0,tcbsr(a0)
        
        move.l  (sp),d0                 ;pop and store PC
        add.l   #4,sp
        move.l  d0,tcbpc(a0)
        
        move.l  a7,tcba7(a0)            ;store SP 
        
;******************************************************************************
serv                                    ;SERVICE ROUTINES
;******************************************************************************
        move.l id,d7
        
        cmp #0,d7       ;Is that system call trap (trap 0)
        beq timer_interrupt  
        
        cmp #1,d7       ;Is that create new task
        beq create_task_function
        
        cmp #2,d7       ;Is that delte task
        beq delete_task_function

        
        cmp #6,d7       ;Is that wait on timer
        beq sys_wait_time ;wait time system call

   


timer_interrupt
    move.l wttcb, d1   ;
    cmp.l #0,d1
    beq sched

check_waiting_tasks: 
    move.l wttcb, a1
    move.l tcbwtim(a1),d0

    sub.l #1,d0 ; decrement wait counter
    move.l d0,tcbwtim(a1)
    cmp.l #0,d0
    bne sched
    
    ; Move task from wait list to ready list
    
    move.l #$10000,d3
    move.l #$10000,a2
list_check_putback      ;check is this the tcb we need to modify
    move.l tcbnext(a2),d2    
    cmp.l d3, d2
    beq link_list_change_putback
    move.l tcbnext(a2),a2
    bra list_check_putback

link_list_change_putback        ;change the link list sequence
    move.l wttcb, tcbnext(a2)
    move.l wttcb, a4
    move.l #$10000, tcbnext(a4)
    move.l #0, wttcb
    bra sched
    


create_task_function

        move.l #$12000,a0            ;tcb1 start address,12000
        move.l tcbused(a0),d4
        cmp #1,d4      ;check is this tcb used or not
        bne blanktcb1
        
        move.l #$14000,a0        ;tcb2 start address,14000
        move.l tcbused(a0),d4
        cmp #1,d4    ;check is this tcb used or not
        bne blanktcb2
        
        move.l #$16000,a0        ;tcb3 start address,16000
        move.l tcbused(a0),d4
        cmp #1,d4      ;check is this tcb used or not
        bne blanktcb3
        


blanktcb1
        move.l #$10000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)    
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        move.l d1,tcbpc(a0)
        move.l d2,tcba7(a0)         :a7 = stack pointer = ss
        
        bra sched

blanktcb2
        move.l #$12000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)     
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        move.l d1,tcbpc(a0)
        move.l d2,tcba7(a0)         :a7 = stack pointer = ss
        
        bra sched

blanktcb3
        move.l #$14000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)     
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        move.l d1,tcbpc(a0)
        move.l d2,tcba7(a0)         :a7 = stack pointer = ss
        
        bra sched

delete_task_function
        move.l rdytcb,a0 ; get current running task
        move.l #0,tcbused(a0)
        
    move.l rdytcb,d3
    move.l #$10000,a2

list_check_delete      ;check is this the tcb we need to modify
    move.l tcbnext(a2),d2    
    cmp.l d3, d2
    beq link_list_change_delete 
    move.l tcbnext(a2),a2
    bra list_check_delete 

link_list_change_delete         ;change the link list sequence
    move.l rdytcb,a3
    move.l tcbnext(a3),d4
    move.l d4, tcbnext(a2)
    bra sched
        

        
 



        
sys_wait_time:
    ; d1 contains the number of timer intervals to wait
    move.l rdytcb,a0 ; get current running task address
    move.l d1,tcbwtim(a0) ; set wait time

    ; Add task to wait list
    move.l a0,wttcb
    ; Remove task from ready list
    move.l tcbnext(a0),d0

    move.l rdytcb,d3
    move.l #$10000,a2     

list_check      ;check is this the tcb we need to modify
    move.l tcbnext(a2),d2    
    cmp.l d3, d2
    beq link_list_change
    move.l tcbnext(a2),a2
    bra list_check

link_list_change        ;change the link list sequence
    move.l rdytcb,a3
    move.l tcbnext(a3),d4
    move.l d4, tcbnext(a2)
    bra sched   
;*******************************************************************************
sched                                   ;SCHEDULER  
;*******************************************************************************
        move.l rdytcb,a2
        move.l tcbnext(a2),a3
        move.l a3,rdytcb
        

;*******************************************************************************        
disp                                    ;DISPATCHER 
;*******************************************************************************

        move.l  rdytcb,a0               ;A0 ^ new running tcb
        move.l  tcbd1(a0),d1            ;restore registers      
        move.l  tcbd2(a0),d2
        move.l  tcbd3(a0),d3 
        move.l  tcbd4(a0),d4
        move.l  tcbd5(a0),d5       
        move.l  tcbd6(a0),d6
        move.l  tcbd7(a0),d7
        move.l  tcba1(a0),a1       
        move.l  tcba2(a0),a2
        move.l  tcba3(a0),a3 
        move.l  tcba4(a0),a4
        move.l  tcba5(a0),a5       
        move.l  tcba6(a0),a6
        move.l  tcba7(a0),a7

        sub.l   #4,sp                   ;push PC
        move.l  tcbpc(a0),d0            
        move.l  d0,(sp)   

        sub.l   #2,sp           
        move.l  tcbsr(a0),d0            ;push SR
        move    d0,(sp)
        
        move.l  tcbd0(a0),d0            ;restore remaining registers
        move.l  tcba0(a0),a0
        
        rte                             ;return

;*******************************************************************************
                                        ;RTS variables
;*******************************************************************************

tcblst  ds.b    tcblen*ntcblst          ;tcb list
rdytcb  ds.l    1                       ;^ ready tcb list
wttcb   ds.l    1                       ;^ waiting tcb
a0sav   ds.l    1                       ;A0 temporary save
d0sav   ds.l    1                       ;D0 temporary save
id      ds.l    1                       ;function id
time    ds.l    1                       ;system time
        
;*******************************************************************************
                                        ;USER APPLICATION TASKS
;*******************************************************************************
        
        org     usrcode

led     equ     $e00010         ;led
sw      equ     $e00014         ;switch
;***********************************TASK 0*****************************************
t0:                             
        move.l  #syscr,d0       ;start task 1
        move.l  #t1,d1          ;address of task 1 will be save in data register 1£¨d1£©
        move.l  #$4000,d2           :4000 is stack pointer(sp or ss) address       
        trap    #sys       
        
        move.l  #syscr,d0       ;start task 2
        move.l  #t2,d1          ;address of task 2 will be save in data register 1£¨d1£©
        move.l  #$5000,d2           :5000 is stack pointer(sp or ss) address
        trap    #sys
    
        move.l  #syscr,d0       ;start task 3
        move.l  #t3,d1          ;address of task 3 will be save in data register 1£¨d1£©
        move.l  #$6000,d2           :6000 is stack pointer(sp or ss) address
        trap    #sys     
                        ;repeat
led_on0:    move.l  #$01,d1         ;  set led 0
           move.b  d1,led
        
           bra     led_on0
;***********************************TASK 1*****************************************        
t1:                              
                                ;repeat
        move.l  #$02,d0         ;  set led 1
        move.b  d0,led
       
        bra     t1


;***********************************TASK 2-delete*****************************************        
t2:                              
                                ;repeat
        move.l #$2FFFF,d3      ;keep minus 1 until to 0
counter_t2 
        move.l  #$04,d0         ;  set led 2
        move.b  d0,led
        sub.l #1,d3
        cmp.l #0,d3
        bne counter_t2      

delete_task
        move.l  #sysdel,d0     ; delete task
        trap    #sys            ; software interrupt
        bra     t2
;***********************************TASK 3-waittime*****************************************        
t3:                              

       move.l  #syswttm,d0     ; wait time system call
       move.l  #10,d1          ; wait for 10 timer intervals
       trap    #sys            ; software interrupt

led_on3                                ;repeat
        move.l  #$08,d0         ;  set led 3
        move.b  d0,led
   
        bra     led_on3

  


        END    res  



























































































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
