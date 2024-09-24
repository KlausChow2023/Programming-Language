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

mutex   ds.l    1               ;declare the mutex variable

ntcblst equ     4               ;number of records in tcb list,I only need 4.

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
        move.l #$12000,a0        ;tcb1 start address,12000
        move.l #0,tcbused(a0)       ;mark tcb1 as unused
        move.l #0,tcbwtim(a0)
        move.l #$14000,a0        ;tcb2 start address,14000
        move.l #0,tcbused(a0)       ;mark tcb2 as unused
        move.l #0,tcbwtim(a0)
        move.l #$16000,a0        ;tcb3 start address,16000
        move.l #0,tcbused(a0)       ;mark tcb3 as unused
        move.l #0,tcbwtim(a0)
        
        move.l #0, wttcb
        
        move.l #1,mutex  
      
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
        
        cmp #3,d7       ;Is that wait mutex
        beq sys_wait_mutex 
        
        cmp #4,d7       ;Is that signal mutex
        beq sys_signal_mutex 

        cmp #5,d7       ;Is that init mutex 
        beq sys_init_mutex


        cmp #2,d7       ;Is that delte task
        beq delete_task_function

        
        cmp #6,d7       ;Is that wait on timer
        beq sys_wait_time 

sys_init_mutex
        move.l d1,mutex
        bra sched

sys_wait_mutex
        move.l mutex,d5
        cmp #1,d5        ;check mutex available or not
        bne mutex_waitlist      ;if not, then go waitlist
        move.l #0,mutex         :if avaliable, set mutex as used
        bra sched

mutex_waitlist
    move.l a0,wttcb
    ; Remove task from ready list
    move.l tcbnext(a0),d0

    move.l rdytcb,d3
    move.l #$10000,a2

mutex_list_check      ;check is this the tcb we need to modify
    move.l tcbnext(a2),d2    
    cmp.l d3, d2
    beq mutex_link_list_change
    move.l tcbnext(a2),a2
    bra mutex_list_check

mutex_link_list_change        ;change the link list sequence
    move.l rdytcb,a3
    move.l tcbnext(a3),d4
    move.l d4, tcbnext(a2)
    bra sched
  
sys_signal_mutex
    move.l #1,mutex
    move.l wttcb, d1   ;
    cmp.l #0,d1
    beq sched
    
    move.l #0,mutex
    move.l #$10000,d3
    move.l #$10000,a2
mutex_list_check_putback      ;check is this the tcb we need to modify
    move.l tcbnext(a2),d2    
    cmp.l d3, d2
    beq mutex_link_list_change_putback
    move.l tcbnext(a2),a2
    bra mutex_list_check_putback

mutex_link_list_change_putback        ;change the link list sequence
    move.l wttcb, tcbnext(a2)
    move.l wttcb, a4
    move.l #$10000, tcbnext(a4)
    move.l #0, wttcb
    bra sched




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

        move.l #$12000,a0            
        move.l tcbused(a0),d4
        cmp #1,d4      ;check is this tcb used or not
        bne blanktcb1
        
        move.l #$14000,a0       
        move.l tcbused(a0),d4
        cmp #1,d4    ;check is this tcb used or not
        bne blanktcb2
        
        move.l #$16000,a0       
        move.l tcbused(a0),d4
        cmp #1,d4      ;check is this tcb used or not
        bne blanktcb3
        


blanktcb1
        move.l #$10000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)       :mark it as used
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        move.l d1,tcbpc(a0)
        move.l d2,tcba7(a0)         :a7 = stack pointer = ss
        
        bra sched

blanktcb2
        move.l #$12000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)       :mark it as used
        move.l #%0010000000000000,tcbsr(a0)  ; give default value of status register to any task
        move.l d1,tcbpc(a0)
        move.l d2,tcba7(a0)         :a7 = stack pointer = ss
        
        bra sched

blanktcb3
        move.l #$14000,a1
        move.l a0,tcbnext(a1)       :link to next task as a loop
       
        move.l #1,tcbused(a0)        
        move.l #$10000,tcbnext(a0)       :mark it as used
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
    move.l rdytcb,a0 ; get current running task
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

