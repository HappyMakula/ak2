.data
	potb:	.float 3
	pota:	.float 2
	pot2:	.float 2
	pot1:	.float 1
	pot3:	.float 3
	pot4:	.float 4
	pot2048:	.float 2048
	pot0:	.float 0
	pot:    .float 0
	.global fun, fun1
.text

fun:
	pushl %ebp		
	movl %esp, %ebp
	xor %eax, %eax	
	pushl %ebx	
	cpuid
	rdtsc
	popl %ebx
	movl %ebp, %esp
	popl %ebp	
	ret
fun1:

	pushl pot0	
	pushl pot0	
	pushl pot0
	pushl pot0
	MOVUPS (%esp), %xmm0
	addl $16, %esp	

	pushl pota	
	pushl pota	
	pushl pota
	pushl pota
	MOVUPS (%esp), %xmm1 #a
	addl $16, %esp
	
	pushl potb	
	pushl potb	
	pushl potb
	pushl potb
	MOVUPS (%esp), %xmm2 #b
	addl $16, %esp

	SUBPS %xmm1, %xmm2 #b-a

	pushl pot2048	
	pushl pot2048	
	pushl pot2048
	pushl pot2048
	MOVUPS (%esp), %xmm3
	addl $16, %esp
	
	MOVAPS %xmm2, %xmm7
	DIVPS %xmm3, %xmm7 #(b-a)/2048
	
	pushl pot1
	pushl pot2
	pushl pot3
	pushl pot4
	MOVUPS (%esp), %xmm4
	addl $16, %esp

	pushl pot4
	pushl pot4
	pushl pot4
	pushl pot4
	MOVUPS (%esp), %xmm6
	addl $16, %esp	
	
licz:
	MOVAPS %xmm4, %xmm5# zachowuję n	
	#DIVPS %xmm3, %xmm4 #n/2048 n-numer odcinka
	#MULPS %xmm2, %xmm4 #n/2048*(B-A)
	MULPS %xmm7, %xmm5 #n*(B-A)/2048
	ADDPS %xmm1, %xmm5#A+n/2048*(B-A) (x)
	MULPS %xmm5, %xmm5 #(x)^2
	#DIVPS %xmm3, %xmm5 #x^2 *(1/2048) = x^2/2048
	#MULPS %xmm2, %xmm5 #x^2 *(b-a)/2048
	MULPS %xmm7, %xmm5 #(B-A)/2048*x^2
	ADDPS %xmm5, %xmm0 #dodanie do calki
	#MOVAPS %xmm5, %xmm4 #oszyskuje n
	
	COMISS pot2048, %xmm4
	je koniec

	addps %xmm6, %xmm4 #zwiększ x
	
	jmp licz 
koniec:	
	MOVHLPS %xmm0, %xmm2
	ADDPS %xmm2, %xmm0
	UNPCKLPS %xmm2, %xmm0
	MOVHLPS %xmm0, %xmm2
	addss %xmm2, %xmm0

	MOVD %xmm0, pot
	fld pot
	ret

