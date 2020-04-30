.text
.global fun
string: .string "zawartosc rejestru %d\n"
fun:
	pushl %ebp		
	movl %esp, %ebp

	movl	8(%ebp), %eax
	#pushl %eax
	#pushl $string
	#call printf
	#addl $8, %esp
	
	cmp $0, %eax
	jb skok

	rdtscp
	jmp po
	
skok:
	xor %eax,%eax
	cpuid	
	rdtsc
	
po:
	movl %ebp, %esp
	pop %ebp	
	ret
