	.file	"zad1.c"
	.text
	.globl	fib_it
	.type	fib_it, @function
fib_it:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$1, -16(%ebp)
	movl	$1, -12(%ebp)
	movl	$1, -8(%ebp)
	movl	$1, -4(%ebp)
	jmp	.L2
.L3:
	movl	-12(%ebp), %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L3
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fib_it, .-fib_it
	.globl	test
	.type	test, @function
test:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movzbl	-4(%ebp), %eax
	addl	$1, %eax
	movb	%al, -4(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	test, .-test
	.section	.rodata
.LC0:
	.string	"fib %u\n"
.LC1:
	.string	"%llu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$36, %esp
	movl	$0, -36(%ebp)
	jmp	.L7
.L8:
	call	fun
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	subl	$12, %esp
	pushl	$127
	call	fib_it
	addl	$16, %esp
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	call	fun
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	subl	-32(%ebp), %eax
	sbbl	-28(%ebp), %edx
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	addl	$1, -36(%ebp)
.L7:
	cmpl	$9, -36(%ebp)
	jle	.L8
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
