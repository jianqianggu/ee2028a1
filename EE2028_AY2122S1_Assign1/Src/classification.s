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

		.global classification

@ Start of executable code
.section .text

@ EE2028 Assignment 1, Sem 1, AY 2021/22
@ (c) ECE NUS, 2021

@ Write Student 1’s Name here:
@ Write Student 2’s Name here:

@ You could create a look-up table of registers here:
@R0 = points[M][2] where M is the number of pts
@R1 = centroids[N][2] where N is the number of centroids
@R2 = class[M] where M is the classification [1,N)
@R3 = new_centroids?, likely unused , will save for find_new_centroids

@ write your program from here:
classification:
	PUSH {R0-R12,R14}
	@store the centroids

	LDR R3,[R0] @R3 = X value of first centroid
	LDR R4,[R0,#4] @R4 = Y value of first centroid
	LDR R5,[R0,#4]@R5 = X value of second centroid
	LDR R6,[R0,#4]@R6 = Y value of second centroid
	LDR R7,[R0,#4]@R7 = X value of third centroid
	LDR R8,[R0,#4]@R8 = Y value of third centroid
	@find distance

	MOV R1,#0 @loop counter, since centroids already loaded, can discard
L1:
	@distance of first pt
	LDR R9,[R1] @R9 = x value of pt
	LDR R10,[R1],#4 @R10= y value of pt
	SUB R9,R3@R9 = x value of pt - x value of centroid
	SUB R10,R4@R10 = y value of pt - y value of centroid
	MUL R9,R9,R9@R9 = value squared
	MUL R10,R10,R10@R10 = value squared
	ADD R9,R10@R9 = sum of squares
	@distance to 2nd pt
	LDR R10,[R1] @R10 = x value of pt
	LDR R11,[R1],#4@R11= y value of pt
	SUB R10,R3@R10 = x value of pt - x value of centroid
	SUB R11,R4@R11 = y value of pt - y value of centroid
	MUL R10,R10,R10@R10 = value squared
	MUL R11,R11,R11@R11 = value squared
	ADD R10,R11@R10 = sum of squares
	@distance to 3rd pt
	LDR R11,[R1] @R10 = x value of pt
	LDR R12,[R1],#4@R11= y value of pt
	SUB R11,R3@R10 = x value of pt - x value of centroid
	SUB R12,R4@R11 = y value of pt - y value of centroid
	MUL R12,R12,R12@R10 = value squared
	MUL R11,R11,R11@R11 = value squared
	ADD R11,R12@R10 = sum of squares
	@find smallest distance
	CMP R9,R10@find smaller distance
	BLT L2
	BGT L3
	STR R2,[R12],#4@ store the classification in OUT
	@loop logic
	ADD R1,#1@increment loop counter
	#CMP R1,M@check if loop counter is larger then M
	BLS L1
	POP {R0-R12,R14}
	BAL END @terminate

L2:
	CMP R9,R11@find smaller distance
	ITE GT@if R9 is larger than R11
	MOVGT R12,#2@ R12(Classification) = 2
	MOVLE R12,#0@ R12(Classification) = 0
	BX LR
L3:
	CMP R10,R11@find smaller distance
	ITE GT@if R10 is larger than R11
	MOVGT R12,#2@ R12(Classification) = 2
	MOVLE R12,#1@ R12(Classification) = 0
	BX LR

END:


DATA:
	.lcomm OUT 100