sevseg0  equ     $e0000e     ;7 segments led 
sevseg1  equ     $e0000c
sevseg2  equ     $e0000a
sevseg3  equ     $e00008
sevseg4  equ     $e00006
sevseg5  equ     $e00004
sevseg6  equ     $e00002
sevseg7  equ     $e00000


led     equ     $e00010         ;led
sw      equ     $e00014         ;switch
a       equ     $18000
b       equ     $18004
c       equ     $18008

;***********************************TASK 0*****************************************
t0:     

            ;switch off seven segment led
        move.l #0,sevseg0
        move.l #0,sevseg1
        move.l #0,sevseg2
        move.l #0,sevseg3
        move.l #0,sevseg4
        move.l #0,sevseg5
        move.l #0,sevseg6
        move.l #0,sevseg7
        
        move.l #0,a
        move.l #0,b
        move.l #0,c
                        
        move.l  #syscr,d0       ;start task 1
        move.l  #t1,d1          ;address of task 1 will be save in data register 1£¨d1£©
        move.l  #$4000,d2           :4000 is stack pointer(sp or ss) address       
        trap    #sys       
        
        move.l  #syscr,d0       ;start task 2
        move.l  #t2,d1          ;address of task 2 will be save in data register 1£¨d1£©
        move.l  #$5000,d2           :5000 is stack pointer(sp or ss) address
        trap    #sys     
        
                        ;repeat
sevenseg_display: 
        ; to compute a+b-c
        move.l (a),d2
        move.l (b),d3
        add.l d2,d3
        move.l (c),d4
        sub.l d4,d3
        
        
        move.l d3,d5
        and.l #$0F,d5
        move.l  #kseg,a0    ;  set FIRST DIGIT display 
        add.l   d5,a0     
        move.b  (a0),d0   
        move.b  d0,sevseg0 
        
        move.l d3,d5
        and.l #$F0,d5
        lsr.b #4,d5         ;1 byte shift
        
        move.l  #kseg,a0    ;  set FIRST DIGIT display 
        add.l   d5,a0     
        move.b  (a0),d0   
        move.b  d0,sevseg1 
       
        bra     sevenseg_display
;***********************************TASK 1*****************************************        
        
t1:                              
        move.l  a,d0        ;  increment a 
        add.l   #1,d0 
        move.l  d0,a 
                             ;  critical section starts 
        move.l #syswtmx,d0 
        trap    #sys           
     
        move.l  c,d0        ;  increment c 
        add.l   #1,d0 
        move.l  d0,c 
        
        move.l #syssgmx,d0   
        trap    #sys            ; software interrupt
                             ;  critical section ends 

        bra     t1
;***********************************TASK 2*****************************************        
t2:    

        move.l  b,d0        ;increment b 
        add.l   #1,d0 
        move.l  d0,b 
                            ;  critical section starts 
        move.l #syswtmx,d0 
        trap    #sys    
         
        move.l  c,d0        ;increment c 
        add.l   #1,d0 
        move.l  d0,c 
        
        
        move.l #syssgmx,d0   
        trap    #sys            ; software interrupt
                                 ;  critical section ends 
                          
        bra     t2

                 
kseg                        ;7-seg display patterns 
        dc.b    $3f         ;0 
        dc.b    $06         ;1 
        dc.b    $5b         ;2 
        dc.b    $4f         ;3 
        dc.b    $66         ;4 
        dc.b    $6d         ;5 
        dc.b    $7d         ;6 
        dc.b    $07         ;7 
        dc.b    $7f         ;8 
        dc.b    $67         ;9 
        dc.b    $77         ;A 
        dc.b    $7c         ;b 
        dc.b    $39         ;C 
        dc.b    $5e         ;d 
        dc.b    $79         ;E 
        dc.b    $71         ;F 
        dc.b    $80         ;.

        END    res  


        move.l #sysinmx,d0   
        move.l #1,d1
        trap    #sys            ; software interrupt






















































































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
