/*
 * classification.s
 *
 *  Created on: 2021/8/26
 *      Author: Gu Jing
 */
   .syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

		.global optimalCluster

@ Start of executable code
.section .text

@ EE2028 Assignment 1, Sem 1, AY 2021/22
@ (c) ECE NUS, 2021

@ Write Student 1’s Name here:
@ Write Student 2’s Name here:

@ You could create a look-up table of registers here:



@ write your program from here:
optimalCluster:
;adress of input array @ R0
;adress of number of cluster @ R1
;find gradient of array from [R1:R10]
    LDR R12,#2 ;loop counter (offfset of 2 because we run N-1 times)
    LDR R10,[GRAD] ;original value of GRAD to reset the loop later
L1:
    LDR R2,[R0] ;load current value
    LDR R3,[R0,#4]  ;load next value(always smaller then current value)
    SUB R2,R3 ;subtract next value from current value
    STR R2,[GRAD],#4 ;store result in GRAD
    ADD R12,#1 ;increase loop counter
    CMP R12,R1 ;compare loop counter with number of cluster
    BNE L1 ;if not equal, jump to L1
;find change in gradient from [R1:R10]
    LDR R12,#2 ; loop counter
    STR R10,[GRAD] ;reset the GRAD iterator
    LDR R10,[DGRA] ;original value of DGRA to reset the loop later
    LDR R11,#0 ;keep track of total sum of DGRA to find average
L2:
    LDR R2,[GRAD] ;load current value
    LDR R3,[GRAD,#4]  ;load next value(always smaller then current value)
    SUB R2,R3 ;subtract next value from current value
    STR R2,[DGRA],#4 ;store result in DGRA
    ADD R11,R2 ;add current value to total sum
    ADD R12,#1 ;increase loop counter
    CMP R12,R1 ;compare loop counter with number of cluster
    BNE L2 ;if not equal, jump to L2
;find 75th percentile of change in gradient
    SDIV R11,R1 ;divide total sum by number of cluster to find average.
    MUL R11,#2 ;multiply by 2 to get 75th percentile
;get last n value that passes the average
;loop through DGRA to find values that are greater than 75th percentile
;store the index to R0 and return
    LDR R12,#2 ;loop counter
L3:
    LDR R2,[DGRA] ;load current value
    CMP R2,R11 ;compare current value to average
    BGE L4 ;if greater than or equal, jump to L4
    ADD R12,#1 ;increase loop counter
    CMP R12,R1 ;compare loop counter with number of cluster
    BNE L3 ;if not equal, jump to L3
L4:
    STR R12,[R0] ;store index to R0
    BX LR ;return

@ Equates

.lcomm  GRAD 100 ; Gradient list
.lcomm  DGRA 100 ; Delta of gradient


