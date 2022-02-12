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
;input array @ R0
;support up to 10 centroids
;find gradient of array from [R1:R10]

;find change in gradient from [R1:R10]

;find 75th percentile of change in gradient

;get last n value that passes the 75th percentile

SUBROUTINE:

